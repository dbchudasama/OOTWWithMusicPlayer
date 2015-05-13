//
//  OWSpaceImageViewController.m
//  Out of the World
//
//  Created by DivyeshBC on 01/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "OWSpaceImageViewController.h"

@interface OWSpaceImageViewController ()

@end

@implementation OWSpaceImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Initialising the view controller
    self.imageView = [[UIImageView alloc] initWithImage:self.spaceObject.spaceImage];
    
    //Setting the content size of the scrollView to be the content size of the imageView i.e. the image
    self.scrollView.contentSize = self.imageView.frame.size;
    
    //The imageView now needs to be set up on the top of the scrollView. This will allow me to create a subview of the scrollView
    [self.scrollView addSubview:self.imageView];
    
    //Setting the view controller as the UIScrollView delegate hence upon pinching the viewForZoomingInScrolView method can be called
    self.scrollView.delegate = self;
    
    //Declaring maximum zoom scale
    self.scrollView.maximumZoomScale = 2.0;
    
    //Declaring minimum zoom scale
    self.scrollView.minimumZoomScale = 0.5;
    
    //Fitting content to size of screen
    _scrollView.contentMode = UIViewContentModeScaleAspectFit;
//    
//    //Will auto rotate if screen is turned
//    _scrollView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
}

////Controls the rotation from portrait to landscape so that the document turns accordingly to the direction of the screen
//-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//{
//    if (fromInterfaceOrientation == UIInterfaceOrientationPortrait){
//        [_imageView stringByEvaluatingJavaScriptFromString:@"rotate(0)"];
//    }
//    
//    else {
//        [_webView stringByEvaluatingJavaScriptFromString:@"rotate(1)"];
//    }
//}

//This method will make sure the document takes up the full screen in both orientations
- (void)willAnimateRotationToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.scrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView; //This method requires a return type of UIView so just returning the imageVIew for the image. This will enable zoom in and out of the image in scroll view
}
/*
- (IBAction)SavePhotoOnClick:(id)sender{
    UIImageWriteToSavedPhotosAlbum(self.spaceObject.spaceImage, nil, nil, nil);
}
*/

@end
