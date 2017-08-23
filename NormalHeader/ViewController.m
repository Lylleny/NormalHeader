//
//  ViewController.m
//  Exam
//
//  Created by Lyalleny on 2017/8/23.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "ViewController.h"
#import "LYTableHeader.h"
#import "LYWaterwaveHeader.h"
#import "LYAnmationHeader.h"

#define Width  [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    LYTableHeader *header;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    header = [[LYTableHeader alloc]initWithFrame:CGRectMake(0, 0, Width, 130)];
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
    scroll.delegate = self;
    scroll.contentSize = CGSizeMake(Width, 1000);
    scroll.scrollEnabled = YES;
    scroll.showsVerticalScrollIndicator = YES;
    [self.view addSubview:scroll];
    
    [scroll addSubview:header];
    
    LYAnmationHeader *view = [[ LYAnmationHeader alloc]initWithFrame:CGRectMake(0, 180, Width, 180)];
    [scroll addSubview:view];
    
    LYWaterwaveHeader *waterWaveView = [[LYWaterwaveHeader alloc]initWithFrame:CGRectMake(0, 370, Width, 200)];
    [scroll addSubview:waterWaveView];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offet =scrollView.contentOffset.y;
    if (offet<0) {
        [header updateImageFram:offet];
    }
}

@end
