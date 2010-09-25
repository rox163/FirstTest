//
//  FirstTestViewController.h
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-14.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kProvinceComponent 0
#define kCityComponent 1

@interface FirstTestViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIPickerViewDelegate,
UIPickerViewDataSource>  {

	NSDictionary *i_provinceCities;
	NSArray *i_provinces, *i_cities;
	UIActionSheet *i_pickerSheet;
	UIToolbar *i_pickerBar;	
	
	IBOutlet UITextField *i_provinceTextField;
	UIPickerView *i_pickerView;

}
@property (nonatomic, retain) UITextField *i_provinceTextField;
@property (nonatomic, retain) NSArray *i_provinces, *i_cities;
@property (nonatomic, retain) NSDictionary *i_provinceCities;

- (IBAction) switchView;
- (BOOL) dismissActionSheet: (id)sender;
- (void) showActionSheet;

@end


