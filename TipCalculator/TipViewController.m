//
//  ViewController.m
//  TipCalculator
//
//  Created by Bob Leano on 1/9/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\leano. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billText;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSegments;
@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:2 forKey:@"defaultTipIndex"];
    [defaults synchronize];
    self.title = @"Tip Calculator";
    [self updateValues:-1];

}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    [self updateValues:-1];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onValueChange:(UISegmentedControl *)sender {
    float index = self.tipSegments.selectedSegmentIndex;
    NSLog(@"UISegmentedControl onValueChange %f", index);
    [self updateValues:index];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues:-1];
}

- (void)updateValues:(float) indexNumber {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float defaultTipIndex = indexNumber;
    if(indexNumber < 0){
        defaultTipIndex = [defaults floatForKey:@"defaultTipIndex"];
    }
    
    self.tipSegments.selectedSegmentIndex = defaultTipIndex;
    NSLog(@"defaultTipIndex %f", defaultTipIndex);
    if([self.billText hasText]){
        float billAmount = [self.billText.text floatValue];
        NSArray *tipValues = @[@0.15, @0.20, @0.30];
        float tipAmount = [tipValues[self.tipSegments.selectedSegmentIndex] floatValue] * billAmount;
        float totalAmount  = billAmount + tipAmount;
        self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
        self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    }
}


@end
