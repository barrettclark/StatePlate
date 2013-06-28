//
//  StatesViewController.m
//  StatePlate
//
//  Created by Barrett Clark on 6/27/13.
//  Copyright (c) 2013 Barrett Clark. All rights reserved.
//

#import "StatesViewController.h"
#import "State.h"

@interface StatesViewController ()
@end

@implementation StatesViewController

NSArray *statesArray;
NSArray *stateNames;
NSMutableArray *stateIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.tableView.dataSource = self;
  stateNames = [NSArray arrayWithObjects:
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
  statesArray = [State stateFactory:stateNames];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [stateIndex count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
  return stateIndex;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return [stateIndex objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSString *alphabet = [stateIndex objectAtIndex:section];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
//  NSArray *states = [self.statesArray filteredArrayUsingPredicate:predicate];
  NSArray *states = [stateNames filteredArrayUsingPredicate:predicate];
  return [states count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"StateCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  NSString *alphabet = [stateIndex objectAtIndex:[indexPath section]];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
//  NSArray *states = [self.statesArray filteredArrayUsingPredicate:predicate];
  NSArray *states = [stateNames filteredArrayUsingPredicate:predicate];
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

