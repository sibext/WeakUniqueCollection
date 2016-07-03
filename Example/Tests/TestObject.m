//
//  TestObject.m
//  WeakUniqueCollection
//
//  Created by Artem Gladkov on 03.07.16.
//  Copyright © 2016 Artyom Gladkov. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    if ([object isKindOfClass:[TestObject class]]) {
        return [self isEqualToTestObject:object];
    }
    return NO;
}

- (BOOL)isEqualToTestObject:(TestObject *)testObject
{
    if ([testObject.name isEqualToString:self.name]){
        return YES;
    }
    return NO;
}

- (NSUInteger)hash
{
    return [self.name hash];
}

@end
