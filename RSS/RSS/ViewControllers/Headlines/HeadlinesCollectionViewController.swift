//
//  HeadlinesCollectionViewController.swift
//  RSS
//
//  Created by Karthik Personal on 3/7/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import UIKit

class HeadlinesCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    private var headlines: Headlines?
    private var imageCache: NSCache<NSURL, UIImage> = NSCache<NSURL, UIImage>()
    private let operations = Operations()
    private var operationsQueue: [IndexPath: ImageDownloader] = [:]
    private let reuseIdentifier = "Cell"
    
    
    // MARK: - View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionViewCell()
        configureLayout()
        fetchHeadlines()
    }

    
    // MARK: - Helpers
    private func configureLayout() {
        let numberOfItems: CGFloat = 2
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let w = (view.frame.size.width - (numberOfItems * layout.minimumInteritemSpacing))
        layout.itemSize = CGSize(width: w / numberOfItems , height: w / numberOfItems)
    }
    
    
    private func fetchHeadlines() {
        HeadlinesAPI.shared.getHeadlines { (result) in
            switch result {
            case .success(let headlines):
                self.headlines = headlines
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func registerCollectionViewCell() {
        let nib = UINib(nibName: "HeadlinesCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
}


// MARK: UICollectionViewDataSource
extension HeadlinesCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let hl = headlines else { return 0 }
        return hl.articles.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let hl = headlines else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HeadlinesCollectionViewCell
        
        let updateImageCell: ((ImageDownloader.ImageData?) -> ()) = { [weak self] imageData in
            guard let this = self, let imageData = imageData else { return }
            this.operationsQueue.removeValue(forKey: indexPath)
            this.imageCache.setObject(UIImage(data: imageData.imageData)!, forKey: imageData.imageURL as NSURL)
            DispatchQueue.main.async {
                cell.articleImageView.image = UIImage(data: imageData.imageData)
            }
            
        }
        
        let article = hl.articles[indexPath.row]
        cell.titleLabel.text = article.title
        if let imageDownloader = operationsQueue[indexPath] {
            imageDownloader.imageDataClosure = updateImageCell
        }
        
        
        if let urlToImage = article.urlToImage {
            guard let url = URL(string: urlToImage) else { return UICollectionViewCell() }
            if let image = imageCache.object(forKey: url as NSURL) {
                DispatchQueue.main.async {
                    cell.articleImageView.image = image
                }
            } else {
                let imgd = ImageDownloader(urlToImage: url)
                imgd.imageDataClosure = updateImageCell
                operations.imageDownloadQueue.addOperation(imgd)
                operationsQueue[indexPath] = imgd
            }
        }
        return cell
    }
}


// MARK: UICollectionViewDelegate
extension HeadlinesCollectionViewController { }

extension HeadlinesCollectionViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let hl = headlines else { return }
        for indexPath in indexPaths {
            if let _ = operationsQueue[indexPath] { continue}
            let article = hl.articles[indexPath.row]
            if let urlToImage = article.urlToImage {
                if let url = URL(string: urlToImage) {
                    let imgd = ImageDownloader(urlToImage: url)
                    operations.imageDownloadQueue.addOperation(imgd)
                    operationsQueue[indexPath] = imgd
                }
            }
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if let imgd = operationsQueue[indexPath] {
                imgd.cancel()
                operationsQueue.removeValue(forKey: indexPath)
            }
        }
    }
}

