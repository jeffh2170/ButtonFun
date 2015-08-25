//
//  ViewController.m
//  ButtonFun
//
//  Created by Jeffrey Harden on 8/24/15.
//  Copyright (c) 2015 J.H. All rights reserved.
//

#import "ViewController.h"
#import "RandomColorButtonGeneratorClass.h"

#define SQUARE_WIDTH 40
#define SQUARE_HEIGHT 40

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.view = [[RandomColorButtonGeneratorClass sharedInstance] addButtonsToView:self.view withButtonSize:CGSizeMake(SQUARE_WIDTH, SQUARE_HEIGHT) onViewSize:self.view.frame.size];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         [[RandomColorButtonGeneratorClass sharedInstance]addButtonsToView:self.view withButtonSize:CGSizeMake(SQUARE_WIDTH, SQUARE_HEIGHT) onViewSize:size];
         
     } completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {}];
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

@end
