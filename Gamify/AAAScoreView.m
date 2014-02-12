//
//  AAAScoreView.m
//  Gamify
//
//  Created by Håkon Bogen on 12.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAScoreView.h"
#import "AAAGamificationManager.h"

const NSString  *kScoreLabelKey = @"scoreLabelKey";
const NSString  *kScoreToSetKey = @"scoreToSetKey";
@interface AAAScoreView ()
@property (nonatomic,strong) NSTimer *incrementingTimer;
@end
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

- (void)setScoreTo:(NSInteger)score scoreChange:(NSInteger)change
{
    if (self.incrementingTimer) {
        [self.incrementingTimer invalidate];
        self.incrementingTimer = nil;
    }
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.045 target:self selector:@selector(increment:) userInfo:@{kScoreLabelKey:self.scoreLabel, kScoreToSetKey : [NSNumber numberWithInt:score]} repeats:YES];
    [timer fire];
    self.incrementingTimer = timer;
}

- (void)increment:(NSTimer *)timer {
    
    UILabel *label = (UILabel *)timer.userInfo[kScoreLabelKey];
    NSNumber *goalValue = timer.userInfo[kScoreToSetKey];
    
    NSInteger currentValue = label.text.integerValue;
    
    if (currentValue < [goalValue integerValue] ) {
        currentValue++;
    } else {
        currentValue--;
    }
    label.text = [NSString stringWithFormat:@"%d", currentValue];
    if(currentValue == [goalValue integerValue]){
        [timer invalidate];//stops calling this method
    }
   
}

- (void)setup
{
    
}

- (void)show
{
    
}

@end
