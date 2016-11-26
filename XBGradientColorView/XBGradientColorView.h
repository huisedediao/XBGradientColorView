//
//  XBGradientColorView.h
//  XBGradientColorView
//
//  Created by xxb on 2016/11/26.
//  Copyright © 2016年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+CustomFunctions.h"

@interface XBGradientColorView : UIView

/** 渐变开始色 */
@property (nonatomic,strong) UIColor *fromColor;

/** 渐变结束色 */
@property (nonatomic,strong) UIColor *toColor;

/** 方向,0横向，1纵向，默认横向 */
@property (nonatomic,assign) NSInteger direction;

@end

