//
//  RandomColorButtonGeneratorClass.h
//  ButtonFun
//
//  Created by Jeffrey Harden on 8/24/15.
//  Copyright (c) 2015 J.H. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RandomColorButtonGeneratorClass : NSObject <UIGestureRecognizerDelegate>

+ (id)sharedInstance;
-(UIView*)addButtonsToView:(UIView*)view withButtonSize:(CGSize)size onViewSize:(CGSize)viewSize;
@end
