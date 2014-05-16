//
//  ViewController.h
//  BMICalculator
//
//  Created by Ricardo Ruiz on 5/15/14.
//  Copyright (c) 2014 iOS Apps Development All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
// Instance Variables
    float BMI;
    NSString *bmiMessage;
    UIColor *bmiColor;
}
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *height;
@property (weak, nonatomic) IBOutlet UISegmentedControl *measure;
@property (weak, nonatomic) IBOutlet UISwitch *male;
@property (weak, nonatomic) IBOutlet UISwitch *female;

// Added for more acurate BMI cacluation.
@property (weak, nonatomic) IBOutlet UITextField *heightInches;

- (IBAction)reset:(id)sender;
- (IBAction)submit:(id)sender;
- (IBAction)maleSelected:(id)sender;
- (IBAction)femaleSelected:(id)sender;
- (IBAction)selectMeasure:(id)sender;

@end
