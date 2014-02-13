//
//  AAAScoreView.h
//  Gamify
//
//  Created by Håkon Bogen on 12.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAAScoreView : UIView

@property (nonatomic,strong) UILabel *scoreLabel;
@property (nonatomic,strong) UILabel *scoreChangeLabel;

- (void)show;
- (void)hide;
- (void)setScoreLabelColor:(UIColor*)color;

- (void)setScoreTo:(NSInteger) score scoreChange:(NSInteger) change;

@end
