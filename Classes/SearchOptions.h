//
//  SearchOptions.h
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ResultsView;
@interface SearchOptions : UIViewController <UITableViewDataSource, UITableViewDelegate> {

	IBOutlet UITableView *i_tableView;
	ResultsView *resultsViewController;
	NSMutableArray *listOfItems;
	NSString *i_city;

}

@property (nonatomic, retain) NSString *i_city;
@property (nonatomic, retain) UITableView *i_tableView;
@property (nonatomic, retain) ResultsView *resultsViewController;

- (SearchOptions *) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil city: (NSString *) city; 
- (IBAction)goBack;

@end
