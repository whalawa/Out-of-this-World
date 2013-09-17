//
//  AddSpaceObjectViewController.m
//  Out Of This World
//
//  Created by Teddy Wyly on 9/17/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import "AddSpaceObjectViewController.h"

@interface AddSpaceObjectViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation AddSpaceObjectViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"HubbleDeepFieldByNasa.jpg"]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addObjectButtonPressed:(UIButton *)sender
{
    AstronomicalObject *object = [[AstronomicalObject alloc] init];
    [self.delegate addSpaceObjectViewController:self didAddAstronomicalObject:object];
}


@end
