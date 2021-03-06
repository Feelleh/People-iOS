//
//  PeopleProfileViewController.h
//  People
//
//  Created by Bruno Koga on 10/11/13.
//  Copyright (c) 2013 CI&T. All rights reserved.
//

#import "PeopleBaseViewController.h"
#import "PeopleCollaborator.h"
#import "PeopleOpenProfileProtocol.h"

@interface PeopleProfileViewController : PeopleBaseViewController <PeopleOpenProfileProtocol>

@property (nonatomic, retain) PeopleCollaborator *collaborator;

@end
