//
//  OWSpaceObject.m
//  Out of the World
//
//  Created by DivyeshBC on 01/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "OWSpaceObject.h"
#import "AstronomicalData.h" //Do not forget to import header file for DEFINED key terms

@implementation OWSpaceObject

-(id)init
{
    //The current object self is being passed into the NEW designated initialiser creatd in .h file, meaning the existing initialiser method is being overridden. Then return back self
    self = [self initWithData:nil andImage:nil];
    return self;
}

    //Implementing designated initialiser
-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    //Super refers to the superclass NSObject. Whats happening here is that we are telling the compiler to first do the initilaser with the code inside of the initialiser inside NSObject. This prepares our object correctly. Then we add additional code on top of this so we can have our own additional functionality, specifically when we initialise our OWSpaceObjects, we are able to have our initial properties set up so wwe can immediately start using the objects
    self = [super init];
    
    //Setting up the initialser so that when I create my object, I will use the data variable name of type NSDictionary, and my object will already have the properties required set up for me
    self.name = data[PLANET_NAME];
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH]floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH]floatValue];
    self.temperature = [data[PLANET_TEMPERATURE]floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    
    //Setting up initial image. Dictionary is not being used as the image being passed in is a seperate argument for the initialiser
    self.spaceImage = image;
    
    return self;
}
@end
