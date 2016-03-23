//
//  TableViewController.m
//  Record
//
//  Created by ivy.sun on 16/3/22.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "TableViewController.h"
#import "Model.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    [btn setBackgroundColor:[UIColor greenColor]];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];

    self.tableView.tableHeaderView = btn;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.feedArry.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Model *model = self.feedArry[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text =model.time;
    NSMutableString *str = [NSMutableString string];
    if (model.feed) {
        [str appendString:[NSString stringWithFormat:@"喂：%d次  ",model.feed]];
    }
    if (model.dabian) {
        [str appendString:[NSString stringWithFormat:@"大：%d次   ",model.dabian]];
    }
    if (model.xiaobian) {
        [str appendString:[NSString stringWithFormat:@"小：%d次  ",model.xiaobian]];
    }
    cell.detailTextLabel.text = str;
    
    
    return cell;
}


-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"%d", indexPath.row);
        [self.feedArry removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
        NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
        NSString * filename = [path stringByAppendingPathComponent:@"feedArry.data"];
        [NSKeyedArchiver archiveRootObject:self.feedArry toFile:filename];
    }
}

@end
