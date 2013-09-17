//
//  PlanetsTableViewController.m
//  Out Of This World
//
//  Created by Teddy Wyly on 9/13/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import "PlanetsTableViewController.h"
#import "AstronomicalObject.h"
#import "AstronomicalData.h"
#import "AstronomicalImageViewController.h"
#import "PlanetInfoViewController.h"
#import "AddSpaceObjectViewController.h"

@interface PlanetsTableViewController () <AddSpaceObjectViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *outerSpaceBodies;
@property (strong, nonatomic) NSMutableArray *mySpaceObjects;

@end

@implementation PlanetsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSMutableArray *)mySpaceObjects
{
    if (!_mySpaceObjects) _mySpaceObjects = [[NSMutableArray alloc] init];
    return _mySpaceObjects;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    self.outerSpaceBodies = [[NSMutableArray alloc] init];
    
    for (NSDictionary *planetInformation in [AstronomicalData allKnownPlanets]) {
        AstronomicalObject *planet = [[AstronomicalObject alloc] initWithInfo:planetInformation andImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", planetInformation[PLANET_NAME]]]];
        [self.outerSpaceBodies addObject:planet];
    }
    


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.destinationViewController isKindOfClass:[PlanetInfoViewController class]]) {
        PlanetInfoViewController *viewController = segue.destinationViewController;
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        viewController.astronomicalObject = [self.outerSpaceBodies objectAtIndex:indexPath.row];
    }
    
    if ([segue.destinationViewController isKindOfClass:[AstronomicalImageViewController class]]) {
        AstronomicalImageViewController *viewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        viewController.astronomicalObject = [self.outerSpaceBodies objectAtIndex:indexPath.row];
    }
    
    if ([segue.destinationViewController isKindOfClass:[AddSpaceObjectViewController class]]) {
        AddSpaceObjectViewController *viewController = segue.destinationViewController;
        viewController.delegate = self;
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) return [self.outerSpaceBodies count];
    else return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Planet Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        AstronomicalObject *spaceObject = [self.outerSpaceBodies objectAtIndex:indexPath.row];
        
        cell.textLabel.text = spaceObject.astronomicalInformation[PLANET_NAME];
        cell.textLabel.textColor = [UIColor whiteColor];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Also known as %@", spaceObject.astronomicalInformation[PLANET_NICKNAME]];
        cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.75 alpha:1.0];
        
        cell.imageView.image = spaceObject.image;
        
    }

    
    return cell;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Planets";
    } else {
        return @"My Objects";
    }
}

# pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"Show Details" sender:indexPath];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - AddSpaceObjectViewControllerDelegate

- (void)addSpaceObjectViewController:(AddSpaceObjectViewController *)viewController didAddAstronomicalObject:(AstronomicalObject *)astronomicalObject
{
    NSLog(@"Added");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
