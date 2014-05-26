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
    
    float lackcount;
    float lackrate;
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
    
    block_1.the_page = 32;
    block_2.the_page = 32;
    block_3.the_page = 32;
    block_4.the_page = 32;
    // 初始化内存中的页为32，既在页号可变范围之外，页不会因为初始值是0与checkIfPageExist冲突
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
    self.block1st.backgroundColor = nil;
    self.block2nd.backgroundColor = nil;
    self.block3rd.backgroundColor = nil;
    self.block4th.backgroundColor = nil;
    
    [self showOrder];
    
    countNumber++;
        
/////////////////////////////////
 
    bool page_exist = [self checkIfPageExist];
 
/////////////////////////////////
    if (!page_exist)
{
        
    if (block_2.flag == 0)
    {
        lackcount++;
        lackrate = lackcount/countNumber*100;
        NSNumber* lcount = [[NSNumber alloc]initWithFloat:lackcount];
        NSString* lstr = [[NSString alloc]initWithFormat:@"%@",lcount];
        NSNumber* count = [[NSNumber alloc]initWithFloat:lackrate];
        NSString* cstr = [[NSString alloc]initWithFormat:@"%@%%",count];
        self.lackOfPageCount.text = lstr;
        self.lackOfPageRate.text = cstr;
        
        block_2.the_page = [block_2 transformOrderToPage:currentPosition];
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_2.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block2nd.text = str;
        block_2.flag = 1;
        block_2.fifo_count = 0;
    }
    else if (block_3.flag == 0)
    {
        lackcount++;
        lackrate = lackcount/countNumber*100;
        NSNumber* lcount = [[NSNumber alloc]initWithFloat:lackcount];
        NSString* lstr = [[NSString alloc]initWithFormat:@"%@",lcount];
        NSNumber* count = [[NSNumber alloc]initWithFloat:lackrate];
        NSString* cstr = [[NSString alloc]initWithFormat:@"%@%%",count];
        self.lackOfPageCount.text = lstr;
        self.lackOfPageRate.text = cstr;
        
        block_3.the_page = [block_3 transformOrderToPage:currentPosition];
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_3.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block3rd.text = str;
        block_3.flag = 1;
        block_3.fifo_count = 0;
    }
    else if (block_4.flag == 0)
    {
        lackcount++;
        lackrate = lackcount/countNumber*100;
        NSNumber* lcount = [[NSNumber alloc]initWithFloat:lackcount];
        NSString* lstr = [[NSString alloc]initWithFormat:@"%@",lcount];
        NSNumber* count = [[NSNumber alloc]initWithFloat:lackrate];
        NSString* cstr = [[NSString alloc]initWithFormat:@"%@%%",count];
        self.lackOfPageCount.text = lstr;
        self.lackOfPageRate.text = cstr;
        
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
        lackcount++;
        lackrate = lackcount/countNumber*100;
        NSNumber* lcount = [[NSNumber alloc]initWithFloat:lackcount];
        NSString* lstr = [[NSString alloc]initWithFormat:@"%@",lcount];
        NSNumber* count = [[NSNumber alloc]initWithFloat:lackrate];
        NSString* cstr = [[NSString alloc]initWithFormat:@"%@%%",count];
        self.lackOfPageCount.text = lstr;
        self.lackOfPageRate.text = cstr;
        NSInteger currentpage = currentPosition/10;
        [self swapPage:currentpage];
    }
}
/////////////////////////////////////
    
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
        lackcount++;
        countNumber++;
        lackrate = 100;
        NSNumber* lcount = [[NSNumber alloc]initWithFloat:lackcount];
        NSString* lstr = [[NSString alloc]initWithFormat:@"%@",lcount];
        NSNumber* count = [[NSNumber alloc]initWithFloat:lackrate];
        NSString* cstr = [[NSString alloc]initWithFormat:@"%@%%",count];
        self.lackOfPageCount.text = lstr;
        self.lackOfPageRate.text = cstr;
        
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
    if ((countNumber-1)%4 == 0)
    {
        currentPosition = arc4random()%currentPosition;
        [self showCurrentOrder:currentPosition];
    }
    else if ((countNumber-1)%4 == 1)
    {
        currentPosition++;
        [self showCurrentOrder:currentPosition];
    }
    else if ((countNumber-1)%4 == 2)
    {
        currentPosition = arc4random()%(320-currentPosition)+currentPosition;
        [self showCurrentOrder:currentPosition];
    }
    else if ((countNumber-1)%4 == 3)
    {
        currentPosition++;
        [self showCurrentOrder:currentPosition];
    }

}

-(BOOL)checkIfPageExist
{
    
    NSInteger currentpage = currentPosition/10;
    
    BOOL temp = NO;
    if (currentpage == block_1.the_page)
    {
        self.block1st.backgroundColor = [UIColor greenColor];
        temp = YES;
    }
    else if(currentpage == block_2.the_page)
    {
        self.block2nd.backgroundColor = [UIColor greenColor];
        temp = YES;
    }
    else if (currentpage == block_3.the_page)
    {
        self.block3rd.backgroundColor = [UIColor greenColor];
        temp = YES;
    }
    else if (currentpage == block_4.the_page)
    {
        self.block4th.backgroundColor = [UIColor greenColor];
        temp = YES;
    }
    
    lackrate = lackcount/countNumber*100;
    NSNumber* lcount = [[NSNumber alloc]initWithFloat:lackcount];
    NSString* lstr = [[NSString alloc]initWithFormat:@"%@",lcount];
    NSNumber* count = [[NSNumber alloc]initWithFloat:lackrate];
    NSString* cstr = [[NSString alloc]initWithFormat:@"%@%%",count];
    self.lackOfPageCount.text = lstr;
    self.lackOfPageRate.text = cstr;
    
    return temp;
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

        NSString* str1 = [[NSString alloc]initWithFormat:@"将第%@页调入内存块1中",num];
        [[[UIAlertView alloc]initWithTitle:@"发生缺页！" message:str1 delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil,nil] show];
    }
    if (maxblock == 2)
    {
        block_2.the_page = currentpage;
        block_2.fifo_count = 0;
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_2.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block2nd.text = str;
        
        NSString* str1 = [[NSString alloc]initWithFormat:@"将第%@页调入内存块2中",num];
        [[[UIAlertView alloc]initWithTitle:@"发生缺页！" message:str1 delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil,nil] show];
    }
    if (maxblock == 3)
    {
        block_3.the_page = currentpage;
        block_3.fifo_count = 0;
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_3.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block3rd.text = str;
        
        NSString* str1 = [[NSString alloc]initWithFormat:@"将第%@页调入内存块3中",num];
        [[[UIAlertView alloc]initWithTitle:@"发生缺页！" message:str1 delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil,nil] show];
    }
    if (maxblock == 4)
    {
        block_4.the_page = currentpage;
        block_4.fifo_count = 0;
        NSNumber* num = [[NSNumber alloc]initWithInteger:block_4.the_page];
        NSString* str = [[NSString alloc]initWithFormat:@"%@",num];
        self.block4th.text = str;
        
        NSString* str1 = [[NSString alloc]initWithFormat:@"将第%@页调入内存块4中",num];
        [[[UIAlertView alloc]initWithTitle:@"发生缺页！" message:str1 delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil,nil] show];
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
