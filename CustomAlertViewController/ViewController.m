//
//  ViewController.m
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 21/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertViewController.h"
#import "CustomAlertAction.h"
#import "CustomAlertBody.h"
#import "MAMaterialTextField.h"
#import "CustomAlertTextFieldModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Usage Examples
- (void)customAlertWithDefaultAction {
    CustomAlertViewController *customAlert = [CustomAlertViewController alertControllerWithImage:[UIImage imageNamed:@"ic_alert_warning"] title:@"TITLE!" message:@"Message Message Message! YEY"];
    [customAlert showInViewController:self];
}

- (void)customAlertWithTwoActions {
    CustomAlertViewController *customAlert = [CustomAlertViewController alertControllerWithImage:[UIImage imageNamed:@"ic_alert_warning"] title:@"TITLE!" message:@"Message Message Message! Message Message Message! Message Message Message! Message Message Message! Message Message Message! Message Message Message! YEY"];
    
    CustomAlertAction *action1 = [CustomAlertAction actionWithTitle:@"action1" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 1 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action1];
    
    CustomAlertAction *action2 = [CustomAlertAction actionWithTitle:@"action2" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 2 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action2];
    
    [customAlert showInViewController:self];
}

- (void)customAlertWithThreeOrMoreActions {
    CustomAlertViewController *customAlert = [CustomAlertViewController alertControllerWithImage:[UIImage imageNamed:@"ic_alert_warning"] title:@"TITLE!" message:@"Message Message Message! YEY"];
    
    CustomAlertAction *action1 = [CustomAlertAction actionWithTitle:@"action1" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 1 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action1];
    
    CustomAlertAction *action2 = [CustomAlertAction actionWithTitle:@"action2" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 2 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action2];
    CustomAlertAction *action3 = [CustomAlertAction actionWithTitle:@"action3" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 3 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action3];
    
    [customAlert showInViewController:self];
}

- (void)customAlertWithTwoBodies {
    CustomAlertViewController *customAlert = [CustomAlertViewController alertControllerWithImage:[UIImage imageNamed:@"ic_alert_warning"]];
    
    CustomAlertBody *body1 = [CustomAlertBody bodyWithTitle:@"Body 1 Title" message:@"Message for Body 1!"];
    [customAlert addBody:body1];
    CustomAlertBody *body2 = [CustomAlertBody bodyWithTitle:@"Body 2 Title" message:@"Message for Body 2!"];
    [customAlert addBody:body2];
    
    [customAlert showInViewController:self];
}

- (void)customAlertWithSingleTextField {
    CustomAlertViewController *customAlert = [CustomAlertViewController alertControllerWithImage:[UIImage imageNamed:@"ic_alert_warning"] title:@"TEXTFIELD TEST!" message:@"Message Message Message! YEY" textField:[CustomAlertTextFieldModel initWithPlaceHolder:@"Placeholder"]];
    
    CustomAlertAction *action1 = [CustomAlertAction actionWithTitle:@"TextField Content" handler:^(CustomAlertAction * _Nullable action) {
        MAMaterialTextField *textField = customAlert.getTextFieldModels[0].textField;
        NSLog(@"TextField Content: %@", textField.text);
        [customAlert hide];
    }];
    [customAlert addAction:action1];
    
    CustomAlertAction *action2 = [CustomAlertAction actionWithTitle:@"Dismiss" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 2 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action2];
    
    [customAlert showInViewController:self];
}

- (void)customAlertWithTwoOrMoreTextFields {
    CustomAlertViewController *customAlert = [CustomAlertViewController alertControllerWithImage:[UIImage imageNamed:@"ic_alert_warning"] title:@"TEXTFIELD TEST!" message:@"Message Message Message! YEY!"];
    
    CustomAlertTextFieldModel *textFieldModel1 = [CustomAlertTextFieldModel initWithPlaceHolder:@"PlaceHolder 1"];
    [customAlert addTextField:textFieldModel1];
    CustomAlertTextFieldModel *textFieldModel2 = [CustomAlertTextFieldModel initWithPlaceHolder:@"PlaceHolder 2"];
    [customAlert addTextField:textFieldModel2];
    
    CustomAlertAction *action1 = [CustomAlertAction actionWithTitle:@"TextField Content" handler:^(CustomAlertAction * _Nullable action) {
        MAMaterialTextField *textField1 = customAlert.getTextFieldModels[0].textField;
        NSLog(@"TextField 1 Content: %@", textField1.text);
        MAMaterialTextField *textField2 = customAlert.getTextFieldModels[1].textField;
        NSLog(@"TextField 2 Content: %@", textField2.text);
        
        [customAlert hide];
    }];
    [customAlert addAction:action1];
    
    CustomAlertAction *action2 = [CustomAlertAction actionWithTitle:@"Dismiss" handler:^(CustomAlertAction * _Nullable action) {
        NSLog(@"Action 2 Pressed");
        [customAlert hide];
    }];
    [customAlert addAction:action2];
    
    [customAlert showInViewController:self];
}

#pragma mark - Button Actions
- (IBAction)oneActionTouchUpInside:(id)sender {
    [self customAlertWithDefaultAction];
}

- (IBAction)twoActionsTouchUpInside:(id)sender {
    [self customAlertWithTwoActions];
}

- (IBAction)threeOrMoreActionsTouchUpInside:(id)sender {
    [self customAlertWithThreeOrMoreActions];
}

- (IBAction)twoBodiesTouchUpInside:(id)sender {
    [self customAlertWithTwoBodies];
}

- (IBAction)singleFieldTouchUpInside:(id)sender {
    [self customAlertWithSingleTextField];
}

- (IBAction)twoOrMoreFieldsTouchUpInside:(id)sender {
    [self customAlertWithTwoOrMoreTextFields];
}

@end
