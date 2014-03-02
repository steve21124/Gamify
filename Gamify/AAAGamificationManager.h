//
//  AAAGamificationManager.h
//  Gamify
//
//  Created by Håkon Bogen on 12.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAAAChievement.h"
#import "AAAScoreView.h"
@interface AAAGamificationManager : NSObject

@property (nonatomic,weak) AAAScoreView *scoreView;

+ (AAAGamificationManager *)sharedManager;

- (void)initialSetScoreNoAnimation;
- (void)setMainPlayersScore:(NSInteger)score;
- (void)addToMainPlayerScore:(NSInteger)score;
- (NSInteger)mainPlayerScore;

- (void)showAchievementViewControllerOnViewController:(UIViewController*)viewController withAchievement:(AAAAchievement*)achievement;
/**
 *  Add achievement to the controller
 *
 *  @param achievement <#achievement description#>
 *  @param key         <#key description#>
 */
- (void)addAchievement:(AAAAchievement*) achievement forKey:(NSString*)key;

- (AAAAchievement*)achievementForKey:(NSString*)key;



@end
