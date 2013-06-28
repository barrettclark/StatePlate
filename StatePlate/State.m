//
//  State.m
//  StatePlate
//
//  Created by Barrett Clark on 6/28/13.
//  Copyright (c) 2013 Barrett Clark. All rights reserved.
//

#import "State.h"

@implementation State

NSMutableArray *stateIndex;

+ (NSArray *)stateFactory:(NSArray *)states {
  stateIndex = [[NSMutableArray alloc] init];

  NSMutableArray *stateList;
  stateList = [[NSMutableArray alloc] init];
  for (NSString* stateName in states) {
    State *state = [[State alloc] initWithName:stateName];
    [stateList addObject:state];
    NSString *uniChar = [NSString stringWithFormat:@"%c", state.initial];
    if (![stateIndex containsObject:uniChar]) {
      [stateIndex addObject:uniChar];
    }
  }

  return stateList;
}

- (id)initWithName: (NSString *)name {
  self = [super init];
  if (self) {
    _name = name;
    _initial = [name characterAtIndex:0];
    _found = FALSE;
//    NSLog(@"%c", _initial);
    return self;
  }
  return nil;
}

@end
