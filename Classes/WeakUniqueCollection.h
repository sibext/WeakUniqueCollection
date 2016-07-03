//
//  WeakUniqueCollection.h
//  book-shelf
//
//  Created by Artem Gladkov on 28.06.16.
//  Copyright © 2016 Sibext Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakUniqueCollection<ObjectType> : NSObject

@property(readonly)NSUInteger count;

- (void)addObject:(ObjectType)object;
- (void)removeObject:(ObjectType)object;
- (void)removeAllObjects;

- (ObjectType)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(ObjectType)obj atIndexedSubscript:(NSUInteger)idx;

@end
