//
//  OWOuterSpaceTableViewController.m
//  Out of the World
//
//  Created by DivyeshBC on 01/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "OWOuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "OWSpaceObject.h"
#import "OWSpaceImageViewController.h"
#import "OWSpaceDataViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface OWOuterSpaceTableViewController ()
{
    AVAudioPlayer *_audioPlayer;
}
@end

@implementation OWOuterSpaceTableViewController

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
    
    self.planets = [[NSMutableArray alloc] init];
    
    //This step should be done AFTER custom/designated intialiser has been set in Object.h and Object.m files. Adding OBJECTS to the array instead NSStrings.
    
    //Firstly creating a for loop so that we can iterate through all of the planets and creat OWSpaceObjects from our data and then add that to our planets array.
    
    //Using fast enumeration. New dictionary will iterate through already created dictionary of information
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        //Each time it iterates it will create a variable *imageName of type NSString with a Key of type [Key_Name] and corresponding images following same naming convention. Make sure the image names are exactly the same as the planet names defined in the dictionary. Dynamically creating NSSTring *imageName
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        //Creates a new object of type objectType 'OWSpaceObject in this case' using our custom initialiser method and passing in NSMutableDictionary and also passing in an image UIImange will return an image BEFORE intitialiser takes place
        OWSpaceObject *planet = [[OWSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed: imageName]];
        //Fianlly adding object to the array so that the table view can be updates accordingly
        [self.planets addObject:planet];
        
    }
    
    //Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/Lighting Strike and Thunder Sound Effect.mp3", [[NSBundle mainBundle]resourcePath]];
    NSURL *soundURL = [NSURL fileURLWithPath:path];
    
    //Construct audio player object and initialise with URL to sound
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        //Checks to see if the sendeer is actually a UITableView Cell
        if ([sender isKindOfClass:[UITableViewCell class]])
        {
            //Checks destinationViewController based on it's class and if it is correct
            if([segue.destinationViewController isKindOfClass:[OWSpaceImageViewController class]])
            {
                //Allowing access to destinationViewController and it's properties just before segue occurs. The sender can then be used to find out what is being displayed on the UITableViewCell
                OWSpaceImageViewController *nextViewController = segue.destinationViewController;
                
                //Give me back the indexPath for my cell and we know this because we are setting our argument for the indexPathForCell as 'sender'. Automatic access is gained to the property .tableview as this file is a TableViewController
                NSIndexPath *path = [self.tableView indexPathForCell:sender];
                
                //Indexing into array of objects with argument as the sender index cell. Gives back the object and stores in the variable pointer selectedObject
                OWSpaceObject *selectedObject = [self.planets objectAtIndex:path.row];
                
                //Setting the property of the object for the next view controller as the image for that cell
                nextViewController.spaceObject = selectedObject;
            }
        }
    
        //Once again using introspection to check if the trigger has been caused by NSIndexPath. Index Path because that is the argument in the method accessoryButton....below
        if([sender isKindOfClass:[NSIndexPath class]])
        {
            //Remaining explanations are ditto to above
           if([segue.destinationViewController isKindOfClass:[OWSpaceDataViewController class]])
           {
            OWSpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            OWSpaceObject *selectedObject = self.planets[path.row];
            targetViewController.spaceObject = selectedObject;
           }
        }
}

    
//    NSString *planet1 = @"Mercury";
//    NSString *planet2 = @"Venus";
//    NSString *planet3 = @"Earth";
//    NSString *planet4 = @"Mars";
//    NSString *planet5 = @"Jupiter";
//    NSString *planet6 = @"Saturn";
//    NSString *planet7 = @"Uranus";
//    NSString *planet8 = @"Neptune";
//    
//    self.planets = [[NSMutableArray alloc] initWithObjects:planet1, planet2, planet3, planet4, planet5, planet6, planet7, planet8, nil];

//    //Setting up Dictionary
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    
//    //Setting up key value pairs
//    NSString *firstColor = @"red";
//    [myDictionary setObject:firstColor forKey:@"firetruck colour"];
//    [myDictionary setObject:@"blue" forKey:@"ocean colour"];
//    [myDictionary setObject:@"yellow" forKey:@"star colour"];
//    NSLog(@"%@", myDictionary);
//    
//    //Retrieving a key from the dictionary using it's value
//    NSString *blueString = [myDictionary objectForKey:@"ocean colour"];
//    NSLog(@"%@", blueString);
    
    //
    //NSNumber *myNumber = [NSNumber numberWithInt:5];
    //NSLog(@"%@", myNumber);
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//}

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

    // Return the number of rows in the section.
    return [self.planets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //Accessing the Objects in the planets array
    OWSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    //Updating cell so that the text label of the cell is the name of the object
    cell.textLabel.text = planet.name;
    //Updating the cell subtitle so that it is the nickname. BEFORE typing below line go to main storyboard, select the prtotype cell and under Attribute Inspector change 'Style' to 'Subtitle'
    cell.detailTextLabel.text = planet.nickname;
   
    //TableView Cells come with a default property called image and imageViews also have a property image, so set the image cell image property to the teh spaceImage property for array planets
    cell.imageView.image = planet.spaceImage;
  
    /*
    UIButton *playSound = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playSound.frame = CGRectMake(5.0f, 5.0f, 5.0f, 5.0f);
    [playSound setTitle:@"Play" forState:UIControlStateNormal];
    [cell addSubview:playSound];
    [playSound addTarget:self action:@selector(soundPlay:) forControlEvents:UIControlEventTouchUpInside];
    */
    
    return cell;
}

//-(IBAction)soundPlay:(id)sender{
    
  //  [_audioPlayer play];
//}



#pragma mark - UITableView Delegate
//
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to data view controller" sender:indexPath];
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


//#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


@end
