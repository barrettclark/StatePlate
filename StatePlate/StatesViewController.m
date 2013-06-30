//
//  StatesViewController.m
//  StatePlate
//
//  Created by Barrett Clark on 6/27/13.
//  Copyright (c) 2013 Barrett Clark. All rights reserved.
//

#import "StatesViewController.h"
#import "StateDataController.h"
#import "State.h"

@interface StatesViewController ()
@end

@implementation StatesViewController

- (void)awakeFromNib {
  [super awakeFromNib];
  self.dataController = [[StateDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [self.dataController.masterStateIndex count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
  return self.dataController.masterStateIndex;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return [self.dataController.masterStateIndex objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSString *letter = [self.dataController.masterStateIndex objectAtIndex:section];
//  return [self.dataController countOfLetter:letter];
  return [[self.dataController statesForSection:letter] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"StateCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  NSString *letter = [self.dataController.masterStateIndex objectAtIndex:[indexPath section]];
  NSArray *states = [self.dataController statesForSection:letter];
  if ([states count] > 0) {
    NSString *state = [states objectAtIndex:indexPath.row];
    [cell.textLabel setText:state];
  }
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *letter = [self.dataController.masterStateIndex objectAtIndex:[indexPath section]];
  NSArray *states = [self.dataController statesForSection:letter];
  State *state = [self.dataController.masterStateDictionary objectForKey:[states objectAtIndex:indexPath.row]];
  NSLog(state.name);

  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  if (!state.found) {
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    state.found = true;
  } else {
    cell.accessoryType = UITableViewCellAccessoryNone;
    state.found = false;
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

