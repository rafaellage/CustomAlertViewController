//
//  BaseCustomAlertViewController.m
//  CustomAlertViewController
//
//  Created by Eduardo Sanches Bocato on 20/02/17.
//  Copyright © 2017 bocato. All rights reserved.
//

#import "BaseCustomAlertViewController.h"
#import "TwoButtonsCustomAlertTableViewCell.h"
#import "SingleButtonCustomAlertTableViewCell.h"
#import "CustomBaseAlertViewModel.h"
#import "RoundedBorderView.h"

static NSString *kTwoButtonsCustomAlertTableViewCellReuseIdentifier = @"TwoButtonsCustomAlertTableViewCell";
static NSString *kSingleButtonCustomAlertTableViewCellReuseIdentifier = @"SingleButtonCustomAlertTableViewCell";

@interface BaseCustomAlertViewController() <UITableViewDataSource, UITableViewDelegate, SingleButtonCustomAlertTableViewCellDelegate, TwoButtonsCustomAlertTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet RoundedBorderView *alertViewContainer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeightConstraint;
@property (strong, nonatomic) CustomBaseAlertViewModel *customBaseAlertViewModel;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *visualEffectView;
@property (strong, nonatomic) UIVisualEffect *visualEffect;

@end

@implementation BaseCustomAlertViewController

#pragma mark - Getters and Setters
- (NSArray<CustomAlertAction *>*)getActions{
    return self.customBaseAlertViewModel.actions;
}

#pragma mark - LifeCycle
+ (instancetype)instantiateNew {
    UIStoryboard *imageCaptureStoryboard = [UIStoryboard storyboardWithName:@"CustomAlerts" bundle:[NSBundle mainBundle]];
    BaseCustomAlertViewController *baseCustomAlertViewController = [imageCaptureStoryboard instantiateViewControllerWithIdentifier:@"BaseCustomAlert"];
    baseCustomAlertViewController.providesPresentationContextTransitionStyle = YES;
    baseCustomAlertViewController.definesPresentationContext = YES;
    baseCustomAlertViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    return baseCustomAlertViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureVisualEffect];
    [self configureTableView];
    [self configureLayout];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self configureTableViewHeightConstraint];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self animateIn];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
}

#pragma mark - Configuration
- (void)configureVisualEffect {
    self.visualEffect = self.visualEffectView.effect;
    self.visualEffectView.effect = nil;
}

- (void)configureTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 44;
}

- (void)configureTableViewHeightConstraint {
    CGFloat newHeight = self.customBaseAlertViewModel.actions.count > 2 ? 44 * self.customBaseAlertViewModel.actions.count : 44;
    self.tableViewHeightConstraint.constant =  newHeight;
}

- (void)configureLayout {
    self.imageView.image = self.customBaseAlertViewModel.image;
    self.titleLabel.text = self.customBaseAlertViewModel.title;
    self.messageLabel.text = self.customBaseAlertViewModel.message;
}

+ (instancetype)alertControllerWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message {
    BaseCustomAlertViewController *baseCustomAlertViewController= [BaseCustomAlertViewController instantiateNew];
    baseCustomAlertViewController.customBaseAlertViewModel = [CustomBaseAlertViewModel initWithImage:image title:title message:message];
    return baseCustomAlertViewController;
}

- (void)addAction:(CustomAlertAction *)action{
    [self.customBaseAlertViewModel addAction:action];
}

- (void)configureWithDefaultAction {
    
    CustomAlertAction *defaultAction = [CustomAlertAction actionWithTitle:@"OK" handler:^(CustomAlertAction *action) {
        [self hide];
    }];
    [self addAction:defaultAction];
}

- (void)configureSingleButtonForCell:(SingleButtonCustomAlertTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath{
    NSString *title = self.customBaseAlertViewModel.actions[indexPath.row].title;
    [cell configureButtonWithTitle:title];
    cell.delegate = self;
}

- (void)configureTwoButtonsForCell:(TwoButtonsCustomAlertTableViewCell *)cell {
    NSString *leftTitle = self.customBaseAlertViewModel.actions.firstObject.title;
    [cell configureLeftButtonWithTitle:leftTitle];
    NSString *rightTitle = self.customBaseAlertViewModel.actions.lastObject.title;
    [cell configureRightButtonWithTitle:rightTitle];
    cell.delegate = self;
}

#pragma mark - Animation
- (void)animateIn {
    [self.view addSubview:self.alertViewContainer];
    self.alertViewContainer.center = self.view.center;
    
    self.alertViewContainer.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alertViewContainer.alpha = 0;
    
    [UIView animateWithDuration: 0.4 animations:^{
        self.visualEffectView.effect = self.visualEffect;
        self.alertViewContainer.alpha = 1;
        self.alertViewContainer.transform = CGAffineTransformIdentity;
    }];
}

- (void)animateOut {
    [UIView animateWithDuration:0.3 animations:^{
        self.alertViewContainer.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.alertViewContainer.alpha = 0;
        self.visualEffectView.effect = nil;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.view removeFromSuperview];
            [self dismissViewControllerAnimated:NO completion:nil];
        }
    }];
}

#pragma mark - Helpers
- (void)showInViewController:(UIViewController *)viewController {
    [viewController presentViewController:self animated:NO completion:nil];
}

- (void)hide {
    [self hideWithCompletion:nil];
}

- (void)hideWithCompletion:(void (^ __nullable)(void))completion{
    [self animateOut];
    if (completion) {
        completion();
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.customBaseAlertViewModel.actions == nil) {
        [self configureWithDefaultAction];
    }
    
    return self.customBaseAlertViewModel.actions.count > 2 ? self.customBaseAlertViewModel.actions.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.customBaseAlertViewModel.actions.count == 2) {
        TwoButtonsCustomAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTwoButtonsCustomAlertTableViewCellReuseIdentifier];
        [self configureTwoButtonsForCell:cell];
        return cell;
    }
    else {
        SingleButtonCustomAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSingleButtonCustomAlertTableViewCellReuseIdentifier];
        [self configureSingleButtonForCell:cell forIndexPath:indexPath];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

#pragma mark - SingleButtonCustomAlertTableViewCellDelegate
-(void)didClickSingleButtonOnCustomAlert:(SingleButtonCustomAlertTableViewCell *)cell{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSInteger actionIndex = indexPath.row;
    CustomAlertAction *buttonAction = self.customBaseAlertViewModel.actions[actionIndex];
    buttonAction.handler(buttonAction);
}

#pragma mark - TwoButtonsCustomAlertTableViewCellDelegate
-(void)didClickLeftButtonOnCustomAlert:(TwoButtonsCustomAlertTableViewCell *)cell{
    CustomAlertAction *leftButtonAction = self.customBaseAlertViewModel.actions.firstObject;
    leftButtonAction.handler(leftButtonAction);
}

-(void)didClickRightButtonOnCustomAlert:(TwoButtonsCustomAlertTableViewCell *)cell{
    CustomAlertAction *rightButtonAction = self.customBaseAlertViewModel.actions.lastObject;
    rightButtonAction.handler(rightButtonAction);
}

@end
