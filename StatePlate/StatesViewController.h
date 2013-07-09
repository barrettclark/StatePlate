//
//  StatesViewController.h
//  StatePlate
//
//  Created by Barrett Clark on 6/27/13.
//  Copyright (c) 2013 Barrett Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Found.h"

@class StateDataController;

@interface StatesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *resetButton;
@property (strong, nonatomic) StateDataController *dataController;
@property (strong, nonatomic) NSArray *labelArray;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


- (void)insertNewManagedObject:(NSString *)stateName;
- (void)deleteManagedObject:(NSString *)stateName;

@end
