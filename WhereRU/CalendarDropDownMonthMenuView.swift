//
//  CalendarDropDownMonthMenuView.swift
//  WhereRU
//
//  Created by RInz on 15/8/18.
//  Copyright (c) 2015年 RInz. All rights reserved.
//

import UIKit

class CalendarDropDownMonthMenuView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var monthCollectionView: UICollectionView?
    
    init() {
        super.init(frame:CGRectZero)
        monthCollectionView = UICollectionView(frame: CGRectMake(0, 0, self.window!.frame.size.width, 44))
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(40, 40)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        monthCollectionView!.collectionViewLayout = flowLayout
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellIdentifier = "monthCell"
        let cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) 
        let monthLabel: UILabel = UILabel()
        monthLabel.text = "\(indexPath.row + 1)"
        cell.addSubview(monthLabel)
        cell.backgroundColor = UIColor.redColor()
        
        return cell
    }

}
