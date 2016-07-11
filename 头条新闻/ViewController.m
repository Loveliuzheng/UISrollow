//
//  ViewController.m
//  头条新闻
//
//  Created by cqy on 16/4/30.
//  Copyright © 2016年 刘征. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>{
    
    UIScrollView *scrollow;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    scrollow = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 200, 414, 300)];
    
    scrollow.contentSize = CGSizeMake(414*4, 300);
    scrollow.backgroundColor = [UIColor grayColor];
    scrollow.pagingEnabled = YES;
    [self.view addSubview:scrollow];
    for (int index = 0; index<4; index++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(414*index, 0, 414, 300)];
        
        NSString *string = [NSString stringWithFormat:@"%d.JPG",index+1];
        
        imageView.image = [UIImage imageNamed:string];
        
        [scrollow addSubview:imageView];
    }
    
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 470, 414, 30)];
    [pageControl addTarget:self action:@selector(clickPageControl:) forControlEvents:UIControlEventValueChanged];
    pageControl.numberOfPages = 4;
    pageControl.tag = 101;
    pageControl.backgroundColor = [UIColor redColor];
    [self.view addSubview:pageControl];
    
    
    scrollow.delegate = self;
    
}
-(void)clickPageControl:(UIPageControl *)pageControl{
    
    scrollow.contentOffset = CGPointMake(pageControl.currentPage*414, 0);
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    int current = scrollView.contentOffset.x / 414;
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:101];
    pageControl.currentPage = current;
    
}






@end
