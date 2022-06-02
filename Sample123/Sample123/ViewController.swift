//
//  ViewController.swift
//  Sample123
//
//  Created by Vignesh Radhakrishnan on 07/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseIdentifier", for: indexPath) as! CollectionViewCell
        cell.cellLabel.text = "\(indexPath.row)"
        return cell
    }
}
extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: collectionView.frame.size.width / 3, height: collectionView.frame.size.width / 3)
    }
}
