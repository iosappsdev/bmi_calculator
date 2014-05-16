//
//  ViewController.m
//  BMICalculator
//
//  Created by CtecTeacher on 5/15/14.
//  Copyright (c) 2014 ABC Adult School. All rights reserved.
//

#import "ViewController.h"
#import "ResultsViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize height,weight,male,female,measure, heightInches;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Load Textfield Placeholders
    [self standardPlaceholders];
    
    // Enable Gesture Recognizer on View 
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    // Set NumberPad as default input
    height.keyboardType = UIKeyboardTypeNumberPad;
    heightInches.keyboardType = UIKeyboardTypeNumberPad;
    weight.keyboardType = UIKeyboardTypeNumberPad;
    
    // Set dark color to keyboard
    height.keyboardAppearance = UIKeyboardAppearanceDark;
    heightInches.keyboardAppearance = UIKeyboardAppearanceDark;
    weight.keyboardAppearance = UIKeyboardAppearanceDark;
    
    // Optional, loads values for debugging BMI.
    UIBarButtonItem *testValues = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(loadTestValues)];
    self.navigationItem.rightBarButtonItem = testValues;
}

// Hide Keyboard
- (void)dismissKeyboard {
    
    [weight resignFirstResponder];
    [height resignFirstResponder];
    [heightInches resignFirstResponder];
}

// Load Textfield Placeholders
- (void)standardPlaceholders {
    
    height.placeholder = @"Feet";
    heightInches.placeholder = @"Inches";
    weight.placeholder = @"lbs";
    
    male.on = YES;
    female.on = NO;
}

// Load Textfield Placeholders
- (void)metricPlaceholders {
    
    height.placeholder = @"Meters";
    heightInches.placeholder = @"Centimeters";
    weight.placeholder = @"kg";
}

// Clear Textfields
- (void)clearText {
    
    [height setText:@""];
    [heightInches setText:@""];
    [weight setText:@""];
}

// Used for Debugging
- (void)loadTestValues {
    
    if (measure.selectedSegmentIndex == 1) {
        //Metric Test Input
        weight.text = @"139";
        height.text = @"1";
        heightInches.text = @"79";
    } else {
        //Standard Test Input
        weight.text = @"310";
        height.text = @"5";
        heightInches.text = @"10";
    }
}

// BMI Calculation
- (float)unitConversion {
    
    float _height;
    float _weight;
    
    // Unit Conversions
    if (measure.selectedSegmentIndex == 1) {
        
        // Metric
        int heightInCms = (([height.text intValue]*100)+[heightInches.text intValue]);
        int weightInKgs = [weight.text intValue];
        _height = (float) heightInCms * 0.01;
        _weight = (float) weightInKgs;
    } else {
        
        // Imperial
        int heightInInches = (([height.text intValue]*12)+[heightInches.text intValue]);
        int weightInPounds = [weight.text intValue];
        _height = (float) heightInInches * 0.0254;
        _weight = (float) weightInPounds * 0.4536;
    }
    
    BMI = _weight / (_height * _height);
    
    if (BMI < 18.5) {
        // Underweight
        bmiMessage = @"Underweight";
        bmiColor = [UIColor yellowColor];
    }
    else if (BMI < 25.0) {
        // Normal
        bmiMessage = @"Normal";
        bmiColor = [UIColor greenColor];
    }
    else if (BMI < 30.0) {
        // Overweight
        bmiMessage = @"Overweight";
        bmiColor = [UIColor orangeColor];
    }
    else {
        // Obese
        bmiMessage = @"Obese";
        bmiColor = [UIColor redColor];
    }
    return BMI;
}

// Reset Button
- (IBAction)reset:(id)sender {
    
    [self clearText];
    [self standardPlaceholders];
    [measure setSelectedSegmentIndex:0];
    [male setOn:YES];
    [female setOn:NO];
}

// Segmented Contol
- (IBAction)selectMeasure:(id)sender {
    
    NSString *selectedValue = @"";
    
    if (measure.selectedSegmentIndex == 1) {
        selectedValue = @"You Selected Metric";
        
        // Clear Text
        [self clearText];
        
        // Change Textfield Placeholders
        [self metricPlaceholders];
        
    } else {
        selectedValue = @"You Selected Standard";
        
        // Clear Text
        [self clearText];
        
        // Change Textfield Placeholders
        [self standardPlaceholders];
    }

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"BMI Calculator" message:selectedValue delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [alert show];
}

// Pass data to Results ViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"sendData"]) {
            
        ResultsViewController *resultController = segue.destinationViewController;
        resultController.calculatedResult = [NSString stringWithFormat:@"%.2f", [self unitConversion]];
        resultController.bmiMessageString = bmiMessage;
        resultController.bmiColor = bmiColor;
    }
}

// This stuff does nothing.
// - - - - - - - - - - - - - - - - - - - - - -
- (IBAction)submit:(id)sender {
    NSLog(@"This Button does nothing");
}
- (IBAction)maleSelected:(id)sender {
    
    if (male.on) {
        [female setOn:NO];
    } else {
        [female setOn:YES];
    }
    NSLog(@"This Switch does nothing");
}
- (IBAction)femaleSelected:(id)sender {
    
    if (female.on) {
        [male setOn:NO];
    } else {
        [male setOn:YES];
    }
    NSLog(@"This Switch does nothing");
}
// - - - - - - - - - - - - - - - - - - - - - -
@end
