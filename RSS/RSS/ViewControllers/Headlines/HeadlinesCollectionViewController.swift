//
//  HeadlinesCollectionViewController.swift
//  RSS
//
//  Created by Karthik Personal on 3/7/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HeadlinesCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    var headlines: Headlines?

    
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
        let article = hl.articles[indexPath.row]
        cell.titleLabel.text = article.title
        if let urlToImage = article.urlToImage {
            if let url = URL(string: urlToImage) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            cell.articleImageView.image = UIImage(data: imageData)
                        }
                    }
                }
                
            }
        }
        return cell
    }

}


// MARK: UICollectionViewDelegate
extension HeadlinesCollectionViewController { }
