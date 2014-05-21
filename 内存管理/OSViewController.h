//
//  OSViewController.h
//  内存管理
//
//  Created by Leppard on 14-5-20.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewOrders.h"

@interface OSViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *currentOrder;
- (IBAction)nextOrder:(id)sender;
- (IBAction)beginOrder:(id)sender;

@end
