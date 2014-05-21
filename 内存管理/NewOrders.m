//
//  NewOrders.m
//  内存管理
//
//  Created by Leppard on 14-5-20.
//  Copyright (c) 2014年 Leppard. All rights reserved.
//

#import "NewOrders.h"

@implementation NewOrders
{
    NSMutableArray* _pages;
}

-(void)newAllPages
{
    _pages = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<32; i++)
    {
        for (NSInteger j = 0; j<10; j++)
        {
            NSMutableArray* _orders = [[NSMutableArray alloc]initWithCapacity:20];
            [_pages addObject:_orders];
            NSInteger temp = j+i*10;
            [_pages[i] addObject:[NSNumber numberWithInteger:temp]];
        }
 
    }
}

-(NSMutableArray*) returnPages
{
    return _pages;
}
@end
