//
//  PeopleTheme.h
//  People
//
//  Created by Bruno Koga on 10/15/13.
//  Copyright (c) 2013 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PeopleTheme.h"

@interface PeopleThemeManager : NSObject

+ (id<PeopleTheme>)theme;
+ (void)setTheme:(id<PeopleTheme>)theme;

@end
