//
//  SearchOptions.m
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SearchOptions.h"
#import "FirstTestViewController.h"
#import "ResultsView.h"

@implementation SearchOptions
@synthesize i_city, i_tableView, resultsViewController;


- (SearchOptions *)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil city: (NSString *) city {
	
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.i_city = city;
		NSLog(@"%@", i_city);
	}
	return self;
}


- (IBAction)goBack {
	
	FirstTestViewController *firstView = [[FirstTestViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:firstView animated:YES];
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
	[super viewDidLoad];
	
	listOfItems = [[NSMutableArray alloc] init];
	//Add items
	[listOfItems addObject:@"Search by Club"];
	[listOfItems addObject:@"Search by GroupEX class"];
	//[i_tableView setFrame:CGRectMake(0, 0, 320, 500)];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [listOfItems count];
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	return UITableViewCellAccessoryDetailDisclosureButton;
}

- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	
	// Set up the cell...
	NSString *cellText = [listOfItems objectAtIndex:indexPath.row];
	[cell setText: cellText];
	
	return cell;
}

- (void)tableView:(UITableView *)table didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *selectedOption = [listOfItems objectAtIndex:indexPath.row];
	NSLog(@"%@ from SearchOptions class", selectedOption);
	
	if(resultsViewController == nil)
		self.resultsViewController = [[ResultsView alloc] initWithNibName:@"ResultsView" bundle:[NSBundle mainBundle]];
	
	//Passing the selected option
	resultsViewController.i_selectedOption = selectedOption;
	
	//Add the view as a sub view to the current view.
	[self.view addSubview:[resultsViewController view]];
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	
	[listOfItems release];	
	[resultsViewController release];
    [super dealloc];
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */
@end
