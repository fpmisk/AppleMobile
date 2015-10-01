//
//  ViewController.m
//  AppleMobile
//
//  Created by fpmi on 17.09.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIButton *shakeButton;
@property (weak, nonatomic) IBOutlet UIButton *growButton;
@property (weak, nonatomic) IBOutlet UILabel *shakeLabel;
@property (weak, nonatomic) IBOutlet UILabel *growLabel;

@end

@implementation ViewController
- (IBAction)growButtonAction:(id)sender
{
    AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    int numberOfGrownApples = [[[appDelegate appleTree] countOfApple] intValue];
    [[appDelegate appleTree] grow];
    numberOfGrownApples = [[[appDelegate appleTree] countOfApple] intValue] - numberOfGrownApples;
    [[self growLabel] setText: [[[NSNumber alloc] initWithInt: numberOfGrownApples] stringValue]];
    [[self totalLabel] setText: [[[appDelegate appleTree] countOfApple] stringValue]];
}
- (IBAction)shakeButtonAction:(id)sender
{
    AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    int numberOfFallenApples = [[[appDelegate appleTree] countOfApple] intValue];
    [[appDelegate appleTree] shake];
    numberOfFallenApples -= [[[appDelegate appleTree] countOfApple] intValue];
    [[self shakeLabel] setText: [[[NSNumber alloc] initWithInt: numberOfFallenApples] stringValue]];
    [[self totalLabel] setText: [[[appDelegate appleTree] countOfApple] stringValue]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[self shakeLabel] setText: @"0"];
    [[self growLabel] setText: @"0"];
    [[self totalLabel] setText: [[[appDelegate appleTree] countOfApple] stringValue]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self shakeButtonAction: nil];
    } 
}

@end
