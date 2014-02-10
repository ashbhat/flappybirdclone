//
//  ViewController.m
//  flutterBird
//
//  Created by Ash Bhat on 2/9/14.
//  Copyright (c) 2014 Ash Bhat. All rights reserved.
//

#import "ViewController.h"
#import "GameScreen.h"
@interface ViewController ()

@end

@implementation ViewController

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
- (IBAction)openNewGame:(id)sender {
    GameScreen *newGameScreen = [[GameScreen alloc]initWithNibName:@"GameScreen" bundle:nil];
    [self presentViewController:newGameScreen animated:YES completion:nil];
}

@end
