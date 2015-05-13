//
//  OWAudioViewController.h
//  Out of the World 1
//
//  Created by Divyesh B Chudasama on 22/11/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWAudioPlayer.h"

@interface OWAudioViewController : UIViewController

@property (nonatomic, strong) OWAudioPlayer *audioPlayer;

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *duration;
@property (weak, nonatomic) IBOutlet UILabel *timeElapsed;
@property (weak, nonatomic) IBOutlet UISlider *currentTimeSlider;


@property BOOL isPaused;
@property BOOL scrubbing;

@property NSTimer *timer;

@end
