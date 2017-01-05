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
        [self.sortViews addObject:view];
        [self.view addSubview:view];
    }
   
}

- (IBAction)startAction:(id)sender {
    
    [self.sortViews sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        SortView* view1 = (SortView *)obj1 ;
        SortView *view2 = (SortView *)obj2 ;
        CGRect frame1 = view1.frame;
        CGRect frame2 = view2.frame;
        CGRect tempFrme = frame1;
        if (view1.frame.size.height > view2.frame.size.height) {
            tempFrme = frame1;
            frame1.origin.x = frame2.origin.x;
            frame2.origin.x = tempFrme.origin.x;
            view2.frame = frame2;
            view1.frame = frame1;
            return NSOrderedDescending;
        }
        if (view1.frame.size.height < view2.frame.size.height) {
            tempFrme = frame1;
            frame1.origin.x = frame2.origin.x;
            frame2.origin.x = tempFrme.origin.x;
            view2.frame = frame2;
            view1.frame = frame1;
            return NSOrderedAscending;
        }
        return NSOrderedSame;
    }];
    
    for (NSInteger i = 0; i < self.sortViews.count; i ++) {
        NSInteger j = self.sortViews.count - 1;
        while (j > i) {
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
