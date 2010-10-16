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
@synthesize i_city, i_tableView;


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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	
	// Set up the cell...
	NSString *cellText = [listOfItems objectAtIndex:indexPath.row];
	cell.text = cellText;
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *selectedOption = [listOfItems objectAtIndex:indexPath.row];
	
	
	ResultsView *resultsView = [[ResultsView alloc] initWithNibName:@"ResultsView" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:resultsView animated:YES];
	
	NSLog(@"%@ from SearchOptions class", selectedOption);
	resultsView.i_selectedOption = selectedOption;
	
	//[resultsView release];
	//resultsView = nil;
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
