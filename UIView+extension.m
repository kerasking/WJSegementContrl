//
//  UIView+extension.m
//  WJSegementContrl
//
//  Created by 军魏 on 15/7/10.
//  Copyright (c) 2015年 军魏. All rights reserved.
//

#import "UIView+extension.h"

@implementation UIView (extension)

-(void) setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


-(CGFloat) height
{
    return self.frame.size.height;
}

-(void) setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat) width
{
    return self.frame.size.width;
}

-(void) setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


-(CGFloat) x
{
    return self.frame.origin.x;
}


@end
