//
//  UniquenessSpec.m
//  WeakUniqueCollection
//
//  Created by Artem Gladkov on 29.06.16.
//  Copyright © 2016 Artyom Gladkov. All rights reserved.
//
#import <WeakUniqueCollection/WeakUniqueCollection-umbrella.h>

SpecBegin(Uniqueness)

xdescribe(@"Maintaining uniqueness", ^{
    __block WeakUniqueCollection<NSNumber *> *collection;
    __block NSNumber *object;
    beforeAll(^{
        collection = [[WeakUniqueCollection alloc] init];
        object = @(5);
    });
    
    describe(@"on adding", ^{
        beforeAll(^{
            [collection addObject:object];
        });
        it(@"using addObject:", ^{
            [collection addObject:object];
            expect(collection).to.contain(object);
        });
    
    });

    
});

SpecEnd
