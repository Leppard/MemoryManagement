//
//  MemoryBlock.m
//  内存管理
//
//  Created by Leppard on 14-5-22.
//  Copyright (c) 2014年 Leppard. All rights reserved.
//

#import "MemoryBlock.h"

@implementation MemoryBlock

@synthesize the_page;
@synthesize fifo_count;
@synthesize flag;

-(NSInteger)transformOrderToPage:(NSInteger)order
{
    NSInteger page = order/10;
    return page;
}
@end
