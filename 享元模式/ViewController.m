//
//  ViewController.m
//  享元模式
//
//  Created by 刘德福 on 2018/4/6.
//  Copyright © 2018年 Dreams. All rights reserved.
//

#import "ViewController.h"
#import "FlyWeightFactory.h"
#import "ConcreteFlySite.h"
#import "User.h"
#import "FlySiteProtocol.h"

typedef id <FlySiteProtocol> WebsiteType;

@interface ViewController ()

@end

@implementation ViewController


- (NSArray *)testArray
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSInteger i =  0; i < 5000; i ++) {
        if (i %2 == 0) {
            [array addObject:[NSString stringWithFormat:@"订单%ld",(long)i]];
        }
        else {
            [array addObject:[NSString stringWithFormat:@"订单%ld",(long)i]];
        }
    }
    
    return array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 通过工厂方法返回各种具体享元对象,维护池中的享元对象
    FlyWeightFactory *factory = [[FlyWeightFactory alloc] init];
    
    
    for (NSInteger i = 0; i < [self testArray].count; i++ ) {
        WebsiteType type  = [factory flyWeightCategory:[self testArray][i]];
        User *user = [[User alloc] init];
        user.useName = [NSString stringWithFormat:@"用户%ld",i];
        [type use:user];
    }
    
//     WebsiteType type1 =  [factory flyWeightCategory:@"首页"];
//
//    NSLog(@"factroy=====:%ld",[factory getWebSiteCount]);
//
////    //  返回具体的享元对象
//
//    User *user1 = [[User alloc] init];
//    user1.useName = @"张三";
//    // 享元对象都具有use方法
//    [type1 use:user1];
//
//    WebsiteType type2 = [factory flyWeightCategory:@"商店"];
//    User *user2 = [[User alloc] init];
//    user2.useName = @"李四";
//    [type2 use:user2];
//
//     NSLog(@"factroy111=====:%ld",[factory getWebSiteCount]);
}




@end
