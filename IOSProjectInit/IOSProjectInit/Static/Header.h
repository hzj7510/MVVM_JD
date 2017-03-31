//
//  Header.h
//  ZitoProject
//
//  Created by mac on 17/3/1.
//  Copyright © 2017年 x5. All rights reserved.
//

#ifndef Header_h
#define Header_h

//屏幕的宽度
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
//屏幕的高度
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height

//测量时屏幕的高度
#define kMeasureScreenHeight    667.0
//测量时屏幕的宽度
#define kMeasureScreenWidth     375.0

//得到view相对屏幕高度比例实际的高度   多余与CGReat
#define kGetViewHeight(x)   kScreenHeight * (x / kMeasureScreenHeight)
//得到view相对屏幕宽度比例实际的宽度   多余与CGReat
#define kGetViewWidth(x)    kScreenWidth * (x / kMeasureScreenWidth)
//自定义颜色
#define kRGB(R,G,B,Alpha)  [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:Alpha]
//自定义灰色
#define kGrayColor(G,Alpha) kRGB(G,G,G,Alpha)
//字体适配
#define kFont(f) kScreenWidth > 320 ? (f + 2) : f

#endif /* Header_h */
