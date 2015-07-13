//
//  wjSliderView.h
//  WJSegementContrl
//
//  Created by 军魏 on 15/7/13.
//  Copyright (c) 2015年 军魏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    sliderDefault = -1,
    sliderRect,
}sliderType;
@interface wjSliderView : UIView
+(instancetype) sliderViewWithType:(sliderType) type;
-(instancetype) initWithSliderType:(sliderType) type;
@end
