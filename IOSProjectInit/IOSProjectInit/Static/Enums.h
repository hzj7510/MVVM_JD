//
//  Enums.h
//  IOSProjectInit
//
//  Created by mac on 17/3/27.
//  Copyright © 2017年 x5. All rights reserved.
//

#ifndef Enums_h
#define Enums_h

//typedef enum : NSUInteger {
//    /**
//     *  优惠券类型
//     */
//    PRODUCTCONFIGURETYPECOUPON = 1 << 0,
//    /**
//     *  促销打折类型
//     */
//    PRODUCTCONFIGURETYPEDISCOUNT = 1 << 1,
//    /**
//     *  已选类型
//     */
//    PRODUCTCONFIGURETYPESELECTED = 1 << 2,
//    /**
//     *  地址类型
//     */
//    PRODUCTCONFIGURETYPEADDRESS = 1 << 3,
//    /**
//     *  运费类型
//     */
//    PRODUCTCONFIGURETYPEFREIGHT = 1 << 4,
//    /**
//     *  tips类型  提示发货时间等信息
//     */
//    PRODUCTCONFIGURETYPETIPS = 1 << 5,
//} PRODUCTCONFIGURETYPE;


typedef enum : NSUInteger {
    PRODUCTVIEWTYPENONE = 1 << 0,
    /**
     *  自营
     */
    PRODUCTVIEWTYPEWITHSELF= 1 << 1,
    /**
     *  全球购
     */
    PRODUCTVIEWTYPEWITHGLOBAL = 1 << 2,
    /**
     *  是否有广告
     */
    PRODUCTVIEWTYPEWITHAD = 1 << 3,
    /**
     *  打折优惠
     */
    PRODUCTVIEWTYPEDISCOUNT = 1 << 4,
    /**
     *  原价
     */
    PRODUCTVIEWTYPEMPRICE = 1 << 5,
    /**
     *  促销
     */
    PRODUCTVIEWTYPEPROMOTION = 1 << 6,
    /**
     *  优惠券
     */
    PRODUCTVIEWTYPECOUPON = 1 << 7,
    /**
     *  作者
     */
    PRODUCTVIEWTYPEAUTHOR = 1 << 8,
    /**
     *  出版社
     */
    PRODUCTVIEWTYPEPRESS = 1 << 9,
    
} PRODUCTVIEWTYPE;


#endif /* Enums_h */
