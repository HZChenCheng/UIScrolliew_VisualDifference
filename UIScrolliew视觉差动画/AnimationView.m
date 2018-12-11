//
//  AnimationView.m
//  UIScrolliew视觉差动画
//
//  Created by Apple on 2018/12/7.
//  Copyright © 2018 Chen. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)setImageViewX:(CGFloat)imageViewX {
    _imageViewX = imageViewX;
    self.imageView.frame = CGRectMake(imageViewX, 0, self.imageView.bounds.size.width, self.imageView.bounds.size.height);
}

@end
