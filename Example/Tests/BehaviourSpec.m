//
//  BehaviourSpec.m
//  WeakUniqueCollection
//
//  Created by Artem Gladkov on 03.07.16.
//  Copyright © 2016 Artyom Gladkov. All rights reserved.
//

#import <WeakUniqueCollection/WeakUniqueCollection-umbrella.h>
#import "TestObject.h"

SpecBegin(Behaviour)

describe(@"Collection", ^{
    WeakUniqueCollection<TestObject *> * __block collection;
    
    beforeEach(^{
        collection = [[WeakUniqueCollection alloc] init];
    });

    it(@"zeroing references to the object", ^{
        TestObject *object = [[TestObject alloc] initWithName:@"Object"];
        [collection addObject:object];
        object = nil;
        expect(collection).to.haveCountOf(0);
    });
    
    it(@"returns all objects after zeroing references",^{
        TestObject *object = [[TestObject alloc] initWithName:@"Ojbect"];
        [collection addObject:object];
        object = nil;
        NSArray *allObjects = [collection allObjects];
        expect(allObjects).to.haveCountOf(0);
    });
    
    it(@"adds new object", ^{
        TestObject *obj = [[TestObject alloc] initWithName:@"Object"];
        [collection addObject:obj];
        id firstObject = collection.anyObject;
        expect(firstObject).to.beIdenticalTo(obj);
    });
    
    it(@"is not adding duplicates", ^{
        TestObject *obj = [[TestObject alloc] initWithName:@"Object"];
        [collection addObject:obj];
        NSUInteger count1 = collection.count;
        [collection addObject:obj];
        expect(collection).to.haveCountOf(count1);
    });
    
    it (@"returns objects", ^{
        TestObject *obj0 = [[TestObject alloc] initWithName:@"Object1"];
        [collection addObject:obj0];
        TestObject *obj1 = [[TestObject alloc] initWithName:@"Object2"];
        [collection addObject:obj1];
        TestObject *obj2 = [[TestObject alloc] initWithName:@"Object3"];
        [collection addObject:obj2];
        NSArray *returnedObjects = collection.allObjects;
        expect(returnedObjects).to.contain(obj0);
        expect(returnedObjects).to.contain(obj1);
        expect(returnedObjects).to.contain(obj2);
    });
    
    it(@"removes object", ^{
        TestObject *obj = [[TestObject alloc] initWithName:@"Anyone"];
        [collection addObject:obj];
        id anyObject = collection.anyObject;
        expect(anyObject).to.beIdenticalTo(obj);
        [collection removeObject:obj];
        expect(collection).to.haveCountOf(0);
    });
    
    it (@"removes all objects", ^{
        NSUInteger count = 5;
        NSMutableArray *testObjects = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < count; i++) {
            NSString *name = [NSString stringWithFormat:@"Object %ld", (long)i];
            TestObject *obj = [[TestObject alloc] initWithName:name];
            [testObjects addObject:obj];
            [collection addObject:obj];
        }
        expect(collection).to.haveCountOf(5);
        [collection removeAllObjects];
        expect(collection).to.haveCountOf(0);
    });
});

SpecEnd


