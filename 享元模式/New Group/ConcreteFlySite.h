//
//  ConcreteFlySite.h
//  享元模式
//
//  Created by 刘德福 on 2018/4/6.
//  Copyright © 2018年 Dreams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlySiteProtocol.h"

@interface ConcreteFlySite : NSObject <FlySiteProtocol>

@property (nonatomic, copy) NSString *webName;

@end
