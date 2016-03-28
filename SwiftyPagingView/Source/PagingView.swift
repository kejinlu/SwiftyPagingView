//
//  PagingView.swift
//  SwiftyPagingView
//
//  Created by Luke on 3/26/16.
//  Copyright © 2016 geeklu.com. All rights reserved.
//

import UIKit

public enum PagingViewStyle: Int {
    case Default = 0
    case Focus
    case SpinningWheel
}

public protocol PagingViewDatasource: NSObjectProtocol {
    func numberOfPagesInPagingView(pagingView: PagingView) -> Int
    func pagingView(pagingView: PagingView, pageViewAtIndex index: Int) -> UIView
}

public protocol PagingViewDelegate: NSObjectProtocol {
    func pagingView(pagingView: PagingView, diTapAtIndex index: Int)
}

public class PagingView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    public var autoScroll: Bool = false
    public var pagingView: UICollectionView?
    public var layout: UICollectionViewLayout?
    public var style: PagingViewStyle = .Default
    
    var autoScrollTimer: NSTimer?
    
    weak public var delegate: PagingViewDelegate?
    weak public var dataSource: PagingViewDatasource?
    
    func setup() {
        self.pagingView = UICollectionView(frame: self.bounds)
        self.pagingView!.delegate = self
        self.pagingView!.dataSource = self
        self.pagingView!.registerClass(PagingCell.self, forCellWithReuseIdentifier: "PagingCell")
        self.addSubview(self.pagingView!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems = 0
        if self.dataSource != nil {
            numberOfItems = self.dataSource!.numberOfPagesInPagingView(self)
        }
        return numberOfItems
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.pagingView?.dequeueReusableCellWithReuseIdentifier("PagingCell", forIndexPath: indexPath) as! PagingCell
        if self.dataSource != nil {
            let pageView = self.dataSource!.pagingView(self, pageViewAtIndex: indexPath.item)
            cell.pageView = pageView
        }
        return cell
    }
}