//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Bob Leano on 1/9/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\leano. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipSegments;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.defaultTipSegments.selectedSegmentIndex = 2;
    [self updateValues];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onValueChanged:(id)sender {
    [self updateValues];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)updateValues{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float indexSelected = self.defaultTipSegments.selectedSegmentIndex;
    [defaults setFloat:indexSelected forKey:@"defaultTipIndex"];
    [defaults synchronize];
    NSLog(@"defaultTipIndex %f", indexSelected);

}

@end
