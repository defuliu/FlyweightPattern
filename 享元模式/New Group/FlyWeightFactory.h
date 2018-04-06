//
//  FlyWeightFactory.h
//  享元模式
//
//  Created by 刘德福 on 2018/4/6.
//  Copyright © 2018年 Dreams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlySiteProtocol.h"

@interface FlyWeightFactory : NSObject

@property (nonatomic, strong) NSDictionary *flyweights; //共享对象

- (id <FlySiteProtocol>)flyWeightCategory:(NSString *) webKey;

- (NSInteger )getWebSiteCount;

@end
