//
//  mainViewController.h
//  WJSegementContrl
//
//  Created by 军魏 on 15/7/10.
//  Copyright (c) 2015年 军魏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wjSliderView.h"
@interface  wjMainViewController : UIViewController
@property(assign,nonatomic) CGFloat scroSpeed;
@property(assign,nonatomic) sliderType sliderType;
+(instancetype) wjSegemtnContrl;
-(void) addSegementContrl:(UIViewController*) ctrl;
@end
