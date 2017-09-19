//
//  SoundBoardController.m
//  SoundBoard
//
//  Created by Paul Derbyshire on 19/09/2017.
//  Copyright © 2017 derbs. All rights reserved.
//

#import "SoundBoardController.h"
#import <AVFoundation/AVFoundation.h>


@interface SoundBoardController ()
@property (nonatomic,strong) AVAudioPlayer *audioPlayer;
@end



@implementation SoundBoardController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.audioPlayer = [AVAudioPlayer new];
}


-(IBAction)soundButtonPressed:(UIButton *)sender {
	
	switch (sender.tag) {
		case 1:
			[self playSoundCalled:@"test1" ofType:@"mp3"];
			break;
		case 2:
			[self playSoundCalled:@"test2" ofType:@"mp3"];
			break;
			
		// etc... - keep filling out these cases for different sounds

		default:
			break;
	}
	
}


-(void)playSoundCalled:(NSString *)name ofType:(NSString *)type {
	
	NSURL *fileURL = [[NSBundle mainBundle] URLForResource:name withExtension:type];
	if (!fileURL) {
		NSLog(@"File not found");
		return;
	}
	
	NSError *fileError;
	self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&fileError];
	[self.audioPlayer prepareToPlay];
	[self.audioPlayer play];
	
}


@end
