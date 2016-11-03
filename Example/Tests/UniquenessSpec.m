//
//  UniquenessSpec.m
//  WeakUniqueCollection
//
//  Created by Artem Gladkov on 29.06.16.
//  Copyright © 2016 Artyom Gladkov. All rights reserved.
//
#import <WeakUniqueCollection/WeakUniqueCollection-umbrella.h>
#import "TestObject.h"

SpecBegin(Uniqueness)

describe(@"uniqueness maintaining", ^{
    __block WeakUniqueCollection<TestObject *> *collection;
    
    beforeAll(^{
        collection = [[WeakUniqueCollection alloc] init];
    });
    
    it(@"on adding", ^{
        TestObject *object = [[TestObject alloc] initWithName:@"Bob"];
        [collection addObject:object];
        [collection addObject:object];
        expect(collection).to.haveCountOf(1);
    });
    
});

SpecEnd
