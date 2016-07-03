//
//  WeakUniqueCollection.m
//  book-shelf
//
//  Created by Artem Gladkov on 28.06.16.
//  Copyright © 2016 Sibext Ltd. All rights reserved.
//

#import "WeakUniqueCollection.h"

@interface WeakUniqueCollection ()

@property(nonatomic)dispatch_queue_t accessQueue;
@property NSPointerArray *objectPointers;

@end

@implementation WeakUniqueCollection

#pragma mark - Initialization

- (instancetype)init
{
    if (self = [super init]) {
        _accessQueue = dispatch_queue_create("WEAKUNIQUECOLLECTION_QUEUE", DISPATCH_QUEUE_CONCURRENT);
        _objectPointers = [NSPointerArray weakObjectsPointerArray];
    }
    return self;
}

#pragma mark - Public

- (void)addObject:(id)object
{
    dispatch_barrier_async(_accessQueue, ^{
        NSArray *allPointers = self.objectPointers.allObjects;
        if (![allPointers containsObject:object]) {
            [self.objectPointers addPointer:(__bridge void * _Nullable)(object)];
        }
    });
}

- (void)removeObject:(id)object
{
    dispatch_barrier_async(_accessQueue, ^{
        NSArray *allPointers = self.objectPointers.allObjects;
        NSUInteger index = [allPointers indexOfObjectIdenticalTo:object];
        if (index != NSNotFound) {
            [self.objectPointers removePointerAtIndex:index];
        }
    });
}

- (void)removeAllObjects
{
    dispatch_barrier_async(_accessQueue, ^{
        NSUInteger count = self.objectPointers.count;
        for (NSUInteger i = 0; i < count; i++) {
            [self.objectPointers removePointerAtIndex:0];
        }
    });
}

- (NSUInteger)count
{
    NSUInteger __block count = 0;
    dispatch_sync(_accessQueue, ^{
        count = self.objectPointers.count;
    });
    return count;
}

#pragma mark - Subscription

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    id __block obj;
    dispatch_sync(_accessQueue, ^{
        obj = [self.objectPointers pointerAtIndex:idx];
    });
    return obj;
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
    dispatch_barrier_async(_accessQueue, ^{
        NSArray *allPointers = self.objectPointers.allObjects;
        if (![allPointers containsObject:obj]) {
            [self.objectPointers insertPointer:(__bridge void * _Nullable)(obj) atIndex:idx];
        }
    });
}

@end
