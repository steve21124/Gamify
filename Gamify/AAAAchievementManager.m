//
//  AAAAchievementManager.m
//  Gamify
//
//  Created by Håkon Bogen on 04.03.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAAchievementManager.h"
#import "AAAAchievmentViewController.h"

@implementation AAAAchievementManager
+ (AAAAchievementManager *)sharedManager {
    static AAAAchievementManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedManager = [[AAAAchievementManager alloc] init];
    });
    return _sharedManager;
}

- (void)showAchievementViewControllerOnViewController:(UIViewController*)viewController withAchievement:(AAAAchievement*)achievement
{
    AAAAchievmentViewController *achievementViewController = [[AAAAchievmentViewController alloc] init];
    achievementViewController.achievement = achievement;
    [viewController presentViewController:achievementViewController animated:YES completion:^{
        
    }];
}

@end
