//
//  ViewController.m
//  1password-demo
//
//  Created by Dmitry Beloborodov on 22/09/14.
//  Copyright (c) 2014 Dmitry Beloborodov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *checkResultLabel;
@property (weak, nonatomic) IBOutlet UITextField *passKeyword;
@property (weak, nonatomic) IBOutlet UIButton *searchPassButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// code from http://blog.agilebits.com/2013/01/24/developers-heres-how-to-add-a-little-1password-to-your-ios-apps/

- (IBAction)checkPressed:(id)sender
{
    self.checkResultLabel.hidden = NO;

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"onepassword://search"]]) {
        NSLog(@"1Password is installed!");
        self.checkResultLabel.textColor = [UIColor greenColor];
        self.checkResultLabel.text = @"1Password is installed!";
        self.searchPassButton.enabled =
        self.passKeyword.enabled = YES;
    } else {
        self.checkResultLabel.textColor = [UIColor redColor];
        self.checkResultLabel.text = @"1Password is NOT installed";
        self.searchPassButton.enabled =
        self.passKeyword.enabled = NO;
    }
}

- (IBAction)searchPassPressed:(id)sender
{
    NSString *passKey = [self.passKeyword.text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"onepassword://search/%@", passKey]]];
}


@end
