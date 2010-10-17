//
//  ResultsView.m
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ResultsView.h"
#import "SearchOptions.h"

@implementation ResultsView
@synthesize  i_selectedOption, label_option;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSLog(@"%@", i_selectedOption);
	label_option.text = i_selectedOption;
	
}

- (IBAction)goBack {
	
	SearchOptions *searchOptionsController = [[SearchOptions alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:searchOptionsController animated:YES];
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
    [super dealloc];
}


@end
