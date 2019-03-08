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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let nib = UINib(nibName: "HeadlinesCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        configureLayout()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Helpers
    private func configureLayout() {
        let numberOfItems: CGFloat = 3
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let w = (view.frame.size.width - (numberOfItems * layout.minimumInteritemSpacing))
        layout.itemSize = CGSize(width: w / 3 , height: w / 3)
    }

}


// MARK: UICollectionViewDataSource
extension HeadlinesCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HeadlinesCollectionViewCell
        
        cell.titleLabel.text = "Hello World"
        
        return cell
    }

}


// MARK: UICollectionViewDelegate
extension HeadlinesCollectionViewController {
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
}
