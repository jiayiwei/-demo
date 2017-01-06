//
//  ViewController.m
//  冒泡可视化demo
//
//  Created by z on 2017/1/5.
//  Copyright © 2017年 ja. All rights reserved.
//

#import "ViewController.h"
#import "SortView.h"
#import <UIKit/UIKit.h>
#define ScreenHeight  [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()
@property (nonatomic,strong)NSMutableArray *sortViews;
@property (nonatomic,strong)NSMutableArray *resurlts;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sortViews = [[NSMutableArray alloc] init];
    NSInteger sortNum = 10;
    for (NSInteger i = 0; i < sortNum; i ++) {
        CGFloat sortW = ScreenWidth/sortNum;
        NSInteger sortNumMax = ScreenHeight/sortW;
        CGRect frame = CGRectMake(i * sortW, 0, sortW, 0);
        NSInteger arcNum = arc4random()%sortNumMax;
        arcNum = arcNum == 0 ? 1 : arcNum;
        SortView *view = [[SortView alloc] initWithFrame:frame WithNum:arcNum];
        view.tag = i;
        view.backgroundColor = [UIColor orangeColor];
        [self.sortViews addObject:view];
        [self.view addSubview:view];
    }
    
    self.resurlts = [[NSMutableArray alloc] init];
}

- (IBAction)startAction:(id)sender {
    
    [self.resurlts removeAllObjects];
    NSInteger o = 0;
    for (NSInteger i = 0; i < self.sortViews.count; i ++) {
        
        for (NSInteger j = i+ 1; j < self.sortViews.count; j ++) {
            
            
            SortView* view1 = (SortView *)self.sortViews[i] ;
            SortView *view2 = (SortView *)self.sortViews[j];
            CGRect frame1 = view1.frame;
            CGRect frame2 = view2.frame;
            if (frame1.size.height > frame2.size.height) {
                [self.sortViews exchangeObjectAtIndex:i withObjectAtIndex:j];
                [self.resurlts addObject:view2];
                o ++;
            }
        }
    }
    for (SortView *view in self.resurlts) {
        NSLog(@"%zd",view.tag);
        
    }
    NSLog(@"o==%zd",o);


}
- (void)exChangeSortView:(SortView *)view1 With:(SortView *)view2
{
   
    
   __block CGRect frame1 = view1.frame;
   __block CGRect tempFrme = frame1;
   __block CGRect frame2 = view2.frame;
    tempFrme = frame1;
    [UIView animateWithDuration:.8 animations:^{
        frame1.origin.x = frame2.origin.x;
        frame2.origin.x = tempFrme.origin.x;
        view2.frame = frame2;
        view1.frame = frame1;
    } completion:^(BOOL finished) {
        [NSThread sleepForTimeInterval:1];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
