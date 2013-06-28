//
//  State.h
//  StatePlate
//
//  Created by Barrett Clark on 6/28/13.
//  Copyright (c) 2013 Barrett Clark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface State : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign) char *initial;
@property (assign) BOOL *found;

+(NSArray *)stateFactory:(NSArray *)states;
-(id)initWithName:(NSString *)name;

@end
