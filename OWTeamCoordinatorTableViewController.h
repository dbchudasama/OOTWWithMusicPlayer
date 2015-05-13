//
//  UITableViewController+OWTeamCoordinatorTableViewController.h
//  Out of the World 1
//
//  Created by Divyesh B Chudasama on 12/02/2015.
//  Copyright (c) 2015 DivyeshBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface OWTeamCoordinatorTableViewController : UITableViewController < MFMailComposeViewControllerDelegate >

- (IBAction)sendEmail:(id)sender;

@property (strong, nonatomic) NSMutableArray *jsonArray;
@property (strong, nonatomic) NSMutableArray *TCArray;


#pragma mark - Class Method
-(void)retrieveData;



@end
