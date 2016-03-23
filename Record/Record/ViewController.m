//
//  ViewController.m
//  Record
//
//  Created by ivy.sun on 16/3/22.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "ViewController.h"
#import "CheckBtn.h"
#import "Model.h"
#import "TableViewController.h"


@interface ViewController ()

{
    CheckBtn *_btn1;
    CheckBtn *_btn2;
    CheckBtn *_btn3;
    
}

@property (nonatomic,strong) NSMutableArray  *feedArry;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString * filename = [path stringByAppendingPathComponent:@"feedArry.data"];
    if([fileManager fileExistsAtPath:filename]){
    _feedArry = [NSKeyedUnarchiver unarchiveObjectWithFile:filename];
    }
//    _feedArry = [NSMutableArray arrayWithContentsOfFile:filename];
    if (!_feedArry) {
        _feedArry = [NSMutableArray array];
        [_feedArry writeToFile:filename atomically:YES];
    }
    CheckBtn *btn1 = [[CheckBtn alloc]initWithFrame:CGRectMake(110, 80, 100, 30)];
    [btn1 setTitle:@"喂奶" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    _btn1 = btn1;
    
    CheckBtn *btn2 = [[CheckBtn alloc]initWithFrame:CGRectMake(110, 120, 100, 30)];
    [btn2 setTitle:@"大便" forState:UIControlStateNormal];
     [btn2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
    _btn2 = btn2;
    
    CheckBtn *btn3 = [[CheckBtn alloc]initWithFrame:CGRectMake(110, 160, 100, 30)];
    [btn3 setTitle:@"小便" forState:UIControlStateNormal];
     [btn3 addTarget:self action:@selector(btn3Click:) forControlEvents:UIControlEventTouchUpInside];
    _btn3 = btn3;
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    
    UIButton *add = [[UIButton alloc]initWithFrame:CGRectMake(50, 240, 200, 30)];
    [add setBackgroundColor:[UIColor greenColor]];
    [add setTitle:@"记录" forState:UIControlStateNormal];
    [add addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:add];
    
    UIButton *check = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, 200, 30)];
    [check setBackgroundColor:[UIColor greenColor]];
    [check setTitle:@"查看" forState:UIControlStateNormal];
    [check addTarget:self action:@selector(check) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:check];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) btn3Click:(CheckBtn *)sender{
    sender.selected = !sender.selected;
}
-(void) btn2Click:(CheckBtn *)sender{
    sender.selected = !sender.selected;
}
-(void) btn1Click:(CheckBtn *)sender{
    sender.selected = !sender.selected;
}
-(void) add{
    if (!_btn1.selected && !_btn2.selected && !_btn3.selected) {
        return;
    }
    Model *model = [Model new];
    model.feed =  _btn1.selected;
    model.dabian = _btn2.selected;
    model.xiaobian = _btn3.selected;
    NSDate *date = [NSDate date];
    NSDateFormatter *fam = [[NSDateFormatter alloc]init];
    fam.dateFormat = @"yyyy-MM-dd HH:mm";
    model.time = [fam stringFromDate:date];
    [self.feedArry insertObject:model atIndex:0];
//    [self.feedArry addObject:model];
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString * filename = [path stringByAppendingPathComponent:@"feedArry.data"];
    [NSKeyedArchiver archiveRootObject:self.feedArry toFile:filename];
//    [self.feedArry writeToFile:filename atomically:NO];
    _btn1.selected = NO;
    _btn2.selected = NO;
    _btn3.selected = NO;
    
    
    
}
-(void) check{
    TableViewController *VC = [[TableViewController alloc]init];
    VC.feedArry = self.feedArry;
    [self presentViewController:VC animated:YES completion:nil];
}
@end
