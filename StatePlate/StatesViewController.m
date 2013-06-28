//
//  StatesViewController.m
//  StatePlate
//
//  Created by Barrett Clark on 6/27/13.
//  Copyright (c) 2013 Barrett Clark. All rights reserved.
//

#import "StatesViewController.h"

@interface StatesViewController ()
@end

@implementation StatesViewController
//@synthesize statesArray;
NSMutableArray *stateIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.tableView.dataSource = self;
  self.statesArray = [[NSMutableArray alloc] init];
  [self.statesArray addObject:@"ALABAMA"];
  [self.statesArray addObject:@"ALASKA"];
  [self.statesArray addObject:@"ARIZONA"];
  [self.statesArray addObject:@"ARKANSAS"];
  [self.statesArray addObject:@"CALIFORNIA"];
  [self.statesArray addObject:@"COLORADO"];
  [self.statesArray addObject:@"CONNECTICUT"];
  [self.statesArray addObject:@"DELAWARE"];
  [self.statesArray addObject:@"DISTRICT OF COLUMBIA"];
  [self.statesArray addObject:@"FLORIDA"];
  [self.statesArray addObject:@"GEORGIA"];
  [self.statesArray addObject:@"HAWAII"];
  [self.statesArray addObject:@"IDAHO"];
  [self.statesArray addObject:@"ILLINOIS"];
  [self.statesArray addObject:@"INDIANA"];
  [self.statesArray addObject:@"IOWA"];
  [self.statesArray addObject:@"KANSAS"];
  [self.statesArray addObject:@"KENTUCKY"];
  [self.statesArray addObject:@"LOUISIANA"];
  [self.statesArray addObject:@"MAINE"];
  [self.statesArray addObject:@"MARYLAND"];
  [self.statesArray addObject:@"MASSACHUSETTS"];
  [self.statesArray addObject:@"MICHIGAN"];
  [self.statesArray addObject:@"MINNESOTA"];
  [self.statesArray addObject:@"MISSISSIPPI"];
  [self.statesArray addObject:@"MISSOURI"];
  [self.statesArray addObject:@"MONTANA"];
  [self.statesArray addObject:@"NEBRASKA"];
  [self.statesArray addObject:@"NEVADA"];
  [self.statesArray addObject:@"NEW HAMPSHIRE"];
  [self.statesArray addObject:@"NEW JERSEY"];
  [self.statesArray addObject:@"NEW MEXICO"];
  [self.statesArray addObject:@"NEW YORK"];
  [self.statesArray addObject:@"NORTH CAROLINA"];
  [self.statesArray addObject:@"NORTH DAKOTA"];
  [self.statesArray addObject:@"OHIO"];
  [self.statesArray addObject:@"OKLAHOMA"];
  [self.statesArray addObject:@"OREGON"];
  [self.statesArray addObject:@"PENNSYLVANIA"];
  [self.statesArray addObject:@"RHODE ISLAND"];
  [self.statesArray addObject:@"SOUTH CAROLINA"];
  [self.statesArray addObject:@"SOUTH DAKOTA"];
  [self.statesArray addObject:@"TENNESSEE"];
  [self.statesArray addObject:@"TEXAS"];
  [self.statesArray addObject:@"UTAH"];
  [self.statesArray addObject:@"VERMONT"];
  [self.statesArray addObject:@"VIRGINIA"];
  [self.statesArray addObject:@"WASHINGTON"];
  [self.statesArray addObject:@"WEST VIRGINIA "];
  [self.statesArray addObject:@"WISCONSIN"];
  [self.statesArray addObject:@"WYOMING"];
  
  stateIndex = [[NSMutableArray alloc] init];
  for (int i=0; i<[self.statesArray count]-1; i++) {
    char letter = [[self.statesArray objectAtIndex:i] characterAtIndex:0];
    NSString *uniChar = [NSString stringWithFormat:@"%c", letter];
    if (![stateIndex containsObject:uniChar]) {
      [stateIndex addObject:uniChar];
    }
  }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [stateIndex count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return [stateIndex objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
  return stateIndex;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSString *alphabet = [stateIndex objectAtIndex:section];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
  NSArray *states = [self.statesArray filteredArrayUsingPredicate:predicate];
  return [states count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"StateCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  NSString *alphabet = [stateIndex objectAtIndex:[indexPath section]];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
  NSArray *states = [self.statesArray filteredArrayUsingPredicate:predicate];
  if ([states count] > 0) {
    NSString *state = [states objectAtIndex:indexPath.row];
    [cell.textLabel setText:state];
  }
  return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

