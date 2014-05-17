//
//  ResultsViewController.h
//  BMICalculator
//
//  Created by Ricardo Ruiz on 5/15/14.
//  Copyright (c) 2014 ABC Adult School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *bmiResult;
// Added to display Range Result
@property (weak, nonatomic) IBOutlet UILabel *bmiMessage;

// String property accessed by origin ViewController to load BMI
// into label bmiResult
@property (strong,nonatomic) NSString *calculatedResult;

// BMI range string
@property (strong,nonatomic) NSString *bmiMessageString;
// Background color of bmiMessage Label
@property (strong,nonatomic) UIColor *bmiColor;

@end
