//
//  ViewController.m
//  UIScrolliew视觉差动画
//
//  Created by Apple on 2018/12/7.
//  Copyright © 2018 Chen. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"

#define AnimationOffset 100

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) NSArray *pictures;
@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.pictures = @[[UIImage imageNamed:@"1"],
                      [UIImage imageNamed:@"2"],
                      [UIImage imageNamed:@"3"],
                      [UIImage imageNamed:@"4"],
                      [UIImage imageNamed:@"5"]];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*self.pictures.count, self.scrollView.bounds.size.height);
    [self.view addSubview:self.scrollView];
    
    for (NSInteger i = 0; i < self.pictures.count; i++) {
        AnimationView *animationView = [[AnimationView alloc] initWithFrame:CGRectMake(i*[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        animationView.tag = 100 + i;
        animationView.imageView.image = self.pictures[i];
        [self.scrollView addSubview:animationView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    
    AnimationView *leftAnimationView  = [scrollView viewWithTag:(index+100)];
    AnimationView *rightAnimationView = [scrollView viewWithTag:(index+1+100)];
    
    // AnimationOffset 定义的一个宏,定义为100,可以自己修改
    CGFloat scrollViewWidth = scrollView.bounds.size.width;
    CGFloat moveDistance = scrollViewWidth - AnimationOffset;
    CGFloat leftRation   = (scrollViewWidth*(index+1) - contentOffsetX)/scrollViewWidth;
    CGFloat rightRation  = (contentOffsetX - scrollViewWidth*index)/scrollViewWidth;
    
    leftAnimationView.imageViewX  = moveDistance - moveDistance*leftRation;
    rightAnimationView.imageViewX = -moveDistance + moveDistance*rightRation;
}


@end
