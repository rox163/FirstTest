//
//  FirstTestViewController.h
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-14.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTestViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource>  {

	UITextField *i_provinceTextField, *i_cityTextField;
	UIActionSheet *i_pickerSheet;
	UIToolbar *i_pickerBar;
	UIPickerView *i_pickerView;	
	NSInteger i_selectedRowInPicker;
	BOOL i_provinceTextFieldSelected;

}
@property (nonatomic,retain) IBOutlet UITextField *i_provinceTextField, *i_cityTextField;
@property (nonatomic,copy) NSMutableArray *provinceArray, *ontarioCities, *nbCities, *albertaCities, *i_pickerData;

- (IBAction) switchView;
- (BOOL) dismissActionSheet: (id)sender;
- (void) showActionSheet;

@end


