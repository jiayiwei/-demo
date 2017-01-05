//
//  SortView.m
//  冒泡可视化demo
//
//  Created by z on 2017/1/5.
//  Copyright © 2017年 ja. All rights reserved.
//

#import "SortView.h"
#define ScreenHeight  [[UIScreen mainScreen] bounds].size.height
@implementation SortView
- (instancetype)initWithFrame:(CGRect)frame WithNum:(NSInteger)num
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatBaseView:num];
    }
    return self;
}
- (void)creatBaseView:(NSInteger)num
{
     CGRect frame = self.frame;
    CGFloat SortContentH = frame.size.width;
    CGFloat height =  num *SortContentH;
    frame.size.height = height;
    frame.origin.y = ScreenHeight - height;
    self.frame = frame;
    
    
    for (int i = 0; i < num; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bubbling@2x.jpg"]];
        imageView.frame = CGRectMake(0, i *SortContentH, SortContentH, SortContentH);
        [self addSubview:imageView];
    }
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
