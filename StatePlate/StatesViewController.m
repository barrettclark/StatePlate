//
//  StatesViewController.m
//  StatePlate
//
//  Created by Barrett Clark on 6/27/13.
//  Copyright (c) 2013 Barrett Clark. All rights reserved.
//

#import "StatesAppDelegate.h"
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

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
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
  return [[self.dataController statesForSection:letter] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StateCell"];
  cell.accessoryType = UITableViewCellAccessoryNone;

  NSString *letter = [self.dataController.masterStateIndex objectAtIndex:[indexPath section]];
  NSArray *states = [self.dataController statesForSection:letter];
  if ([states count] > 0) {
    State *state = [self.dataController.masterStateDictionary objectForKey:[states objectAtIndex:indexPath.row]];
    [cell.textLabel setText:state.name];
    if (state.found || [self stateExists:state.name]) {
      cell.accessoryType = UITableViewCellAccessoryCheckmark;
      [cell setSelected:YES animated:YES];
    }
  }
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  State *state = [self.dataController.masterStateDictionary objectForKey:cell.textLabel.text];
  NSLog(state.name);
  if (state.found || [self stateExists:state.name]) {
    cell.accessoryType = UITableViewCellAccessoryNone;
    state.found = false;
    [self deleteManagedObject:state.name];
  } else {
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    state.found = true;
    [self insertNewManagedObject:state.name];
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)insertNewManagedObject:(NSString *)stateName {
  // Create a new instance of the entity managed by the fetched results controller.
  StatesAppDelegate *appDelegate = (StatesAppDelegate *)[[UIApplication sharedApplication]delegate];
  NSManagedObjectContext *context = [appDelegate managedObjectContext];

  NSManagedObject *model = [NSEntityDescription insertNewObjectForEntityForName:@"Found" inManagedObjectContext:context];
  [model setValue:stateName forKey:@"stateName"];

  // Save the context.
  NSError *error = nil;
  if (![context save:&error]) {
    NSLog(@"Error creating object");
    abort();
  }
}

- (void)deleteManagedObject:(NSString *)stateName {
  StatesAppDelegate *appDelegate = (StatesAppDelegate *)[[UIApplication sharedApplication]delegate];
  NSManagedObjectContext *context = [appDelegate managedObjectContext];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Found" inManagedObjectContext:context];
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  [fetchRequest setEntity:entity];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"stateName == %@", stateName];
  [fetchRequest setPredicate:predicate];
  
  NSError *error = nil;
  NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
  for (NSManagedObject *found in fetchedObjects) {
    [context deleteObject:found];
  }

  // Save the context.
  if (![context save:&error]) {
    NSLog(@"Error creating object");
    abort();
  }
}

- (BOOL)stateExists:(NSString *)stateName {
  StatesAppDelegate *appDelegate = (StatesAppDelegate *)[[UIApplication sharedApplication]delegate];
  NSManagedObjectContext *context = [appDelegate managedObjectContext];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Found" inManagedObjectContext:context];
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  [fetchRequest setEntity:entity];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"stateName == %@", stateName];
  [fetchRequest setPredicate:predicate];
  
  NSError *error = nil;
  NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
  if ([fetchedObjects count] > 0) {
    return true;
  } else {
    return false;
  }
}

@end
