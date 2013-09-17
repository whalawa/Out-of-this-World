//
//  AddSpaceObjectViewController.h
//  Out Of This World
//
//  Created by Teddy Wyly on 9/17/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AstronomicalObject.h"

@class AddSpaceObjectViewController;

@protocol AddSpaceObjectViewControllerDelegate <NSObject>

- (void)addSpaceObjectViewController:(AddSpaceObjectViewController *)viewController didAddAstronomicalObject:(AstronomicalObject *)astronomicalObject;

@end


@interface AddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id<AddSpaceObjectViewControllerDelegate> delegate;

@end
