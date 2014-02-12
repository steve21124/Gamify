//
//  AAAScoreView.m
//  Gamify
//
//  Created by Håkon Bogen on 12.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAScoreView.h"
#import "AAAGamificationManager.h"
@implementation AAAScoreView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scoreLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.scoreChangeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [AAAGamificationManager sharedManager].scoreView = self;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.scoreLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.scoreChangeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        
        [self.scoreLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:45]];
        [self.scoreLabel setTextColor:[UIColor blueColor]];
    }
    
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [AAAGamificationManager sharedManager].scoreView = self;
    
    if (self.scoreLabel.superview == nil) {
        [self addSubview: self.scoreLabel];
    }
    
    if (self.scoreChangeLabel.superview == nil) {
        [self addSubview: self.scoreChangeLabel];
    }
    
    [self.scoreLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scoreLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scoreLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    self.scoreLabel.text = @"30";
}

- (void)setup
{
    
}

- (void)show
{
    
}

@end
