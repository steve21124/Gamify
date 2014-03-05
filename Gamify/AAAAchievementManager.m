//
//  AAAAchievementManager.m
//  Gamify
//
//  Created by Håkon Bogen on 04.03.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAAchievementManager.h"

@implementation AAAAchievementManager
+ (AAAAchievementManager *)sharedManager {
    static AAAAchievementManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[AAAAchievementManager alloc] init];
    });
    
    return _sharedManager;
}
@end
