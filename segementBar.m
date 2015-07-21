//
//  segementBar.m
//  WJSegementContrl
//
//  Created by 军魏 on 15/7/10.
//  Copyright (c) 2015年 军魏. All rights reserved.
//

#import "segementBar.h"
#import "wjSliderView.h"
#import "UIView+extension.h"
#import "segementButton.h"
#define viewWidth   [[UIScreen mainScreen] bounds].size.width
#define sliderSpeed  0.3
#define buttonSpeed 0.5
#define maxCount 6
@interface segementBar()

@property(strong,nonatomic) wjSliderView* slider;

@end

@implementation segementBar
{
    segementButton* tempBtn;
    NSInteger flagIndex;
}


-(wjSliderView*) slider
{
    if (_slider == nil) {
        _slider = [wjSliderView sliderViewWithType:sliderDefault];
    }
    return _slider;
}

+(instancetype)bar
{
    return [[self alloc] initWithFrame:CGRectMake(0, 0,viewWidth, 30)];
}

-(id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor= [UIColor whiteColor];
        self.showsHorizontalScrollIndicator = NO;
        flagIndex = -100;
    }
    return self;
}
-(NSMutableArray*) btnArray
{
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}


-(void) updateBtns
{
    NSInteger btnCount = self.btnArray.count;
    CGFloat btnW = self.width / btnCount;
    CGFloat btnH = 30;
    CGFloat btnX ;
    CGFloat btnY = 0;
    if(self.btnArray.count > maxCount)
    {
       btnW = self.width / maxCount;
        self.contentSize = CGSizeMake(btnW*self.btnArray.count, 0);
    }
    //添加滑块
    self.slider.width = btnW;
    [self addSubview:self.slider];
    
    for (int i = 0; i < self.btnArray.count; i++) {
        segementButton* btn = self.btnArray[i];
        btnX = i * btnW;
        btn.tag = i;
        if (btn.tag == 0) {
            //设置选中状态
            //先移除以前的动画
            //在添加新的frame
              //在进行新的动画
            btn.selected = NO;
            [btn setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
            btn.selected = YES;
             tempBtn = btn;
        }
        else{
            [btn setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        }
    }
}

-(void) changeBtn:(segementButton*) btn withAnimation:(BOOL) animation
{
    
    if (animation) {
    [UIView animateWithDuration:buttonSpeed animations:^{
        tempBtn.selected = NO;
        //设置当前选中按钮选中
        btn.selected = YES;
        tempBtn = btn;
    }];
    }
    else
    {
        tempBtn.selected = NO;
        //设置当前选中按钮选中
        btn.selected = YES;
        tempBtn = btn;
    }

}

-(void)  sliderMove:(CGFloat) distance
{
    
    if (self.btnArray.count > maxCount) {
        distance = distance / maxCount;
    }
    else
    {
        distance = distance / self.btnArray.count;
    }
    
    [UIView animateWithDuration:sliderSpeed animations:^{
        self.slider.x = distance;
    }];
}


-(void) addBtn:(NSString *)titile
{
    segementButton* btn = [segementButton button];
    [btn addTarget:self action:@selector(clcikeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:titile forState:UIControlStateNormal];
    [self addSubview:btn];
    [self.btnArray addObject:btn];
    [self updateBtns];
}


-(void) clcikeBtn:(segementButton*) sender
{
    NSInteger tag = sender.tag;
    [self.customeDelegate clickBtnAtTag:tag];
    [self changeBtn:sender withAnimation:YES];
}

//
-(void) moveToButtonAtIndex:(NSInteger)index
{
    CGFloat btnW = self.width / maxCount;;
    if (CGRectGetMaxX(self.slider.frame) > self.width+self.contentOffset.x) {
        [UIView animateWithDuration:sliderSpeed animations:^{
            self.contentOffset = CGPointMake((index - maxCount+1)*btnW, 0);
        }];
    }

    if (self.slider.x < self.contentOffset.x) {
        [UIView animateWithDuration:sliderSpeed animations:^{
            self.contentOffset = CGPointMake(index *btnW, 0);
        }];
    }
    segementButton* btn = self.btnArray[index];
    [self changeBtn:btn withAnimation:YES];

}

@end
