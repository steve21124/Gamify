//
//  AAAAchievmentViewController.m
//  Gamify
//
//  Created by Håkon Bogen on 13.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAAchievmentViewController.h"

@interface AAAAchievmentViewController ()

@end

@implementation AAAAchievmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self performSelector:@selector(closeViewController) withObject:nil afterDelay:1];
	// Do any additional setup after loading the view.
}

- (void)closeViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
