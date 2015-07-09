//
//  RootView.m
//  mine
//
//  Created by 1 on 15/6/15.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "RootView.h"

@implementation RootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    self.tableView = [[[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain] autorelease];
    [self addSubview:_tableView];
    
}

@end
