//
//  CollectionViewCustomLayout.swift
//  Sample123
//
//  Created by Vignesh Radhakrishnan on 07/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import UIKit

class CollectionViewCustomLayout : UICollectionViewLayout {
    
    var layoutAttributes : [UICollectionViewLayoutAttributes] = []
    let numberOfColumns = 3
    
    private var contentHeight: CGFloat = 0
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView?.frame.size.width ?? 0.0, height: contentHeight)
    }
    
    override func prepare() {
        guard
            let collectionView = collectionView
            else {
                return
        }
        
        let columnWidth = (collectionView.frame.size.width) / CGFloat(numberOfColumns)
        
        var column = 0
        var temp : Int = 1
        
        var xOrigin : CGFloat = 0
        var yOrigin : CGFloat = 0
        var reverse : Bool = false
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            
            let frame = CGRect(x: xOrigin, y: yOrigin, width: columnWidth, height: columnWidth)
            let layoutAttribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            layoutAttribute.frame = frame
            layoutAttributes.append(layoutAttribute)
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
            
            if column == 0 && (indexPath.row) % 2 == 0 || reverse {
                
                xOrigin = collectionView.frame.size.width - CGFloat(temp * Int(columnWidth))
                
                if xOrigin <= 0 {
                    reverse = false
                    xOrigin = 0
                    temp = 1
                } else {
                    reverse = true
                    temp += 1
                }
            } else {
                if column != 0 {
                    xOrigin += columnWidth
                }
            }
            if column == 0 {
                yOrigin = yOrigin + columnWidth
            }
            contentHeight += yOrigin
        }
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        // Loop through the cache and look for items in the rect
        for attributes in layoutAttributes {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
}
