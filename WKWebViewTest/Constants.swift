//
//  Constants.swift
//  WKWebViewTest
//
//  Created by 胡晓阳 on 15/11/2.
//  Copyright © 2015年 HXY. All rights reserved.
//

/**
*  取代OC中的#define，列举一些常用的宏定义
*/
import Foundation
import UIKit

/**
*  屏幕的物理宽度
*/
let kScreenWidth = UIScreen.mainScreen().bounds.size.width

/**
*  屏幕的物理高度
*/
let kScreenHeight = UIScreen.mainScreen().bounds.size.height


/**
*   除了一些简单的属性直接用常量表达,更推荐用全局函数来定义替代宏
*/

/**
*  判断系统版本
*/
func kIs_iOS7() ->Bool { return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0}
func kIs_iOS8() ->Bool {return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0}

/**
*  RGBA颜色设置
*/
func kRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) ->UIColor {return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)}

//APP沙盒路径
func kAppPath() -> String! {return NSHomeDirectory()}

//Documents路径
func kBundleDocumentPath() -> String! {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
}

// Caches路径
func KCachesPath() -> String! {
    return NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first
}