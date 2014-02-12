//
//  AAAGamificationManager.m
//  Gamify
//
//  Created by Håkon Bogen on 12.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAGamificationManager.h"
@interface AAAGamificationManager ()
@end
@implementation AAAGamificationManager

+ (AAAGamificationManager *)sharedManager {
    static AAAGamificationManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[AAAGamificationManager alloc] init];
    });
    
    return _sharedManager;
}

- (void)addToMainPlayersScore:(NSInteger)score
{
    
}

@end
