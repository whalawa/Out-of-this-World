//
//  AstronomicalImageViewController.m
//  Out Of This World
//
//  Created by Teddy Wyly on 9/13/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import "AstronomicalImageViewController.h"

@interface AstronomicalImageViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) UIImage *spaceImage;

@end

@implementation AstronomicalImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.spaceImage = self.astronomicalObject.image;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.spaceImage];
    self.scrollView.contentSize = imageView.frame.size;
    [self.scrollView addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
