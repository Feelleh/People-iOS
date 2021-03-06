//
//  PeopleProfileTeamView.m
//  People
//
//  Created by Bruno Koga on 10/20/13.
//  Copyright (c) 2013 CI&T. All rights reserved.
//

#import "PeopleProfileTeamView.h"
#import "PeopleThemeManager.h"
#import <QuartzCore/QuartzCore.h>

@interface PeopleProfileTeamView ()
@property (weak, nonatomic) IBOutlet UIView *teamMembersButtonsContainer;

@end

@implementation PeopleProfileTeamView

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)setup
{
    [self adjustFonts];
}

- (void)adjustFonts
{
    id<PeopleTheme> theme = [PeopleThemeManager theme];
    [self.teamLabel setFont:[theme regularFontWithSize:self.teamLabel.font.pointSize]];
    [self.viewAllButton.titleLabel setFont:[theme regularFontWithSize:self.viewAllButton.titleLabel.font.pointSize]];
    
}

- (void)setTeamMembers:(NSArray *)teamMembers
{
    _teamMembers = teamMembers;
    [self setTeamCount:teamMembers.count];
    if (teamMembers.count > [self maxCount])
    {
        [self.viewAllButton setHidden:NO];
    }
    [self createTeamMemberButtons];
}

- (void)setTeamCount:(NSInteger)count
{
    NSString *teamString = NSLocalizedString(@"Team", @"Team title on Profile Screen");
    teamString = [teamString stringByAppendingFormat:@" (%d)", count];
    [self.teamLabel setText:teamString];
}


static CGFloat const kPhotoButtonWidth = 44.0;
static CGFloat const kPhotoButtonSpacing = 15.0;


- (void)createTeamMemberButtons
{
    for (UIButton *button in [self.teamMembersButtonsContainer subviews])
    {
        [button removeFromSuperview];
    }
    
    CGFloat offset = 0;
    
    for (NSInteger i = 0; i < [self maxCount]; i++) {
        UIButton *button = [[UIButton alloc] init];
        [button setFrame:CGRectMake(offset,
                                    0,
                                    kPhotoButtonWidth, kPhotoButtonWidth)];
        button.layer.cornerRadius = button.frame.size.height/2;
        [button setClipsToBounds:YES];
        [button addTarget:self
                   action:@selector(buttonTouched:)
         forControlEvents:UIControlEventTouchUpInside];
        
        [self.teamMembersButtonsContainer addSubview:button];
        offset += kPhotoButtonWidth + kPhotoButtonSpacing;
    }
}

- (void)setTeamMemberPicture:(UIImage *)image forIndex:(NSInteger)index
{
    [(UIButton *)self.teamMembersButtonsContainer.subviews[index] setImage:image
                                                                  forState:UIControlStateNormal];
}

- (NSInteger)maxCount
{
    NSInteger returnValue = [self.teamMembers count];
    if (returnValue > 5)
    {
        returnValue = 5;
    }
    return returnValue;
}

- (void)buttonTouched:(id)sender
{
    NSUInteger index = [self.teamMembersButtonsContainer.subviews indexOfObject:sender];
    [self.delegate openProfileForUser:self.teamMembers[index]];
}


@end
