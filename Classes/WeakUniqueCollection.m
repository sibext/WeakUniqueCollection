//
//  WeakUniqueCollection.m
//  book-shelf
//
//  Created by Artem Gladkov on 28.06.16.
//  Copyright © 2016 Sibext Ltd. All rights reserved.
//

#import "WeakUniqueCollection.h"

@interface WeakUniqueCollection ()

@property NSPointerArray *objectPointers;

@end

@implementation WeakUniqueCollection

#pragma mark - Initialization

- (instancetype)init
{
    if (self = [super init]) {
        _objectPointers = [NSPointerArray weakObjectsPointerArray];
    }
    return self;
}

#pragma mark - Public

- (BOOL)addObject:(id)object
{
    NSArray *allPointers = self.objectPointers.allObjects;
    if (![allPointers containsObject:object]) {
        [self.objectPointers addPointer:(__bridge void * _Nullable)(object)];
        return YES;
    }
    return NO;
}

- (void)removeObject:(id)object
{
    NSArray *allPointers = self.objectPointers.allObjects;
    NSUInteger index = [allPointers indexOfObjectIdenticalTo:object];
    if (index != NSNotFound) {
        [self.objectPointers removePointerAtIndex:index];
    }
}

- (void)removeAllObject
{
    NSUInteger count = self.objectPointers.count;
    for (NSUInteger i = 0; i < count; i++) {
        [self.objectPointers removePointerAtIndex:0];
    }
}

- (NSUInteger)count
{
    return self.objectPointers.count;
}

#pragma mark - Subscription

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return [self.objectPointers pointerAtIndex:idx];
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
    [self.objectPointers insertPointer:(__bridge void * _Nullable)(obj) atIndex:idx];
}

@end
