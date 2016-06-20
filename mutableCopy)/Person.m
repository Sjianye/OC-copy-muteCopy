//
//  Person.m
//  mutableCopy)
//
//  Created by qingyun on 16/4/9.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "Person.h"

@implementation Person
-(NSString *)description
{
    return _name;
}
//必须实现协议中的@required方法
-(id)copyWithZone:(NSZone *)zone
{
    //方法一
    Person *p=[[Person allocWithZone:zone] init];//分配内存
    //拷贝内容
    p.name=[_name copy];//[p setName:[_name copy]];
    return p;
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    //方法二
    Person *p=[[self class] allocWithZone:zone];
    p.name=[_name mutableCopy];
    return p;
}
@end
