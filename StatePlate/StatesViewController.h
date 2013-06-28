//
//  StatesViewController.h
//  StatePlate
//
//  Created by Barrett Clark on 6/27/13.
//  Copyright (c) 2013 Barrett Clark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *statesArray;

@end
