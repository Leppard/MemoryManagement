//
//  OSViewController.h
//  内存管理
//
//  Created by Leppard on 14-5-20.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewOrders.h"
#import "MemoryBlock.h"

@interface OSViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *currentOrder;
@property (weak, nonatomic) IBOutlet UILabel *block1st;
@property (weak, nonatomic) IBOutlet UILabel *block2nd;
@property (weak, nonatomic) IBOutlet UILabel *block3rd;
@property (weak, nonatomic) IBOutlet UILabel *block4th;
- (IBAction)nextOrder:(id)sender;
- (IBAction)beginOrder:(id)sender;

@end
