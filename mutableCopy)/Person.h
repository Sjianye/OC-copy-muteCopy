//
//  Person.h
//  mutableCopy)
//
//  Created by qingyun on 16/4/9.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying,NSMutableCopying>//必须遵循协议!!
@property(nonatomic,strong)NSString *name;
@end
