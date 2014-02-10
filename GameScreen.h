//
//  GameScreen.h
//  flutterBird
//
//  Created by Ash Bhat on 2/9/14.
//  Copyright (c) 2014 Ash Bhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameScreen : UIViewController<UIAlertViewDelegate>{
    UIImageView *flipperBird;
    NSTimer* myTimer;
    UIImageView *top;
    UIImageView *bottom;
    UILabel *score;
    int scoreNumber;
}

@end
