//
//  CollectionViewCell.swift
//  Sample123
//
//  Created by Vignesh Radhakrishnan on 07/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import UIKit

class CollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.lightGray
    }
}
