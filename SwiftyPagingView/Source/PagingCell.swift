//
//  PagingCell.swift
//  SwiftyPagingView
//
//  Created by Luke on 3/22/16.
//  Copyright © 2016 geeklu.com. All rights reserved.
//

import UIKit

class PagingCell: UICollectionViewCell {
    internal var pageView: UIView? {
        didSet {
            if oldValue != nil && oldValue != pageView {
                if oldValue!.superview == self.contentView {
                    oldValue!.removeFromSuperview()
                }
            }
            if pageView != nil {
                pageView!.frame = self.contentView.bounds
                self.contentView.addSubview(pageView!)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.pageView?.frame = self.contentView.bounds
    }
}
