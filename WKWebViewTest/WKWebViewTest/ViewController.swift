//
//  ViewController.swift
//  WKWebViewTest
//
//  Created by 胡晓阳 on 15/11/2.
//  Copyright © 2015年 HXY. All rights reserved.
//

import UIKit
import WebKit



class ViewController: UIViewController {
    
    @IBOutlet var containerView: UIView! = nil
    
    var ShowType = 0
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        self.webView = WKWebView(frame: self.view.bounds)
        //实例化webView
        
        self.view = self.webView
        //告诉viewController当前的View，webView使我们想要展示的View
    }//重写loadView方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://www.baidu.com/")//http:www.baidu.com/无法显示网页
        let req = NSURLRequest(URL: url!)
        self.webView!.loadRequest(req)
    }
    //注意！！！iOS9引入了新特性App Transport Security (ATS),新特性要求App内访问的网络必须使用HTTPS协议.如果出现网页无法显示的情况，需要修改项目的info.plist文件
    //1.在Info.plist中添加NSAppTransportSecurity类型Dictionary
    //2.在NSAppTransportSecurity下添加NSAllowsArbitraryLoads类型Boolean,值设为YES

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

