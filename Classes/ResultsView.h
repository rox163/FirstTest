//
//  ResultsView.h
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsView : UIViewController {

	NSDictionary *i_clubData;
	NSString *i_selectedOption;
	NSString *i_selectedCity;
	NSMutableArray *i_clubList;
	IBOutlet UITableView *tableView;
	
}

@property (nonatomic, retain) NSMutableArray *i_clubList;
@property (nonatomic, retain) NSString *i_selectedOption, *i_selectedCity;
@property (nonatomic, retain) NSDictionary *i_clubData;
@property (nonatomic, retain) UITableView *tableView;
- (IBAction)goBack;

@end
