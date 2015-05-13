//
//  TeamCoordinator.h
//  Out of the World 1
//
//  Created by Divyesh B Chudasama on 12/02/2015.
//  Copyright (c) 2015 DivyeshBC. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface TeamCoordinator : NSObject

@property (strong, nonatomic) NSString *Team;
@property (strong, nonatomic) NSString *TCName;

#pragma mark - Class method
-(id)initWithTeamCoordinatorTeam: (NSString *)tTeam andName: (NSString *)tName;

@end
