//
//  main.m
//  mutableCopy)
//
//  Created by qingyun on 16/4/9.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str1=@"hello";
        NSString *str2=[str1 copy];//浅拷贝
        NSLog(@"str1=%p,str2=%p",str1,str2);
        //改变str1(改变的是指针的指向，那么str2不会变！)
        str1=@"ios";
        NSLog(@"%@,%@",str1,str2);
        NSMutableString *str3=[str1 mutableCopy];//深拷贝,会产生新的内存
        NSLog(@"str1=%p,str3=%p",str1,str3);
        [str3 appendString:@"monday"];
        NSLog(@"str3=%@",str3);
        
        NSArray *arr1=@[@"hello",@"ios",@"oc"];
        NSArray *arr2=[arr1 copy];
        NSLog(@"arr1=%p,arr2=%p",arr1,arr2);
        NSMutableArray *mulArr=[arr1 mutableCopy];//不可变变可变
        NSLog(@"arr1=%p,mulArr=%p",arr1,mulArr);
        [mulArr addObject:@"小明"];
        NSLog(@"mulArr=%@",mulArr);
        
        NSMutableDictionary *mulDic=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"xiaoming",@"name",@"21",@"age", nil];
        NSDictionary *dic1=[mulDic copy];//可变变不可变，产生新的内存
        NSLog(@"》》%p,%p",mulDic,dic1);
        
        NSMutableDictionary *mulDic2=[mulDic mutableCopy];
        [mulDic2 setObject:@"男" forKey:@"性别"];
        [mulDic2 removeObjectForKey:@"name"];
        NSLog(@"%@",mulDic2);
        
//        NSMutableDictionary *mulDic3=[mulDic copy];
//        [mulDic3 setObject:@"qinghua" forKey:@"大学"];
//        NSLog(@">>>%@",mulDic3);
        //总结:
        //copy他的返回值对象是不可变的！可能产生新的内存，但是内存中的内容相同
        //mutableCopy 他的返回值对象是可变的！一定会产生新的内存，内存中内容也相同
        
        //自定义类的对象的拷贝
        Person *p1=[Person new];
        [p1 setName:@"ios"];
        Person *p2=[p1 copy];//注意！对于自定义的类对象，在使用拷贝的时候，必须遵循NSCopying或者NSMutableCopy协议
        NSLog(@"%p,%p,%@,%@",p1,p2,p1,p2);
        Person *p3=[p1 mutableCopy];
        NSLog(@"%p,%p,%@,%@",p1,p3,p1,p3);
    }
    return 0;
}
