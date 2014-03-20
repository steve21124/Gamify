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
- More ways of customizing ui
- Show List of achievements gotten
- Dont give out achievements double to a player
- 

##Theory
Adding gamification to your app is more than just adding a score screen and achievements, it has to be meaningful for the user. Here are some quick points which are key in making a good gamified experience. Games are fun, your gamification experience, also has to be, fun.
### Quick tips

#### Problem solving
Present problems to the user which get harder and harder as the game progresses. Example: 
#### Role playing
Let the user imagine being someone else, give them an avatar or similar. Example Wii mii, The Sims
#### Recognition
Recognize when the user has put some effort down. Example: Achievements, leveling up
#### Surprise
Suprise the user with something they did not expect. Example: Bonus levels, hidden objects
#### Triumphing
Let the user gravitate towards some goal and then triumph when they are victorious. Example: Boss fight, final level. 
#### Cooperation
If your app can let two players cooperate towards a goal. Example:
#### Collection
Your app lets the user collect objects or similar, example coins, gems, achievements. Show the collection as a whole to the user and let other users watch the impressive collection
#### Goof off (sandbox)
To extend gameplay, and let the user play around with the app just for fun. Example: Sandbox mode in games, free play 



## License
MIT
