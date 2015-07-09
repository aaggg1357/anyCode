//
//  Person.m
//  mine
//
//  Created by 1 on 15/6/15.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name
                      gender:(NSString *)gender
                 phoneNumber:(NSString *)phoneNumber
                         age:(NSInteger)age
                   introduce:(NSString *)introduce
{
    if (self = [super init]) {
        _name = [name copy];
        _gender = [gender copy];
        _phoneNumber = [phoneNumber copy];
        _introduce = [introduce copy];
        _age = age;
    }
    return self;
}

+ (instancetype)personWithName:(NSString *)name
                        gender:(NSString *)gender
                   phoneNumber:(NSString *)phoneNumber
                           age:(NSInteger)age
                     introduce:(NSString *)introduce
{
    Person *person = [[[Person alloc] initWithName:name gender:gender phoneNumber:phoneNumber age:age introduce:introduce] autorelease];
    return person;
}


@end
