//
//  mainViewController.m
//  WJSegementContrl
//
//  Created by 军魏 on 15/7/10.
//  Copyright (c) 2015年 军魏. All rights reserved.
//

#import "wjMainViewController.h"
#import "UIView+extension.h"
#import "segementBar.h"
#define    viewWidth   _containView.bounds.size.width
#define   viewHeigh  _containView.bounds.size.height
#define RandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface wjMainViewController ()<UIScrollViewDelegate,wjSegementDelegate>
@property(strong,nonatomic) UIScrollView* containView;
@property(strong,nonatomic) segementBar* segementView;
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

-(UIScrollView*) containView
{
        if (_containView == nil) {
        UIScrollView* containView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, self.view.width, self.view.height)];
        containView.delegate = self;
        containView.showsHorizontalScrollIndicator = NO;
        containView.pagingEnabled = YES;
        containView.bounces = NO;
         containView.tag = 1000;
        _containView = containView;
    }
    return _containView;
}

-(UIView*) segementView
{
    if (_segementView == nil) {
        _segementView = [segementBar bar];
        _segementView.customeDelegate = self;
        _segementView.tag = 0;
    }
    return _segementView;
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
    
    NSInteger currentIndex = self.containView.subviews.count;
    CGFloat viewX = currentIndex*viewWidth;
    CGFloat viewY = 0;
    CGFloat viewW = viewWidth;
    CGFloat viewH = viewHeigh;
    [ctrl.view  setFrame:CGRectMake(viewX, viewY, viewW,viewH)];
    
    [self.containView addSubview:ctrl.view];
     [self.containView setContentSize:CGSizeMake(self.containView.subviews.count*viewWidth,0)];
    
    if (ctrl.title == nil) {
        ctrl.title = [NSString stringWithFormat:@"item%d",(int)self.containView.subviews.count];
    }
    [self.segementView addBtn:ctrl.title];
}

-(void) clickBtnAtTag:(NSInteger)tag
{
    [UIView animateWithDuration:0.2 animations:^{
        self.containView.contentOffset = CGPointMake(tag*self.view.width, 0);
    }];
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger i;
    CGFloat distancen = scrollView.contentOffset.x / self.view.width;
    CGFloat sliderDistance = scrollView.contentOffset.x;
   if(scrollView.contentOffset.x > beforeX)
   {
      [self.segementView   sliderMove:sliderDistance];
       i  =floor(distancen + 0.5);
       
       [self.segementView moveToButtonAtIndex:i];

   }
  else
  {
     [self.segementView   sliderMove:sliderDistance];
      i =ceil(distancen - 0.5);
      
      [self.segementView moveToButtonAtIndex:i];
      
  }
    beforeX = scrollView.contentOffset.x;

}

- (void)viewDidLoad {

    [self.view addSubview:self.segementView];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
