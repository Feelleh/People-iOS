//
//  PeopleTeamViewAllViewController.h
//  People
//
//  Created by Bruno Koga on 11/1/13.
//  Copyright (c) 2013 CI&T. All rights reserved.
//

#import "PeopleBaseViewController.h"
#import "PeopleOpenProfileProtocol.h"

@interface PeopleTeamViewAllViewController : PeopleBaseViewController
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong) NSArray *teamMembers;
@property (weak) id<PeopleOpenProfileProtocol>delegate;

@end
