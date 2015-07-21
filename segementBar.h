//
//  segementBar.h
//  WJSegementContrl
//
//  Created by 军魏 on 15/7/10.
//  Copyright (c) 2015年 军魏. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol wjSegementDelegate <NSObject>

-(void) clickBtnAtTag:(NSInteger) tag;

@end
@interface segementBar : UIScrollView
@property(strong,nonatomic) NSMutableArray* btnArray;
@property(assign,nonatomic) id<wjSegementDelegate> customeDelegate;
-(void)  sliderMove:(CGFloat) distance;
+(instancetype) bar;
-(void) addBtn:(NSString*) titile;
-(void) moveToButtonAtIndex:(NSInteger)index;
@end
