//
//  OWSpaceDataViewController.h
//  Out of the World
//
//  Created by Divyesh B Chudasama on 05/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

@interface OWSpaceDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

//Creating a property for the spaceObject
@property (strong, nonatomic) OWSpaceObject *spaceObject;

@end
