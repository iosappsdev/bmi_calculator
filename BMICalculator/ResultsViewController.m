//
//  ResultsViewController.m
//  BMICalculator
//
//  Created by Ricardo Ruiz on 5/15/14.
//  Copyright (c) 2014 ABC Adult School. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()
@end

@implementation ResultsViewController
@synthesize bmiResult, calculatedResult, bmiMessage, bmiMessageString, bmiColor;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Calculated BMI Result
    bmiResult.text = calculatedResult;
    // Load range string
    bmiMessage.text = [NSString stringWithFormat:@"You are %@",bmiMessageString];
    // Load UIColor passed from origin ViewController
    bmiMessage.backgroundColor = bmiColor;
    NSLog(@"Your BMI is: %@\nYou are %@",calculatedResult, bmiMessageString);
}

@end
