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
    MemoryBlock* block_1;
    MemoryBlock* block_2;
    MemoryBlock* block_3;
    MemoryBlock* block_4;
    NSInteger flag;

}
@end

@implementation OSViewController

@synthesize currentOrder;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    neworders = [[NewOrders alloc]init];
    [neworders newAllPages];
    
    block_1 = [[MemoryBlock alloc]init];
    block_2 = [[MemoryBlock alloc]init];
    block_3 = [[MemoryBlock alloc]init];
    block_4 = [[MemoryBlock alloc]init];
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
        [self showOrder];
        
/////////////////////////////////
 bool page_exist = [self checkIfPageExist];
  
    if (!page_exist)
{

/////////////////////////////////
        
    if (block_2.flag == 0)
    {
        block_2.the_page = [block_2 transformOrderToPage:currentPosition];
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_2.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block2nd.text = str;
        block_2.flag = 1;
        block_2.fifo_count = 0;
    }
    else if (block_3.flag == 0)
    {
        block_3.the_page = [block_3 transformOrderToPage:currentPosition];
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_3.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block3rd.text = str;
        block_3.flag = 1;
        block_3.fifo_count = 0;
    }
    else if (block_4.flag == 0)
    {
        block_4.the_page = [block_4 transformOrderToPage:currentPosition];
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_4.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block4th.text = str;
        block_4.flag = 1;
        block_4.fifo_count = 0;
    }

///////////////////////////////////
    else if (!page_exist)
    {
            NSInteger currentpage = currentPosition/10;
            [self swapPage:currentpage];
    }
}
/////////////////////////////////////
        
    countNumber ++;
    
    block_1.fifo_count ++;
    block_2.fifo_count ++;
    block_3.fifo_count ++;
    block_4.fifo_count ++;
}
}

- (IBAction)beginOrder:(id)sender
{
    if (flag == 0)
    {
        currentPosition = 320;
        currentPosition = arc4random()%currentPosition;
        [self showCurrentOrder:currentPosition];
        block_1.the_page = [block_1 transformOrderToPage:currentPosition];
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_1.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block1st.text = str;
        block_1.flag = 1;
        block_1.fifo_count ++;
        flag = 1;
    }
    else
    {
        [[[UIAlertView alloc]initWithTitle:@"别乱点啊～" message:@"调页已开始，请点击“执行下一条指令”来继续" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil] show];
    }
}


-(void) showCurrentOrder:(NSInteger) numb
{
    NSNumber* num = [[NSNumber alloc]initWithInteger:numb];
    NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
    currentOrder.text = str;
}

-(void) showOrder
{
    if (countNumber%4 == 0)
    {
        currentPosition = arc4random()%currentPosition;
        [self showCurrentOrder:currentPosition];
    }
    else if (countNumber%4 == 1)
    {
        currentPosition++;
        [self showCurrentOrder:currentPosition];
    }
    else if (countNumber%4 == 2)
    {
        currentPosition = arc4random()%(320-currentPosition)+currentPosition;
        [self showCurrentOrder:currentPosition];
    }
    else if (countNumber%4 == 3)
    {
        currentPosition++;
        [self showCurrentOrder:currentPosition];
    }

}

-(BOOL)checkIfPageExist
{
    
    NSInteger currentpage = currentPosition/10;
    
    if (currentpage == block_1.the_page)
    {
        NSNumber* num = [[NSNumber alloc]initWithInteger:currentpage];
        NSString* str = [[NSString alloc]initWithFormat:@"第%@页已经在内存块1内",num];
        [[[UIAlertView alloc]initWithTitle:@"Bingo" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil,nil] show];
        return YES;
    }
    else if(currentpage == block_2.the_page)
    {
        NSNumber* num = [[NSNumber alloc]initWithInteger:currentpage];
        NSString* str = [[NSString alloc]initWithFormat:@"第%@页已经在内存块2内",num];
        [[[UIAlertView alloc]initWithTitle:@"Bingo" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil,nil] show];
        return YES;
    }
    else if (currentpage == block_3.the_page)
    {
        NSNumber* num = [[NSNumber alloc]initWithInteger:currentpage];
        NSString* str = [[NSString alloc]initWithFormat:@"第%@页已经在内存块3内",num];
        [[[UIAlertView alloc]initWithTitle:@"Bingo" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil,nil] show];
        return YES;
    }
    else if (currentpage == block_4.the_page)
    {
        NSNumber* num = [[NSNumber alloc]initWithInteger:currentpage];
        NSString* str = [[NSString alloc]initWithFormat:@"第%@页已经在内存块4内",num];
        [[[UIAlertView alloc]initWithTitle:@"Bingo" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil,nil] show];
        return YES;
    }
    return NO;
    
}

-(void)swapPage:(NSInteger)currentpage
{
    NSInteger maxblock = [self compare:block_1.fifo_count with:block_2.fifo_count with:block_3.fifo_count with:block_4.fifo_count];
    if (maxblock == 1)
    {
        block_1.the_page = currentpage;
        block_1.fifo_count = 0;
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_1.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block1st.text = str;
    }
    if (maxblock == 2)
    {
        block_2.the_page = currentpage;
        block_2.fifo_count = 0;
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_2.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block2nd.text = str;
    }
    if (maxblock == 3)
    {
        block_3.the_page = currentpage;
        block_3.fifo_count = 0;
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_3.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block3rd.text = str;
    }
    if (maxblock == 4)
    {
        block_4.the_page = currentpage;
        block_4.fifo_count = 0;
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_4.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block4th.text = str;
    }
    
}

-(NSInteger)compare:(NSInteger)a with:(NSInteger)b with:(NSInteger)c with:(NSInteger)d
{
    NSInteger block = 1;
    if (a<b)
    {
        a = b;
        block = 2;
    }
    if (a<c)
    {
        a = c;
        block = 3;
    }
    if (a<d)
    {
        block = 4;
    }
    return block;
}
@end
