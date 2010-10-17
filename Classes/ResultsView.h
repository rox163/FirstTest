//
//  ResultsView.h
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsView : UIViewController {

	IBOutlet UILabel *label_option;
	//IBOutlet UIScrollView *i_scrollView;
	
	NSString *i_selectedOption;
	
}

//@property (nonatomic, retain) UIScrollView *i_scrollView;
@property (nonatomic, retain) UILabel *label_option;
@property (nonatomic, retain) NSString *i_selectedOption;
- (IBAction)goBack;

@end
