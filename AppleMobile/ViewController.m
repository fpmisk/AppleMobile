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
@property (weak, nonatomic) IBOutlet UIButton *shakeButton;
@property (weak, nonatomic) IBOutlet UIButton *growButton;
@property (weak, nonatomic) IBOutlet UILabel *shakeLabel;
@property (weak, nonatomic) IBOutlet UILabel *growLabel;

@end

@implementation ViewController
- (IBAction)growButtonAction:(id)sender {
}
- (IBAction)shakeButtonAction:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //((AppDelegate *)[[UIApplication sharedApplication] delegate]).appleTree
    //[[self shakeLabel] setText: ];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
