//
//  segementButton.m
//  WJSegementContrl
//
//  Created by 军魏 on 15/7/10.
//  Copyright (c) 2015年 军魏. All rights reserved.
//

#import "segementButton.h"
#define buttonSpeed 0.5
@implementation segementButton


+(instancetype)button
{
    return [[self alloc] init];
}


-(instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor: [UIColor whiteColor]];
        self.titleLabel.font = [UIFont systemFontOfSize:15.0F];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}



-(void) setSelected:(BOOL)selected
{
    
    if (selected) {
        self.transform = CGAffineTransformScale(self.transform, 1.2, 1.2);
    }
    else
    {
        self.transform = CGAffineTransformIdentity;
     
    }
 [super setSelected:selected];
}
@end
