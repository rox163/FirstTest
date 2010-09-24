//
//  FirstTestViewController.m
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-14.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FirstTestViewController.h"
#import "ResultsView.h"

@implementation FirstTestViewController
@synthesize i_provinceTextField, i_cityTextField, i_pickerData, provinceArray, ontarioCities, nbCities, albertaCities;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	provinceArray = [[NSMutableArray alloc] initWithObjects:@"Alberta", @"Ontario", @"New Brunswick", nil];		
	ontarioCities = [[NSMutableArray alloc] initWithObjects:@"Ajax", @"Aurora", @"Barrie", @"Belleville", @"Ottawa", @"Toronto", nil];
	albertaCities = [[NSMutableArray alloc] initWithObjects:@"Calgary", @"Edmonton", @"Lethbridge", nil];
	nbCities = [[NSMutableArray alloc] initWithObjects:@"Fredrichton", @"Moncton", @"Saint John", nil];
	
	i_cityTextField.enabled = NO;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
	
	
	if (textField == i_provinceTextField) {
		
		i_provinceTextFieldSelected = TRUE;
		
		//prevent keyboard from launching
		[textField resignFirstResponder];

		//fill in province data
		i_pickerData =  [provinceArray mutableCopy];
		
		i_cityTextField.enabled = YES;
	}
	else if (textField == i_cityTextField) {
		
		[textField resignFirstResponder];
		
		//province selection has completed
		i_provinceTextFieldSelected = FALSE;
		
		if ([i_pickerData objectAtIndex:i_selectedRowInPicker]  == [provinceArray objectAtIndex:0]){
			i_pickerData = [albertaCities mutableCopy];
		} else if ([i_pickerData objectAtIndex:i_selectedRowInPicker] == [provinceArray objectAtIndex:1]) {
			i_pickerData = [ontarioCities mutableCopy];
		} else if ([i_pickerData objectAtIndex:i_selectedRowInPicker] == [provinceArray objectAtIndex:2]) {
			i_pickerData = [nbCities mutableCopy];
		}
	}
	
	[self showActionSheet];
	
	[i_pickerView selectRow:0 inComponent:0 animated:YES];
	
	
}

- (void) showActionSheet {
	
	i_pickerSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles: nil];
	[i_pickerSheet setActionSheetStyle: UIActionSheetStyleBlackTranslucent];
	
	CGRect pickerFrame = CGRectMake(0,40,0,0);
	i_pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
	i_pickerView.showsSelectionIndicator = YES;
	i_pickerView.delegate = self;
	i_pickerView.dataSource = self;
	
	//using toolbar with filler space and bar button
	i_pickerBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 34)];
	i_pickerBar.barStyle = UIBarStyleBlackOpaque;
	[i_pickerBar sizeToFit];

	UIBarButtonItem *flexspace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector (dismissActionSheet:)];	
	NSMutableArray *items = [[NSMutableArray alloc] initWithObjects: flexspace, doneButton, nil];
	[i_pickerBar setItems:items animated:YES];
	
	[items release];
	[flexspace release];
	[doneButton release];
	
	// add subviews to the UIActionSheet	
	[i_pickerSheet addSubview:i_pickerView];
	[i_pickerSheet addSubview:i_pickerBar];
	[i_pickerBar release];
	
	//animating the actionsheet
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.4];
	CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 100);
	i_pickerSheet.transform = transform;
	
	// show the actionSheet
	[i_pickerSheet showInView: self.view];	
	[i_pickerSheet setBounds:CGRectMake(0, 0, 320, 460)];
	
	[UIView commitAnimations];
}

- (BOOL) dismissActionSheet: (id)sender {

	//filling in the province
	if (i_provinceTextFieldSelected) {
		if (i_selectedRowInPicker == 0) {
			i_provinceTextField.text = [i_pickerData objectAtIndex:i_selectedRowInPicker];
		}
		else if (i_selectedRowInPicker == 1) {
			i_provinceTextField.text = [i_pickerData objectAtIndex:i_selectedRowInPicker];
		}
		else if (i_selectedRowInPicker== 2) {
			i_provinceTextField.text = [i_pickerData objectAtIndex:i_selectedRowInPicker];
		}
	}
	//filling in the city
	else if (!i_provinceTextFieldSelected) {
		if (i_selectedRowInPicker == 0) {
			i_cityTextField.text = [i_pickerData objectAtIndex:i_selectedRowInPicker];
		}
		else if (i_selectedRowInPicker == 1) {
			i_cityTextField.text = [i_pickerData objectAtIndex:i_selectedRowInPicker];
		}
		else if (i_selectedRowInPicker == 2) {
			i_cityTextField.text = [i_pickerData objectAtIndex:i_selectedRowInPicker];
		}
	}

	
	[i_pickerSheet dismissWithClickedButtonIndex:0 animated:YES];
	
	[i_pickerView release];
	[i_pickerSheet release];
	
	return YES;
}

- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *)pickerView {
	
	return 1;
}

- (NSInteger) pickerView: (UIPickerView *)picker numberOfRowsInComponent:(NSInteger)component {

	return [i_pickerData count];
}

- (NSString *) pickerView: (UIPickerView *)picker titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	return [i_pickerData objectAtIndex:row];
}

- (void) pickerView: (UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

	//should be in DONE action method
	i_selectedRowInPicker = row;
}

- (IBAction)switchView {
	
	ResultsView *rView = [[ResultsView alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:rView animated:YES];
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
	[super viewDidUnload];
}


- (void)dealloc {
	
    [super dealloc];
}

@end
