//
//  Model.m
//  Record
//
//  Created by ivy.sun on 16/3/22.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "Model.h"

@implementation Model
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.feed = [aDecoder decodeBoolForKey:@"feed"];
        self.dabian = [aDecoder decodeBoolForKey:@"dabian"];
        self.xiaobian = [aDecoder decodeBoolForKey:@"xiaobian"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeBool:self.feed forKey:@"feed"];
    [aCoder encodeBool:self.dabian forKey:@"dabian"];
    [aCoder encodeBool:self.xiaobian forKey:@"xiaobian"];
}
@end
