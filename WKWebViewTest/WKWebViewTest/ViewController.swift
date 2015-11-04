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
    
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        self.webView = WKWebView(frame: self.view.bounds)
        //实例化webView
        
        self.view = self.webView
        //告诉viewController当前的View，webView使我们想要展示的View
    }//重写loadView方法
    
    
    
    /**
    *  将网页copy到NSTemporaryDirectory()下
    *
    *  @param String? <#String? description#>
    *
    *  @return <#return value description#>
    */
    func urlForBuggyWKWebView(filePath: String?) -> NSURL? {
        
        let fileManager = NSFileManager.defaultManager()
        let tmpURL = NSURL.fileURLWithPath(NSTemporaryDirectory(), isDirectory: true).URLByAppendingPathComponent("www")
        let fileURL = NSURL(fileURLWithPath: filePath!)
        do{
            try fileManager.createDirectoryAtURL (tmpURL, withIntermediateDirectories: true, attributes: nil)
            //do whatever you want here if createDirectoryAtPath successful
            let dstURL = tmpURL.URLByAppendingPathComponent(fileURL.lastPathComponent!)
            
            if !dstURL.checkResourceIsReachableAndReturnError(nil){
                do{
                    try fileManager.copyItemAtURL(fileURL, toURL: dstURL)
                }catch{
                    print("Unable to Copy file : \(error)")
                    return nil
                }
            }
            
            return dstURL
        }catch{
            print("Can't create directory : \(error)")
            return nil
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let type = UserDefault.objectForKey("DispalyType")?.integerValue
        if type == 1{
            let url = NSURL(string: "https://www.baidu.com/")//http:www.baidu.com/无法显示网页
            
            let req = NSURLRequest(URL: url!)
            self.webView!.loadRequest(req)

        }else{
        
            let contentController = WKUserContentController()
            let userScript = WKUserScript(
                source: "redHeader",
                injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,
                forMainFrameOnly: true
            )
            contentController.addUserScript(userScript)
            
            let configure = WKWebViewConfiguration()
            configure.userContentController = contentController
            self.webView = WKWebView(frame: self.containerView.bounds, configuration: configure)
            self.view = self.webView

//            加载本地页面
            let filePath = kBundlePath("index", fileType: "html")
            print("bundle:\(filePath)")
            let url = urlForBuggyWKWebView(filePath)
            let request = NSURLRequest(URL: url!)
            self.webView ?.loadRequest(request)
            
        }
    }
    //注意！！！iOS9引入了新特性App Transport Security (ATS),新特性要求App内访问的网络必须使用HTTPS协议.如果出现网页无法显示的情况，需要修改项目的info.plist文件
    //1.在Info.plist中添加NSAppTransportSecurity类型Dictionary
    //2.在NSAppTransportSecurity下添加NSAllowsArbitraryLoads类型Boolean,值设为YES

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    ///Users/huxiaoyang/Library/Developer/CoreSimulator/Devices/3C753B3C-48E5-4A5B-861F-EA325EF71094/data/Containers/Bundle/Application/9642D871-4B73-428F-97B6-8DE1E843413F/WKWebViewTest.app/index.html
    ///Users/huxiaoyang/Library/Developer/CoreSimulator/Devices/3C753B3C-48E5-4A5B-861F-EA325EF71094/data/Containers/Data/Application/90B4B2C2-C0C3-4079-8CC8-E6DFB970EBB7/index.html

}

