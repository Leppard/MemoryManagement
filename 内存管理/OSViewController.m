//
//  OSViewController.m
//  内存管理
//
//  Created by Leppard on 14-5-20.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "OSViewController.h"


@interface OSViewController ()
{
    NewOrders* neworders;
    NSInteger countNumber;
    NSInteger currentPosition;
}
@end

@implementation OSViewController

@synthesize currentOrder;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    neworders = [[NewOrders alloc]init];
    [neworders newAllPages];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)nextOrder:(id)sender
{
    if (countNumber < 320)
    {
        if (countNumber%4 == 0)
        {
            currentPosition = arc4random()%currentPosition;
            [self showCurrentOrder:currentPosition];
            countNumber++;
        }
        else if (countNumber%4 == 1)
        {
            currentPosition++;
            [self showCurrentOrder:currentPosition];
            countNumber++;
        }
        else if (countNumber%4 == 2)
        {
            currentPosition = arc4random()%(320-currentPosition)+currentPosition;
            [self showCurrentOrder:currentPosition];
            countNumber++;
        }
        else if (countNumber%4 == 3)
        {
            currentPosition++;
            [self showCurrentOrder:currentPosition];
            countNumber++;
        }
    }
}

- (IBAction)beginOrder:(id)sender
{
    currentPosition = 320;
    currentPosition = arc4random()%currentPosition;
    [self showCurrentOrder:currentPosition];

}

-(void) showCurrentOrder:(NSInteger) numb
{
    NSNumber* num = [[NSNumber alloc]initWithInteger:numb];
    NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
    currentOrder.text = str;
}
@end
