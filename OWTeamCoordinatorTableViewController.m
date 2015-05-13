//
//  UITableViewController+OWTeamCoordinatorTableViewController.m
//  Out of the World 1
//
//  Created by Divyesh B Chudasama on 12/02/2015.
//  Copyright (c) 2015 DivyeshBC. All rights reserved.
//

#import "OWTeamCoordinatorTableViewController.h"
#import "TeamCoordinator.h"

#define getURLData @"http://dbchudasama.webfactional.com/jsonscriptTeamCoordinators.php"

@interface OWTeamCoordinatorTableViewController ()

@end

@implementation OWTeamCoordinatorTableViewController

@synthesize jsonArray, TCArray;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Load data
    [self retrieveData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Setting row selection to no for entire table so user can't select an rows. READ ONLY!
    tableView.allowsSelection = NO;
    
    // Return the number of rows in the section.
    return [self.TCArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    // Configure the cell...
    TeamCoordinator *idObject;
    
    //Grab the current object in indexPath and set it to Team Coordinator object
    idObject = [TCArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = idObject.Team;
    cell.detailTextLabel.text = idObject.TCName;
    
    //Accessory
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


//Method to retrieve data from database
-(void)retrieveData
{
    //Passing in the URL of the database
    NSURL *url = [NSURL URLWithString:getURLData];
    
    //Creating object of the database data
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    //Set up the TC array
    TCArray = [[NSMutableArray alloc ] init];
    
    //Loop through the jsonArray
    for (int i=0; i < jsonArray.count; i++) {
        
        //Create the Team Coordinator object
        //NSString *eID = [[jsonArray objectAtIndex:i] objectForKey:@"id"];
        NSString *tTeam = [[jsonArray objectAtIndex:i] objectForKey:@"Team"];
        NSString *tName = [[jsonArray objectAtIndex:i] objectForKey:@"TCName"];
        //NSString *eTime = [[jsonArray objectAtIndex:i] objectForKey:@"eventTime"];
        //NSString *eLocation = [[jsonArray objectAtIndex:i] objectForKey:@"eventLocation"];
        
        //Now, add the Team Coordinator object to our TC array
        [TCArray addObject:[[TeamCoordinator alloc] initWithTeamCoordinatorTeam:tTeam andName:tName]];
    }
    
    //Reload the table data
    [self.tableView reloadData];
}

#pragma mark - IBAction methods

- (IBAction)sendEmail:(id)sender {
    
    //email subject
    //NSString *subject = @"";
    
    //email body
    //NSString *body = @"";
    
    //recipient
    //NSString *recipient = [NSArray arrayWithObjects:@"info@nhsf.org.uk", nil];
    
    //create the MFMailCompostieViewController
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    composer.mailComposeDelegate = self;
    [composer setSubject:@""];
    //[composer setMessageBody:body isHTML:NO];
    [composer setToRecipients:@[@"gujral_90_div@hotmail.com"]];
    
    

    //get the fielpath form resources
    //NSString *filePath = [[NSBundle mainBundle] pathForResource:@"logo" ofType:@"png"];
    
    //read the file using NSData
    //NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    //NSString *mimeType = @"image/png";
    
    //add attachment
    //[composer addAttachmentData:fileData mimeType:mimeType fileName:filePath];
    
    //present it on screen
    [self presentViewController:composer animated:YES completion:nil];
    
}


#pragma mark - MFMailComposeViewControllerDelegate method

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    //close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end