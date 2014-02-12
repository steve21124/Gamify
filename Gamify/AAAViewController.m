//
//  AAAViewController.m
//  Gamify
//
//  Created by Håkon Bogen on 12.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAViewController.h"

@interface AAAViewController ()
- (IBAction)didTapAddScoreButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *addScoreTextField;

@end

@implementation AAAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapAddScoreButton:(id)sender {
    [self.addScoreTextField resignFirstResponder];
}
@end
