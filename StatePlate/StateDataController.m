//
//  StateDataController.m
//  StatePlate
//
//  Created by Barrett Clark on 6/28/13.
//  Copyright (c) 2013 Barrett Clark. All rights reserved.
//

#import "StateDataController.h"
#import "State.h"

@interface StateDataController()
- (void)initializeDefaultDataList;
@end

@implementation StateDataController

- (id)init {
  if (self = [super init]) {
    [self initializeDefaultDataList];
    return self;
  }
  return nil;
}

- (void)initializeDefaultDataList {
  NSArray *stateNames = [NSArray arrayWithObjects:
                @"Alabama",
                @"Alaska",
                @"Arizona",
                @"Arkansas",
                @"California",
                @"Colorado",
                @"Connecticut",
                @"Delaware",
                @"District Of Columbia",
                @"Florida",
                @"Georgia",
                @"Hawaii",
                @"Idaho",
                @"Illinois",
                @"Indiana",
                @"Iowa",
                @"Kansas",
                @"Kentucky",
                @"Louisiana",
                @"Maine",
                @"Maryland",
                @"Massachusetts",
                @"Michigan",
                @"Minnesota",
                @"Mississippi",
                @"Missouri",
                @"Montana",
                @"Nebraska",
                @"Nevada",
                @"New Hampshire",
                @"New Jersey",
                @"New Mexico",
                @"New York",
                @"North Carolina",
                @"North Dakota",
                @"Ohio",
                @"Oklahoma",
                @"Oregon",
                @"Pennsylvania",
                @"Rhode Island",
                @"South Carolina",
                @"South Dakota",
                @"Tennessee",
                @"Texas",
                @"Utah",
                @"Vermont",
                @"Virginia",
                @"Washington",
                @"West Virginia ",
                @"Wisconsin",
                @"Wyoming",
                nil
                ];
//  self.masterStateList = [State stateFactory:stateNames];
  self.masterStateDictionary = [[NSMutableDictionary alloc] initWithObjects:[State stateFactory:stateNames] forKeys:stateNames];
  NSMutableArray *idx = [[NSMutableArray alloc] init];

  NSEnumerator *enumerator = [_masterStateDictionary objectEnumerator];
  id value;
  while ((value = [enumerator nextObject])) {
    State *state = value;
    NSString *uniChar = [NSString stringWithFormat:@"%c", state.initial];
    if (![idx containsObject:uniChar]) {
      [idx addObject:uniChar];
    }
  }
  self.masterStateIndex = [idx sortedArrayUsingSelector: @selector (compare:)];
}

- (NSUInteger)countOfList {
  return [self.masterStateDictionary count];
}

//- (NSInteger)countOfLetter:(NSString *)theLetter {
//  int n = 0;
//  NSString *initial;
//  for (State* state in self.masterStateList) {
//    initial = [NSString stringWithFormat:@"%c", state.initial];
//    if ([initial isEqualToString:theLetter]) {
//      n += 1;
//    }
//  }
//  return n;
//}

- (NSMutableArray *)statesForSection:(NSString *)theLetter {
  NSMutableArray *list;
  list = [[NSMutableArray alloc] init];
  NSString *initial;
  NSEnumerator *enumerator = [_masterStateDictionary objectEnumerator];
  id value;
  while ((value = [enumerator nextObject])) {
    State *state = value;
    initial = [NSString stringWithFormat:@"%c", state.initial];
    if ([initial isEqualToString:theLetter]) {
      [list addObject:state.name];
    }
  }
  return list;
}

- (State *)objectInListAtIndex:(NSUInteger)theIndex {
  NSArray *sortedKeys = [_masterStateDictionary keysSortedByValueUsingSelector:@selector(compare:)];
  return [sortedKeys objectAtIndex:theIndex];
}

- (void)addStateWithState:(State *)state {
  [self.masterStateDictionary setObject:state forKey:state.name];
}

@end
