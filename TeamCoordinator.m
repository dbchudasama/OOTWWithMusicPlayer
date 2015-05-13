//
//  TeamCoordinator.m
//  Out of the World 1
//
//  Created by Divyesh B Chudasama on 12/02/2015.
//  Copyright (c) 2015 DivyeshBC. All rights reserved.
//

#import "TeamCoordinator.h"

@implementation TeamCoordinator

@synthesize Team, TCName;

#pragma mark - Class method
-(id)initWithTeamCoordinatorTeam: (NSString *)tTeam andName:(NSString *)tName
{
    self = [super init];
    if (self)
    {
        Team = tTeam;
        TCName = tName;
        
    }
    
    return self;
    
}


@end
