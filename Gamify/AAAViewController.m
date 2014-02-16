//
//  AAAViewController.m
//  Gamify
//
//  Created by Håkon Bogen on 12.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAViewController.h"
#import "AAAGamificationManager.h"
@interface AAAViewController ()
- (IBAction)didTapSetScoreButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addScoreButton;
- (IBAction)didTapAddToScoreButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *addScoreTextField;
- (IBAction)didTapBluePenguinAchievementButton:(id)sender;
- (IBAction)didTapForestStarAchievementButton:(id)sender;

@end

@implementation AAAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    AAAAchievement *achievement = [[AAAAchievement alloc] initWithKey:@"" titleText:NSLocalizedString(@"Blue penguin", @"") descriptionText:NSLocalizedString(@"You got all penguin related questions correct.", @"") image:[UIImage imageNamed:@"penguin"]];
    [[AAAGamificationManager sharedManager] showAchievementViewControllerOnViewController:self withAchievement:achievement];
}

- (IBAction)didTapForestStarAchievementButton:(id)sender {
       AAAAchievement *achievement = [[AAAAchievement alloc] initWithKey:@"" titleText:NSLocalizedString(@"Forest star", @"") descriptionText:NSLocalizedString(@"5 forest questions correctly answered in a row!", @"") image:[UIImage imageNamed:@"forest"]];
    [[AAAGamificationManager sharedManager] showAchievementViewControllerOnViewController:self withAchievement:achievement];
}
@end
