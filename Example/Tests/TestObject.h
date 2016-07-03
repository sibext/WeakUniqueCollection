//
//  TestObject.h
//  WeakUniqueCollection
//
//  Created by Artem Gladkov on 03.07.16.
//  Copyright © 2016 Artyom Gladkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject

@property(copy,nonatomic)NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
