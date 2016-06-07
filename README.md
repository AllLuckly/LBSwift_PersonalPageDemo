# LBSwift_PersonalPageDemo

> [博主app上线啦，快点此来围观吧](https://itunes.apple.com/us/app/it-blog-zi-xueios-kai-fa-jin/id1067787090?l=zh&ls=1&mt=8)<br>

##技术交流群：534926022（免费）   511040024(0.8/人付费)

> [点击此--->更多开发技巧](http://allluckly.cf/) <br>

`继承LBSwift_PersonalPage`
```
    //头像设置
    self.headImageView?.image = UIImage(named: "myheadimage.jpeg")
    //背景设置
    self.imageBG?.image = UIImage(named: "BG.jpg")
    //昵称设置
    self.nameLabel?.text = "BISON";
    //右边按钮
override func rightBtnClick() {
        println("我是继承右边的哦")
    }
//左边按钮
override func leftBtnClick() {
        println("我是继承左边的哦")
    }
```


![(LBPersonalPageDemo)](https://github.com/AllLuckly/LBPersonalPageDemo/blob/master/123.gif?raw=true)

需要OC版本的点击这里哟[OC版](https://github.com/AllLuckly/LBPersonalPageDemo)
