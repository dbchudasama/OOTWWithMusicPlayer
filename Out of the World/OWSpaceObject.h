//
//  OWSpaceObject.h
//  Out of the World
//
//  Created by DivyeshBC on 01/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OWSpaceObject : NSObject

//Creating Designated Initialiser - This initialiser will take some Astronomical Data from the Astronomical Data class (AstronomicalData.h file) and an image and set the planet properties accordingly. The initialiser will take two arguments, an NSDictionary of Planet Data and a UIImage holding planet image.

//All the plant property information as shown below will be obtained from the AstronomicalData files
@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestFact;

//The images shall be added manually
@property (strong, nonatomic) UIImage *spaceImage;


//Defining designated initialiser
-(id)initWithData: (NSDictionary *)data andImage:(UIImage *)image;





@end
