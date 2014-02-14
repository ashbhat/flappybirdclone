//
//  GameScreen.m
//  flutterBird
//
//  Created by Ash Bhat on 2/9/14.
//  Copyright (c) 2014 Ash Bhat. All rights reserved.
//

#import "GameScreen.h"

@interface GameScreen ()

@end

@implementation GameScreen

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
    score = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    [score setText:@"0"];
    [score setTextColor:[UIColor whiteColor]];
    [score setFont:[UIFont fontWithName:@"helvetica" size:40]];
    [score setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:score];
    flipperBird = [[UIImageView alloc]initWithFrame:CGRectMake(40, 100, 40, 40)];
    [flipperBird setBackgroundColor:[UIColor greenColor]];
    flipperBird.layer.cornerRadius = 20;
    flipperBird.layer.masksToBounds = YES;
    [flipperBird.layer setBorderColor:(__bridge CGColorRef)([UIColor blackColor])];
    [flipperBird.layer setBorderWidth:2];
    [self.view addSubview:flipperBird];
    
    top = [[UIImageView alloc]initWithFrame:CGRectMake(320, 0, 40, 200)];
    bottom = [[UIImageView alloc]initWithFrame:CGRectMake(320, 360, 40, 200)];
    [top setBackgroundColor:[UIColor blackColor]];
    [bottom setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:top];
    [self.view addSubview:bottom];
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target: self
                                                      selector: @selector(dropTheBird:) userInfo: nil repeats: YES];
    [myTimer fire];
    // Do any additional setup after loading the view from its nib.
}

-(void)dropTheBird:(id)sender{
    [flipperBird setFrame:CGRectMake(flipperBird.frame.origin.x, flipperBird.frame.origin.y+1, flipperBird.frame.size.width, flipperBird.frame.size.height)];
    [top setFrame:CGRectMake(top.frame.origin.x - 2, top.frame.origin.y, top.frame.size.width, top.frame.size.height)];
    [bottom setFrame:CGRectMake(bottom.frame.origin.x - 2, bottom.frame.origin.y, bottom.frame.size.width, bottom.frame.size.height)];
    if (flipperBird.frame.origin.y > 503) {
        UIAlertView *GameOVer = [[UIAlertView alloc]initWithTitle:@"oh no!" message:@"you lost" delegate:self cancelButtonTitle:@"retry" otherButtonTitles:nil, nil];
        [GameOVer show];
        
        [myTimer invalidate];
    }
    if (flipperBird.frame.origin.x >= bottom.frame.origin.x && flipperBird.frame.origin.x <=bottom.frame.origin.x+40) {
		if (flipperBird.frame.origin.y <= top.frame.size.height || flipperBird.frame.origin.y >=  bottom.frame.origin.y) {
			UIAlertView *GameOVer = [[UIAlertView alloc]initWithTitle:@"oh no!" message:[NSString stringWithFormat:@"you lost. Your score was %@",score.text] delegate:self cancelButtonTitle:@"okay" otherButtonTitles:nil, nil];
			[GameOVer show];
			[myTimer invalidate];
		}
    }
    if (bottom.frame.origin.x < -120) {
        [self addtoScore];

        [top setFrame:CGRectMake(320, top.frame.origin.y, top.frame.size.width, top.frame.size.height)];
        [bottom setFrame:CGRectMake(320, bottom.frame.origin.y, bottom.frame.size.width, bottom.frame.size.height)];
    }
}

-(void)addtoScore{
    scoreNumber++;
    [score setText:[NSString stringWithFormat:@"%i",scoreNumber]];
}

-(void)removeScore{
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    myTimer = nil;
    [flipperBird removeFromSuperview];
    flipperBird = nil;
    [top removeFromSuperview];
    top = nil;
    [bottom removeFromSuperview];
    bottom = nil;
    [score removeFromSuperview];
    score = nil;
    [self viewDidLoad];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self makeFallwithView:flipperBird];
    
}

-(void)makeFallwithView:(UIImageView*)bird{
    [bird setFrame:CGRectMake(bird.frame.origin.x, bird.frame.origin.y-55, bird.frame.size.width, bird.frame.size.height)];
 
    if (bird.frame.origin.y < 0) {
		UIAlertView *GameOVer = [[UIAlertView alloc]initWithTitle:@"oh no!" message:[NSString stringWithFormat:@"you lost. Your score was %@",score.text] delegate:self cancelButtonTitle:@"okay" otherButtonTitles:nil, nil];
        [GameOVer show];
        [myTimer invalidate];

    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
