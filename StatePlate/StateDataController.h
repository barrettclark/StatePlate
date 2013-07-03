//
//  StateDataController.h
//  StatePlate
//
//  Created by Barrett Clark on 6/28/13.
//  Copyright (c) 2013 Barrett Clark. All rights reserved.
//

#import <Foundation/Foundation.h>

@class State;

@interface StateDataController : NSObject

@property (nonatomic, copy) NSMutableDictionary *masterStateDictionary;
@property (nonatomic, copy) NSMutableArray *masterStateIndex;

- (NSUInteger)countOfList;
//- (NSUInteger)countOfLetter:(NSString *)theLetter;
- (NSMutableArray *)statesForSection:(NSString *)theLetter;
- (State *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addStateWithState:(State *)state;

@end
