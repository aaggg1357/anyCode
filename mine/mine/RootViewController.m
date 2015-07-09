//
//  RootViewController.m
//  mine
//
//  Created by 1 on 15/6/15.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "RootViewController.h"
#import "Person.h"
#import "RootView.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) RootView *RootVC;
@property (nonatomic, retain) NSMutableArray *allDataArray;
@property (nonatomic, retain) NSMutableArray *allKeyArray;



@end

@implementation RootViewController

- (void)loadView
{
    //使用自定义VIEW替换掉自带view
    self.RootVC = [[[RootView alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];
    self.view = _RootVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    _RootVC.tableView.dataSource = self;
    _RootVC.tableView.delegate = self;
}

- (void)loadData
{
    self.allDataArray = [NSMutableArray array];
    
    Person *p1 = [Person personWithName:@"laoda" gender:@"woman" phoneNumber:@"133" age:12 introduce:@"大家好，我叫松松，我是胖胖"];
    Person *p2 = [Person personWithName:@"longsong" gender:@"man" phoneNumber:@"135" age:12  introduce:@"大家好，我叫松松，小明小松松，大名大松松，原名：鸟叔"];
    Person *p3 = [Person personWithName:@"xiaosongsong" gender:@"man" phoneNumber:@"216" age:12  introduce:@"大家好，我叫胖胖，我是胖胖胖胖胖胖胖胖"];
    Person *p4 = [Person personWithName:@"xhongsongsong" gender:@"woman" phoneNumber:@"158" age:12  introduce:@"大家好，才是真的好"];
    Person *p5 = [Person personWithName:@"xasongsong" gender:@"man" phoneNumber:@"530" age:12  introduce:@"大家好，我叫松松，我是兽兽。。。。。。。。。"];
    Person *p6 = [Person personWithName:@"rousong" gender:@"man" phoneNumber:@"888" age:12  introduce:@"大家好，我叫松松，我是胖胖，其实我很瘦，真的很瘦的。哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"];
    
    [_allDataArray addObject:[NSMutableArray arrayWithObjects:p1, p2, nil]];
    [_allDataArray addObject:[NSMutableArray arrayWithObjects:p3, p4, p5, nil]];
    [_allDataArray addObject:[NSMutableArray arrayWithObjects:p6, nil]];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"再见了";
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _allKeyArray[section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _allKeyArray;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *mutableArray = _allDataArray[indexPath.section];
    
    if (mutableArray.count == 1) {
        [_allDataArray removeObjectAtIndex:indexPath.section];
        [_allKeyArray removeObjectAtIndex:indexPath.section];
    } else {
        [mutableArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSMutableArray *mutableArray = _allDataArray[sourceIndexPath.section];
    
    Person *p = [_allDataArray[sourceIndexPath.row] retain];
    [mutableArray removeObject:p];
    [mutableArray insertObject:p atIndex:destinationIndexPath.row];
    [p release];
    
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
        return proposedDestinationIndexPath;
    }
    return sourceIndexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *p = _allDataArray[indexPath.section][indexPath.row];
    
}

- (void)dealloc
{
    [_RootVC release];
    [_allDataArray release];
    [_allKeyArray release];
    [super dealloc];
}

@end
