//
//  Model.h
//  Record
//
//  Created by ivy.sun on 16/3/22.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject <NSCoding>
@property (nonatomic,assign) BOOL  feed;
@property (nonatomic,assign) BOOL  dabian;
@property (nonatomic,assign) BOOL  xiaobian;
@property (nonatomic,copy) NSString  *time;
@end
