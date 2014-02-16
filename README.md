Gamify
======

The simplest way of adding gamification to your app!

##Features:
- Stores the players score and can show it anywhere in the app
- Animated adding and subracting to the score
- Easy to set up achievements which can be triggered whenever you want


![shows how its done](https://github.com/haaakon/Gamify/blob/master/v0.0.2.gif?raw=true)
##Example code

### Add to score
Without knowing what score is, just add to existing score
```
    NSInteger pointsToAdd = self.addScoreTextField.text.integerValue;
    [[AAAGamificationManager sharedManager] addToMainPlayerScore:pointsToAdd];
```

###Set score
Sets the score to the given NSInteger, will calculate the change and animate it floating over the scoreview
```objective-c
NSInteger scoreToSet = self.addScoreTextField.text.integerValue;
[[AAAGamificationManager sharedManager] setMainPlayersScore:scoreToSet];
```

### Trigger achievement viewer
```
AAAAchievement *achievement = [[AAAAchievement alloc] initWithKey:@"" titleText:NSLocalizedString(@"Blue penguin", @"") descriptionText:NSLocalizedString(@"You got all penguin related questions correct.", @"") image:[UIImage imageNamed:@"forest"]];
[[AAAGamificationManager sharedManager] showAchievementViewControllerOnViewController:self withAchievement:achievement];

```
##Upcoming
- Better API
- List of achievements gotten




## License
MIT
