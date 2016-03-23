//
//  CheckBtn.m
//  Czinner
//
//  Created by ivy.sun on 16/3/21.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "CheckBtn.h"

@implementation CheckBtn

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self setImage:[UIImage imageNamed:@"checkBtn"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"checkBtn_sel"] forState:UIControlStateSelected];

}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 9, 0, 1);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 1, 0, 9);
}

@end
