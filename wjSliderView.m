//
//  wjSliderView.m
//  WJSegementContrl
//
//  Created by 军魏 on 15/7/13.
//  Copyright (c) 2015年 军魏. All rights reserved.
//

#import "wjSliderView.h"

@implementation wjSliderView

+(instancetype) sliderViewWithType:(sliderType)type
{
    return [[self alloc] initWithSliderType:type];
}

-(instancetype) initWithSliderType:(sliderType) type
{
    
    if (self = [super init])
    {
    self.backgroundColor = [UIColor grayColor];
    
        switch (type) {
            case sliderDefault:
            {
                self.layer.cornerRadius = 10;
                self.layer.masksToBounds = YES;
                self.alpha = 0.7;
                [self setFrame:CGRectMake(0, 3, 100, 24)];
            }
                break;
                
            case sliderRect:
            {
                 self.alpha = 0.7;
                [self setFrame:CGRectMake(0, 3, 100, 24)];
            }
                break;
        }

        
    }
    
           return self;
}



@end
