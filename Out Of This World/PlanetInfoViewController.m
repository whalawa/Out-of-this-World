//
//  PlanetInfoViewController.m
//  Out Of This World
//
//  Created by Teddy Wyly on 9/16/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import "PlanetInfoViewController.h"
#import "AstronomicalData.h"

@interface PlanetInfoViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PlanetInfoViewController

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
    
    self.title = [self.astronomicalObject.astronomicalInformation[PLANET_NAME] stringByAppendingString:@"Facts"];
    self.tableView.backgroundColor = [UIColor blackColor];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Planet Info Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Nickname: ";
            cell.detailTextLabel.text = self.astronomicalObject.astronomicalInformation[PLANET_NICKNAME];
            break;
        case 1:
            cell.textLabel.text = @"Diameter (km):";
            cell.detailTextLabel.text = [self.astronomicalObject.astronomicalInformation[PLANET_DIAMETER] description];
            break;
        case 2:
            cell.textLabel.text = @"Gravitational Force:";
            cell.detailTextLabel.text = [self.astronomicalObject.astronomicalInformation[PLANET_GRAVITY] description];
            break;
        case 3:
            cell.textLabel.text = @"Length of a Year (days):";
            cell.detailTextLabel.text = [self.astronomicalObject.astronomicalInformation[PLANET_YEAR_LENGTH] description];
            break;
        case 4:
            cell.textLabel.text = @"Length of a Day (hours):";
            cell.detailTextLabel.text = [self.astronomicalObject.astronomicalInformation[PLANET_DAY_LENGTH] description];
            break;
        case 5:
            cell.textLabel.text = @"Temperature (celsius):";
            cell.detailTextLabel.text = [self.astronomicalObject.astronomicalInformation[PLANET_TEMPERATURE] description];
            break;
        case 6:
            cell.textLabel.text = @"Number of Moons:";
            cell.detailTextLabel.text = [self.astronomicalObject.astronomicalInformation[PLANET_NUMBER_OF_MOONS] description];
            break;
            
        default:
            break;
    }
    
    
    return cell;
}

@end
