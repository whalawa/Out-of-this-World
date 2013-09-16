//
//  PlanetsTableViewController.m
//  Out Of This World
//
//  Created by Teddy Wyly on 9/13/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import "PlanetsTableViewController.h"
#import "AstronomicalObject.h"
#import "AstronomicalImageViewController.h"

@interface PlanetsTableViewController ()

@property (strong, nonatomic) NSArray *outerSpaceBodies;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AstronomicalObject *mercury = [[AstronomicalObject alloc] initWithName:@"Mercury" andImage:[UIImage imageNamed:@"Mercury.jpg"]];
    mercury.nickname = @"Hermes";
    AstronomicalObject *venus = [[AstronomicalObject alloc] initWithName:@"Venus" andImage:[UIImage imageNamed:@"Venus.jpg"]];
    venus.nickname = @"Aphrodite";
    AstronomicalObject *earth = [[AstronomicalObject alloc] initWithName:@"Earth" andImage:[UIImage imageNamed:@"Earth.jpg"]];
    earth.nickname = @"Gaea";
    AstronomicalObject *mars = [[AstronomicalObject alloc] initWithName:@"Mars" andImage:[UIImage imageNamed:@"Mars.jpg"]];
    mars.nickname = @"Ares";
    AstronomicalObject *jupiter = [[AstronomicalObject alloc] initWithName:@"Jupiter" andImage:[UIImage imageNamed:@"Jupiter.jpg"]];
    jupiter.nickname = @"Zeus";
    AstronomicalObject *saturn = [[AstronomicalObject alloc] initWithName:@"Saturn" andImage:[UIImage imageNamed:@"Saturn.jpg"]];
    saturn.nickname = @"Cronus";
    AstronomicalObject *neptune = [[AstronomicalObject alloc] initWithName:@"Neptune" andImage:[UIImage imageNamed:@"Neptune.jpg"]];
    neptune.nickname = @"Poseidon";
    AstronomicalObject *uranus = [[AstronomicalObject alloc] initWithName:@"Uranus" andImage:[UIImage imageNamed:@"Uranus.jpg"]];
    uranus.nickname = @"Uranus";
    
    self.outerSpaceBodies = @[mercury, venus, earth, mars, jupiter, saturn, neptune, uranus];

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
    if ([segue.destinationViewController isKindOfClass:[AstronomicalImageViewController class]]) {
        AstronomicalImageViewController *viewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        viewController.astronomicalObject = [self.outerSpaceBodies objectAtIndex:indexPath.row];
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.outerSpaceBodies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    AstronomicalObject *spaceObject = [self.outerSpaceBodies objectAtIndex:indexPath.row];
    
    cell.textLabel.text = spaceObject.name;
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Also known as %@", spaceObject.nickname];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.85 alpha:1.0];
    
    cell.imageView.image = spaceObject.image;
    
    return cell;
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

@end
