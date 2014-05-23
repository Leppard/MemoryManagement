//
//  MemoryBlock.h
//  内存管理
//
//  Created by Leppard on 14-5-22.
//  Copyright (c) 2014年 Leppard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemoryBlock : NSObject
@property NSInteger the_page;
@property NSInteger fifo_count;
@property NSInteger flag;

-(NSInteger) transformOrderToPage:(NSInteger) order;
@end
