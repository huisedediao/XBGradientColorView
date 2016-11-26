//
//  XBGradientColorView.m
//  XBGradientColorView
//
//  Created by xxb on 2016/11/26.
//  Copyright © 2016年 xxb. All rights reserved.
//

#import "XBGradientColorView.h"

@interface XBGradientColorView ()
@property(nonatomic,strong)NSMutableArray *fromArr;

@property(nonatomic,strong)NSMutableArray *toArr;

@end

@implementation XBGradientColorView

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSp=CGColorSpaceCreateDeviceRGB();
    
    
    CGFloat compoents[8]=
    {
        [self changeToFloat:self.fromArr[0]],
        [self changeToFloat:self.fromArr[1]],
        [self changeToFloat:self.fromArr[2]],
        [self.fromArr[3] floatValue],
        [self changeToFloat:self.toArr[0]],
        [self changeToFloat:self.toArr[1]],
        [self changeToFloat:self.toArr[2]],
        [self.toArr[3] floatValue]
    };

    
    CGFloat locations[2]=
    {
        0,1.0
    };
    
    CGGradientRef gradient=CGGradientCreateWithColorComponents(colorSp, compoents, locations, 2);
    
    CGContextDrawLinearGradient(ctx, gradient, CGPointZero, CGPointMake(rect.size.width * (1-self.direction), rect.size.height * (self.direction-0)), kCGGradientDrawsAfterEndLocation);
    
    CGColorSpaceRelease(colorSp);
}

-(float)changeToFloat:(NSString *)str
{
    float result=[str intValue]/255.0;
    return result;
}

-(void)setFromColor:(UIColor *)fromColor
{
    _fromColor=fromColor;
    
    self.fromArr=[UIColor RGBAComponentsFromColor:fromColor];
    
    [self setNeedsDisplay];
}


-(void)setToColor:(UIColor *)toColor
{
    _toColor=toColor;
    
    self.toArr=[UIColor RGBAComponentsFromColor:toColor];
    
    [self setNeedsDisplay];
}

-(void)setDirection:(NSInteger)direction
{
    _direction=direction;
    
    [self setNeedsDisplay];
}



#pragma mark - 懒加载
-(NSMutableArray *)fromArr
{
    if (_fromArr==nil)
    {
        _fromArr=[NSMutableArray new];
    }
    return _fromArr;
}

-(NSMutableArray *)toArr
{
    if (_toArr==nil)
    {
        _toArr=[NSMutableArray new];
    }
    return _toArr;
}
@end
