//
//  LBSwift_PersonalPage.swift
//  LBSwift_PersonalPage
//
//  Created by chenlei_mac on 15/9/7.
//  Copyright (c) 2015年 Bison. All rights reserved.
//

import UIKit

class LBSwift_PersonalPage: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate {
    let LBWIDTH = UIScreen.mainScreen().bounds.size.width
    let LBHEIGHT = UIScreen.mainScreen().bounds.size.height
    var BackGroupHeight:CGFloat  = 200
    var HeadImageHeight:CGFloat = 80
    var dataArr = NSMutableArray()
    var tabView  :UITableView?
    var BGView :UIView?
    var headImageView :UIImageView?
    var imageBG:UIImageView?
    var nameLabel:UILabel?
    var leftBtn:UIButton?
    var rightBtn:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self .createUI()
    }

    func createUI(){
        
        self.automaticallyAdjustsScrollViewInsets = false;
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        var rect = CGRectMake(0, 0, LBWIDTH, LBHEIGHT)
        tabView = UITableView(frame:UIScreen.mainScreen().bounds,style:.Plain)
        tabView!.delegate = self
        tabView!.dataSource = self
        tabView!.contentInset = UIEdgeInsetsMake(200, 0, 0, 0)
        
        self.view.addSubview(tabView!)
        tabView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tabView?.tableFooterView = UIView(frame: CGRectZero)
        
        imageBG = UIImageView(frame: CGRectMake(0, -200, LBWIDTH, 200))
        imageBG?.image = UIImage (named: "BG.jpg")
        tabView!.addSubview(imageBG!)
        
        BGView = UIView(frame: CGRectMake(0, -200, 0,200))
        BGView?.backgroundColor = UIColor.clearColor()
        tabView!.addSubview(BGView!)
        
        let X = (LBWIDTH - 80)/2 as CGFloat
        headImageView = UIImageView(frame: CGRectMake(X, 40, 80, 80))
        headImageView?.layer.cornerRadius = 80/2
        headImageView?.clipsToBounds = true
        headImageView?.image = UIImage(named: "myheadimage.jpeg")
        BGView!.addSubview(headImageView!)
        
        nameLabel = UILabel(frame: CGRectMake(X, CGRectGetMaxY(headImageView!.frame)+5, 80, 20))
        nameLabel?.text = "BISON"
        nameLabel?.textAlignment = NSTextAlignment.Center
        BGView!.addSubview(nameLabel!)
        
        leftBtn = UIButton(frame: CGRectMake(0, 0, 45, 20))
        leftBtn!.setTitle("lift", forState: .Normal)
        leftBtn!.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        leftBtn!.addTarget(self, action: "leftBtnClick", forControlEvents: .TouchUpInside)
        var leftItem:UIBarButtonItem = UIBarButtonItem(customView: leftBtn!)
        self.navigationItem.leftBarButtonItem = leftItem
        
        rightBtn = UIButton(frame: CGRectMake(0, 0, 45, 20))
        rightBtn!.setTitle("right", forState: .Normal)
        rightBtn!.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        rightBtn!.addTarget(self, action: "rightBtnClick", forControlEvents: .TouchUpInside)
        var rightItem:UIBarButtonItem = UIBarButtonItem(customView: rightBtn!)
        self.navigationItem.rightBarButtonItem = rightItem
        
        
    }
    
    func leftBtnClick(){
        println("点了我的左边")
    }
    func rightBtnClick(){
        println("点了我的右边")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let  cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = "BISON"
        
        return cell
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var yOffset:CGFloat = scrollView.contentOffset.y
        
        var xOffset:CGFloat  = (yOffset + 200)/2
        
        if yOffset < -200{
            var rect:CGRect = imageBG!.frame
            rect.origin.y = yOffset
            rect.size.height = -yOffset
            rect.origin.x = xOffset
            rect.size.width = LBWIDTH + fabs(xOffset)*2
            imageBG?.frame = rect
            
            var HeadImageRect:CGRect = CGRectMake((LBWIDTH - 80)/2, 40, 80, 80)
            HeadImageRect.origin.y = headImageView!.frame.origin.y
            HeadImageRect.size.height = HeadImageHeight + fabs(xOffset)*0.5
            HeadImageRect.origin.x = LBWIDTH/2 - HeadImageRect.size.height/2
            HeadImageRect.size.width = HeadImageHeight + fabs(xOffset)*0.5
            headImageView?.frame = HeadImageRect
            headImageView?.layer.cornerRadius = HeadImageRect.size.height/2
            headImageView?.clipsToBounds = true
            
            var NameRect:CGRect = nameLabel!.frame
            NameRect.origin.y = CGRectGetMaxY(headImageView!.frame)+5
            NameRect.size.height = 20 + fabs(xOffset)*0.5
            NameRect.origin.x = LBWIDTH/2 - NameRect.size.width/2
            NameRect.size.width = HeadImageHeight + fabs(xOffset)*0.5
            
            nameLabel?.font = UIFont.systemFontOfSize(17 + fabs(xOffset)*0.2)
            nameLabel?.frame = NameRect
        }else{
        
            var HeadImageRect:CGRect = CGRectMake((LBWIDTH - 80)/2, 40, 80, 80)
            HeadImageRect.origin.y = 40
            HeadImageRect.size.height = HeadImageHeight - fabs(xOffset)*0.5
            HeadImageRect.origin.x = LBWIDTH/2 - HeadImageRect.size.height/2
            HeadImageRect.size.width = HeadImageHeight - fabs(xOffset)*0.5
            headImageView?.frame = HeadImageRect
            headImageView?.layer.cornerRadius = HeadImageRect.size.height/2
            headImageView?.clipsToBounds = true
            
            var NameRect:CGRect = CGRectMake((LBWIDTH - 80)/2, 120+5, 80, 20)
            NameRect.origin.y = HeadImageRect.origin.y + HeadImageRect.size.width + 5
            NameRect.size.height = 20
            NameRect.origin.x = LBWIDTH/2 - HeadImageRect.size.height/2
            NameRect.size.width = HeadImageHeight - fabs(xOffset)*0.5
            
            nameLabel?.font = UIFont.systemFontOfSize(17 - fabs(xOffset)*0.2)
            nameLabel?.frame = NameRect
        
        }
        
    }
    
//    func imageWiwhColor(color :UIColor)->UIImage{
//    
//        // 描述矩形
//        var rect:CGRect  = CGRectMake(0.0, 0.0, 1.0, 1.0)
//        // 开启位图上下文
//        UIGraphicsBeginImageContext(rect.size)
//        // 获取位图上下文
//        var context:CGContextRef = UIGraphicsGetCurrentContext()
//        // 使用color演示填充上下文
//        CGContextSetFillColorWithColor(context, color.CGColor)
//        // 渲染上下文
//        CGContextFillEllipseInRect(context, rect)
//        // 从上下文中获取图片
//        var theImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
//        // 结束上下文
//        UIGraphicsEndImageContext()
//        
//    
//        return theImage
//    }
    

}
