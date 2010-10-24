//
//  ResultsView.m
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ResultsView.h"
#import "SearchOptions.h"

#import "CustomCell.h"

@implementation ResultsView
@synthesize  i_selectedOption, i_selectedCity, i_clubData, i_clubList,i_tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//get the dictionary from plist file
	NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"searchResults" ofType:@"plist"];
	NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
	self.i_clubData = dictionary;
	[dictionary release];
	
	NSLog(@"%@", i_selectedCity);
	
	NSArray *array = [[i_clubData objectForKey:i_selectedCity] sortedArrayUsingSelector:@selector (compare:)];
	self.i_clubList = array;
	
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [i_clubList count];
}

- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"CustomCell";
	
	CustomCell *cell = (CustomCell *) [table dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]) {
				cell = (CustomCell *) currentObject;
				break;
			}
		}
	}
	
	// Set up the cell...
	cell.l_location.textColor = [UIColor redColor];
	NSString *cellText = [NSString stringWithFormat:@"%@", [i_clubList objectAtIndex:indexPath.row]];
	cell.l_location.text = cellText;
	
	return cell;
}

- (IBAction)goBack {
	
	[self.view removeFromSuperview];
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
}

- (void)dealloc {
	
	[i_clubList release];
    [super dealloc];
}


@end
