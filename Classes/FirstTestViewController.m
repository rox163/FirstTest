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
@synthesize provinceTextField, cityTextField, pickerData, provArray, ontarioCities, nbCities, albertaCities;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	provArray = [[NSMutableArray alloc] initWithObjects:@"Alberta", @"Ontario",@"New Brunswick", nil];		
	ontarioCities = [[NSMutableArray alloc] initWithObjects:@"Ajax", @"Aurora", @"Barrie", @"Belleville", @"Ottawa", @"Toronto", nil];
	albertaCities = [[NSMutableArray alloc] initWithObjects:@"Calgary", @"Edmonton", nil];
	nbCities = [[NSMutableArray alloc] initWithObjects:@"Fredrichton", @"Moncton", nil];
	
	cityTextField.enabled = NO;
	provinceDone = FALSE;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
	
	
	if (textField == provinceTextField) {
		
		provinceDone = FALSE;
		
		//prevent keyboard from launching
		[textField resignFirstResponder];

		//fill in province data
		pickerData = [provArray mutableCopy];
		
		cityTextField.enabled = YES;
	}
	else if (textField == cityTextField) {
		
		[textField resignFirstResponder];
		
		//province selection has completed
		provinceDone = TRUE;
		
		if ([pickerData objectAtIndex:selectedRow]  == [provArray objectAtIndex:0]){
			pickerData = [albertaCities mutableCopy];
		} else if ([pickerData objectAtIndex:selectedRow] == [provArray objectAtIndex:1]) {
			pickerData = [ontarioCities mutableCopy];
		} else if ([pickerData objectAtIndex:selectedRow] == [provArray objectAtIndex:2]) {
			pickerData = [nbCities mutableCopy];
		}
	}
	
	[self showActionSheet];
	
	[pickerView selectRow:0 inComponent:0 animated:YES];
	
	
}

- (void) showActionSheet {
	
	pickerSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles: nil];
	[pickerSheet setActionSheetStyle: UIActionSheetStyleBlackTranslucent];
	
	CGRect pickerFrame = CGRectMake(0,40,0,0);
	pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
	pickerView.showsSelectionIndicator = YES;
	pickerView.delegate = self;
	pickerView.dataSource = self;
	
	//using toolbar with filler space and bar button
	pickerBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 34)];
	pickerBar.barStyle = UIBarStyleBlackOpaque;
	[pickerBar sizeToFit];

	UIBarButtonItem *flexspace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector (dismissActionSheet:)];	
	NSMutableArray *items = [[NSMutableArray alloc] initWithObjects: flexspace, doneButton, nil];
	[pickerBar setItems:items animated:YES];
	
	[items release];
	[flexspace release];
	[doneButton release];
	
	// add subviews to the UIActionSheet	
	[pickerSheet addSubview:pickerView];
	[pickerSheet addSubview:pickerBar];
	[pickerBar release];
	
	//animating the actionsheet
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.4];
	CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 100);
	pickerSheet.transform = transform;
	
	// show the actionSheet
	[pickerSheet showInView: self.view];	
	[pickerSheet setBounds:CGRectMake(0, 0, 320, 460)];
	
	[UIView commitAnimations];
	  
				
}

- (BOOL) dismissActionSheet: (id)sender {

	//filling in the province
	if (!provinceDone) {
		if (selectedRow == 0) {
			provinceTextField.text = [pickerData objectAtIndex:selectedRow];
		}
		else if (selectedRow == 1) {
			provinceTextField.text = [pickerData objectAtIndex:selectedRow];
		}
		else if (selectedRow== 2) {
			provinceTextField.text = [pickerData objectAtIndex:selectedRow];
		}
	}
	//filling in the city
	else if (provinceDone) {
		if (selectedRow == 0) {
			cityTextField.text = [pickerData objectAtIndex:selectedRow];
		}
		else if (selectedRow == 1) {
			cityTextField.text = [pickerData objectAtIndex:selectedRow];
		}
		else if (selectedRow== 2) {
			cityTextField.text = [pickerData objectAtIndex:selectedRow];
		}
	}

	
	[pickerSheet dismissWithClickedButtonIndex:0 animated:YES];
	
	[pickerView release];
	[pickerSheet release];
	
	return YES;
}

- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *)pickerView {
	
	return 1;
}

- (NSInteger) pickerView: (UIPickerView *)picker numberOfRowsInComponent:(NSInteger)component {

	return [pickerData count];
}

- (NSString *) pickerView: (UIPickerView *)picker titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	return [pickerData objectAtIndex:row];
}

- (void) pickerView: (UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

	//should be in DONE action method
	selectedRow = row;
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
