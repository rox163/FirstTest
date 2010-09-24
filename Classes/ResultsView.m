//
//  ResultsView.m
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ResultsView.h"
#import "FirstTestViewController.h"

@implementation ResultsView


- (IBAction)goBack {
	
	FirstTestViewController *firstView = [[FirstTestViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:firstView animated:YES];
	
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
    [super dealloc];
}


@end
