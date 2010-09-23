//
//  ResultsView.h
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ResultsView : UIViewController <UIScrollViewDelegate> {

	IBOutlet UIScrollView *scrollView;
	IBOutlet UITableView *tableView;
}

- (IBAction)goBack;

@end
