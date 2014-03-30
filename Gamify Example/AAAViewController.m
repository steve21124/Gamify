//
//  AAAViewController.m
//  Gamify
//
//  Created by Håkon Bogen on 12.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAViewController.h"
#import "AAAAchievementDataSource.h"
#import "AAAAchievementManager.h"
#import "AAAGamificationManager.h"
@interface AAAViewController ()
- (IBAction)didTapSetScoreButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addScoreButton;
- (IBAction)didTapAddToScoreButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *addScoreTextField;
- (IBAction)didTapBluePenguinAchievementButton:(id)sender;
- (IBAction)didTapForestStarAchievementButton:(id)sender;
@property (weak, nonatomic) IBOutlet AAAScoreView *scoreView;

@end

@implementation AAAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [AAAAchievementManager sharedManager].dataSource = [[AAAAchievementDataSource alloc] init];
    [[AAAGamificationManager sharedManager] setScoreView:self.scoreView];
}

- (IBAction)didTapSetScoreButton:(id)sender {
    NSInteger scoreToSet = self.addScoreTextField.text.integerValue;
    [[AAAGamificationManager sharedManager] setMainPlayersScore:scoreToSet];
    [self.addScoreTextField resignFirstResponder];
    
}

- (IBAction)didTapAddToScoreButton:(id)sender {
    NSInteger scoreToSet = self.addScoreTextField.text.integerValue;
    [[AAAGamificationManager sharedManager] addToMainPlayerScore:scoreToSet];
    [self.addScoreTextField resignFirstResponder];
}

- (IBAction)didTapBluePenguinAchievementButton:(id)sender {
    [[AAAAchievementManager sharedManager] showAchievementViewControllerOnViewController:self achievementKey:kPenguinAchievementKey];
}

- (IBAction)didTapForestStarAchievementButton:(id)sender {
    [[AAAAchievementManager sharedManager] showAchievementViewControllerOnViewController:self achievementKey:kForestStarAchievementKey];
}

@end
