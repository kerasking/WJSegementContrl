//
//  mainViewController.m
//  WJSegementContrl
//
//  Created by 军魏 on 15/7/10.
//  Copyright (c) 2015年 军魏. All rights reserved.
//

#import "wjMainViewController.h"
#import "UIView+extension.h"
#define    viewWidth   _containView.bounds.size.width
#define   viewHeigh  _containView.bounds.size.height
#define WJRandomColor WJColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define WJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface wjMainViewController ()<UIScrollViewDelegate>
@property(strong,nonatomic) NSMutableArray* viewCtrls;
@property(strong,nonatomic) UIScrollView* containView;
@property(strong,nonatomic) UIView* segementView;
@property(strong,nonatomic) wjSliderView* slider;
@property(strong,nonatomic) NSMutableArray* btnArray;
@end

@implementation wjMainViewController
{
    UIButton* tempBtn;
    CGFloat beforeX;
}

+(instancetype) wjSegemtnContrl
{
    
    return [[self alloc] init];
}

-(NSMutableArray*) btnArray
{
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

-(wjSliderView*) slider
{
    if (_slider == nil) {
        _slider = [wjSliderView sliderViewWithType:_sliderType];
    }
    return _slider;
}

-(UIScrollView*) containView
{
        if (_containView == nil) {
        UIScrollView* containView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, self.view.width, self.view.height)];
        containView.delegate = self;
        containView.showsHorizontalScrollIndicator = NO;
        containView.pagingEnabled = YES;
        containView.bounces = NO;
        _containView = containView;
    }
    return _containView;
}

-(UIView*) segementView
{
    
    if (_segementView == nil) {
        _segementView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.width , 30)];
        _segementView.backgroundColor = [UIColor greenColor];
        
    }
    return _segementView;
}


-(NSMutableArray*) viewCtrls
{
    
    if (_viewCtrls == nil) {
        _viewCtrls = [NSMutableArray array];
    }
    return _viewCtrls;
}


-(instancetype) init
{
    if (self = [super init]) {
        
        [self.view addSubview:self.containView];
    }
    return self;
}

-(void) addSegementContrl:(UIViewController *)ctrl
{
    
    [self.viewCtrls addObject:ctrl];
    [self updateViewCtrls];
}

-(void) updateViewCtrls
{
    [self.containView setContentSize:CGSizeMake(self.viewCtrls.count*viewWidth,0)];
    UIViewController* addViewController = [self.viewCtrls lastObject];
    NSInteger currentIndex = self.viewCtrls.count -1 ;
    CGFloat viewX = currentIndex*viewWidth;
    CGFloat viewY = 0;
    CGFloat viewW = viewWidth;
    CGFloat viewH = viewHeigh;
    [addViewController.view  setFrame:CGRectMake(viewX, viewY, viewW,viewH)];
    [self.containView addSubview:addViewController.view];
    
    if (addViewController.title == nil) {
       addViewController.title = [NSString stringWithFormat:@"item%d",(int)self.viewCtrls.count];
    }
    [self addBtn:addViewController];
}


-(void) addBtn:(UIViewController*) ctrl
{
    UIButton* btn = [[UIButton alloc] init];
    [btn  setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(clcikeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:ctrl.title forState:UIControlStateNormal];
    [btn setBackgroundColor: [UIColor whiteColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:15.0F];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.segementView addSubview:btn];
    [self.btnArray addObject:btn];
    [self updateBtns];
}

-(void) clcikeBtn:(UIButton*) sender
{
    [UIView animateWithDuration:0.2 animations:^{
        self.containView.contentOffset = CGPointMake(sender.tag*self.view.width, 0);
    }];
    [self changeBtn:sender withAnimation:YES];
}

-(void) changeBtn:(UIButton*) btn withAnimation:(BOOL) animation
{
    if (animation) {
        [UIView animateWithDuration:0.5 animations:^{
            
            //把前一个btn 的动画效果去掉
            tempBtn.transform = CGAffineTransformIdentity;
            //设置前一个btn的未选中
            tempBtn.selected = NO;
            //设置当前选中按钮选中
            btn.selected = YES;
            //为当前按钮添加动画效果
            btn.transform = CGAffineTransformScale(btn.transform, 1.2, 1.2);
            //交换按钮
            tempBtn = btn;
        }];
    }
    else
    {
        tempBtn.transform = CGAffineTransformIdentity;
        
        tempBtn.selected = NO;
        btn.selected = YES;
        btn.transform = CGAffineTransformScale(btn.transform, 1.2, 1.2);
        
        tempBtn = btn;
    }
    
}



-(void) updateBtns
{
    NSInteger btnCount = self.btnArray.count;
    CGFloat btnW = self.view.width / btnCount;
    CGFloat btnH = 30;
    CGFloat btnX ;
    CGFloat btnY = 0;
    //添加滑块
    self.slider.width = btnW;
    [self.segementView addSubview:self.slider];
    
    for (int i = 0; i < self.btnArray.count; i++) {
        UIButton* btn = self.btnArray[i];
        btnX = i * btnW;
        btn.tag = i;
    if (btn.tag == 0) {
        //设置选中状态
        btn.selected = YES;
        //先移除以前的动画
        btn.transform = CGAffineTransformIdentity;
        //在添加新的frame
        [btn setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        //在进行新的动画
        btn.transform = CGAffineTransformScale(btn.transform, 1.2, 1.2);
    }
    else{
        [btn setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    }
  }
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger i;
    CGFloat distancen = scrollView.contentOffset.x / self.view.width;
    CGFloat sliderDistance = scrollView.contentOffset.x/self.btnArray.count;
   if(scrollView.contentOffset.x > beforeX)
   {
      [self   sliderMove:sliderDistance];
    i  =floor(distancen + 0.5);
   }
  else
  {
     [self   sliderMove:sliderDistance];
      i =ceil(distancen - 0.5);
  }
    beforeX = scrollView.contentOffset.x;
    UIButton* btn = self.btnArray[i];
    [self changeBtn:btn withAnimation:YES];
}

-(void)  sliderMove:(CGFloat) distance
{
    
    [UIView animateWithDuration:self.scroSpeed animations:^{
        self.slider.x = distance;
    }];
}

-(void)  originData
{
    _sliderType = sliderDefault;
    self.scroSpeed = 0.3;
    beforeX = -23123123;
}

- (void)viewDidLoad {
   
    [self originData];
    [self.view addSubview:self.segementView];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
