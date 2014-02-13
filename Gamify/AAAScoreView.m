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
@property (nonatomic,strong) NSLayoutConstraint *scoreChangeYConstraint;
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
        [self.scoreLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:55]];
        [self.scoreChangeLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:35]];
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
    [self.scoreChangeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    

    
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
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scoreChangeLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    NSLayoutConstraint *yPositionConstraint = [NSLayoutConstraint constraintWithItem:self.scoreChangeLabel
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier:1.0
                                                                            constant:1.0];
    [self addConstraint:yPositionConstraint];
    
    self.scoreChangeYConstraint = yPositionConstraint;
    self.scoreLabel.text = @"0";
}

- (void)setScoreLabelColor:(UIColor *)color
{
    self.scoreLabel.textColor = color;
}

- (void)setScoreTo:(NSInteger)score scoreChange:(NSInteger)change
{
    if (self.incrementingTimer) {
        [self.incrementingTimer invalidate];
        self.incrementingTimer = nil;
    }
    // add animation for the change of score
    [self animateScoreChangeLabel];
    double delayInSeconds = 0.1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
           NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.043 target:self selector:@selector(increment:) userInfo:@{kScoreLabelKey:self.scoreLabel, kScoreToSetKey : [NSNumber numberWithInt:score]} repeats:YES];
    [timer fire];
    self.incrementingTimer = timer;
        if (change > 0) {
            self.scoreChangeLabel.text = [NSString stringWithFormat:@"+%d",change];
            
        }else {
            self.scoreChangeLabel.text = [NSString stringWithFormat:@"%d",change];
            
        }
    });
}

- (void)animateScoreChangeLabel
{

    [self removeConstraints:self.scoreChangeLabel.constraints];
    self.scoreChangeLabel.alpha = 0;
    __block NSLayoutConstraint *newYpositionConstraint;
    [UIView animateWithDuration:0.8 animations:^{
        self.scoreChangeLabel.alpha = 1;
        [self  removeConstraint:self.scoreChangeYConstraint];
    
       newYpositionConstraint = [NSLayoutConstraint constraintWithItem:self.scoreChangeLabel
                                                                                  attribute:NSLayoutAttributeTop
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self
                                                                                  attribute:NSLayoutAttributeTop
                                                                                 multiplier:1.0
                                                                                   constant:-30.0];
        
        [self addConstraint:newYpositionConstraint];
        [self layoutSubviews];
        
    } completion:^(BOOL finished) {

    [UIView animateWithDuration:0.3 animations:^{
        
        self.scoreChangeLabel.alpha = 0;

    } completion:^(BOOL finished) {
        [self removeConstraint:newYpositionConstraint];
        [self addConstraint:self.scoreChangeYConstraint];
    } ];
    }];
    
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
