//
//  FirstViewController.swift
//  SwiftyPagingViewDemo
//
//  Created by Luke on 3/22/16.
//  Copyright © 2016 geeklu.com. All rights reserved.
//

import UIKit
import SwiftyPagingView

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView()
        let cell = PagingCell()
        cell.pageView = view
        cell.pageView = view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

