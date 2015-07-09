//
//  Person.h
//  mine
//
//  Created by 1 on 15/6/15.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *introduce;

- (instancetype)initWithName:(NSString *)name
                      gender:(NSString *)gender
                 phoneNumber:(NSString *)phoneNumber
                         age:(NSInteger)age
                   introduce:(NSString *)introduce;

+ (instancetype)personWithName:(NSString *)name
                        gender:(NSString *)gender
                   phoneNumber:(NSString *)phoneNumber
                           age:(NSInteger)age
                     introduce:(NSString *)introduce;

@end
