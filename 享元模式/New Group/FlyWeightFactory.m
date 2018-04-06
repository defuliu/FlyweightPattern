//
//  FlyWeightFactory.m
//  享元模式
//
//  Created by 刘德福 on 2018/4/6.
//  Copyright © 2018年 Dreams. All rights reserved.
//

#import "FlyWeightFactory.h"
#import "ConcreteFlySite.h"

@implementation FlyWeightFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
        _flyweights= [NSDictionary dictionary];
    }
    return self;
}

- (id <FlySiteProtocol>)flyWeightCategory:(NSString *)webKey
{
    __block id <FlySiteProtocol> webFlySet = nil;
    
    [self.flyweights enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (webKey == key) {
            webFlySet = obj;
            * stop = YES;
        }
    }];
    
    if (webFlySet == nil) {
        ConcreteFlySite *concrete = [[ConcreteFlySite alloc] init];
        concrete.webName = webKey;
        webFlySet = concrete;
        
        NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:self.flyweights];
        [mutableDict setObject:webFlySet forKey:webKey];
        self.flyweights = [NSDictionary dictionaryWithDictionary:mutableDict];
    }
    
    return webFlySet;
    
}

- (NSInteger)getWebSiteCount {
    return self.flyweights.count;
}

@end
