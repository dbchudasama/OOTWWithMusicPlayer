//
//  OWSpaceImageViewController.h
//  Out of the World
//
//  Created by DivyeshBC on 01/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

@interface OWSpaceImageViewController : UIViewController <UIScrollViewDelegate>//This will tell the OWSpaceImageViewController to adopt the protocol and give access to all the UIScrollViewDelegate methods predefined by apple for the delegate. Once the methods ar called we can then add our own funtionality

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//Make a property of type UIView because it is a fundamental part of the View Controller
@property (strong, nonatomic) UIImageView *imageView;

//Creating a property of the spaceObject to be able to access the information inside the view controller it is being passed 
@property (strong, nonatomic) OWSpaceObject *spaceObject;

//- (IBAction)SavePhotoOnClick:(id)sender;

@end
