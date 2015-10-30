//
//  ViewController.swift
//  LBSwift_PersonalPage
//
//  Created by chenlei_mac on 15/9/7.
//  Copyright (c) 2015年 Bison. All rights reserved.
//

import UIKit

class ViewController: LBSwift_PersonalPage {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel?.text = "BISON";
        self.headImageView?.image = UIImage(named: "myheadimage.jpeg")
        self.imageBG?.image = UIImage(named: "BG.jpg")
    }
    
    override func leftBtnClick() {
        print("我是继承左边的哦")
    }
    override func rightBtnClick() {
        print("我是继承右边的哦")
    }

}

