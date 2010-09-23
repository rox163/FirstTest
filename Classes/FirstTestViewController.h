//
//  FirstTestViewController.h
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-14.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTestViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource>  {

	UITextField *provinceTextField, *cityTextField;
	UIActionSheet *pickerSheet;
	UIToolbar *pickerBar;
	UIPickerView *pickerView;	
	NSInteger selectedRow;
	BOOL provinceDone;

}
@property (nonatomic,retain) IBOutlet UITextField *provinceTextField, *cityTextField;
@property (nonatomic,copy) NSMutableArray *provArray, *ontarioCities, *quebecCities, *pickerData;

- (IBAction) switchView;
- (BOOL) dismissActionSheet: (id)sender;
- (void) showActionSheet;

@end


