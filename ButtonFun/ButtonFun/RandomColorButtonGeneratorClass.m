//
//  RandomColorButtonGeneratorClass.m
//  ButtonFun
//
//  Created by Jeffrey Harden on 8/24/15.
//  Copyright (c) 2015 J.H. All rights reserved.
//

#import "RandomColorButtonGeneratorClass.h"

@implementation RandomColorButtonGeneratorClass

+ (id)sharedInstance
{
    static RandomColorButtonGeneratorClass *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        sharedInstance = [[RandomColorButtonGeneratorClass alloc] init];
    });
    return sharedInstance;
}

-(UIView*)addButtonsToView:(UIView*)view withButtonSize:(CGSize)size onViewSize:(CGSize)viewSize
{
    //Remove all the previous buttons on the view, you could also do this by tags instead of isKindOfClass
    for (UIView *v in view.subviews)
    {
        if ([v isKindOfClass:[UIView class]])
        {
            [v removeFromSuperview];
        }
    }
    
    int numberOfSquaresWide = viewSize.width / size.width;
    int numberOfSquaresTall = viewSize.height / size.height;
    
    //Get the spacing between each button to center them on the screen
    double spacingWidth = (viewSize.width - (numberOfSquaresWide * size.width))/ (numberOfSquaresWide + 1);
    double spacingHeight = (viewSize.height - (numberOfSquaresTall * size.height))/ (numberOfSquaresTall + 1);
    
    for (int widthIncrement = 0; widthIncrement < numberOfSquaresWide; widthIncrement++)
    {
        for (int heightIncrement = 0; heightIncrement < numberOfSquaresTall; heightIncrement++)
        {
            UIView *v = [[UIView alloc]initWithFrame:CGRectMake(spacingWidth + (widthIncrement * size.width) + (spacingWidth * widthIncrement), spacingHeight + (heightIncrement * size.height) + (spacingHeight * heightIncrement), size.width, size.height)];
            
            v.backgroundColor = [self getRandomColor];
            
            //So since these aren't buttons, we can either add a UITapGestureRecongnizer to each v or implement touchesended on the view itself... I like the object/class to handle their own actions if possible.
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapSquare:)];
            tapGesture.delegate = self;
            tapGesture.numberOfTapsRequired = 1;
            [v addGestureRecognizer:tapGesture];
            
            [view addSubview:v];
        }
    }
    
    return view;
}

-(UIColor*)getRandomColor
{
    double red = 0.0;
    double green = 0.0;
    double blue = 0.0;
    
    red = arc4random() % 256;
    green = arc4random() % 256;
    blue = arc4random() % 256;
    
    return [UIColor colorWithRed:red/256.0 green:green/256.0 blue:blue/256.0 alpha:1.0];
}

-(void)didTapSquare:(UITapGestureRecognizer*)gesture
{
    gesture.view.backgroundColor = [self getRandomColor];
}

@end
