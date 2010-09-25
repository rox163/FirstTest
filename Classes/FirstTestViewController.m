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
@synthesize i_provinceTextField, i_provinceCities, i_cities, i_provinces;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//get the dictionary from plist file
	NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"provinceCitiesDictionary" ofType:@"plist"];
	NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
	self.i_provinceCities = dictionary;
	[dictionary release];

	//sort keys alphabetically and populating the first picker view arrays
	NSArray *sorted = [[self.i_provinceCities allKeys] sortedArrayUsingSelector:@selector (compare:)];
	self.i_provinces = sorted;


	NSString *selectedProvince = [self.i_provinces objectAtIndex:0];
	NSArray *array = [i_provinceCities objectForKey:selectedProvince];
	self.i_cities = array;

	
	//You'd fetch individual values like this;
	
    //NSString *value1 = [[dictionary objectForKey:@"Ontario"] objectAtIndex:0];
    //NSString *value2 = [[dictionary objectForKey:@"Ontario"] objectAtIndex:1];
    // value1 is @"MyValue1", value2 is @"MyValue2";
	
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
	
	//prevent keyboard from launching
	[textField resignFirstResponder];
	
	[self showActionSheet];
}

- (void) showActionSheet {
	
	i_pickerSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil
								  destructiveButtonTitle:nil otherButtonTitles: nil];
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

	UIBarButtonItem *flexspace = [[UIBarButtonItem alloc]
								  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self
								  action:nil];
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
								   initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
								   action:@selector (dismissActionSheet:)];	
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
	
	NSInteger provinceRow = [i_pickerView selectedRowInComponent:kProvinceComponent];
	NSInteger cityRow = [i_pickerView selectedRowInComponent:kCityComponent];
	
	NSString *province = [self.i_provinces objectAtIndex:provinceRow];
	NSString *city = [self.i_cities objectAtIndex:cityRow];
	
	i_provinceTextField.text = [[NSString alloc] initWithFormat:@"%@, %@", city, province];
	[i_pickerSheet dismissWithClickedButtonIndex:0 animated:YES];
	
	
	return YES;
}

- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *)pickerView {
	
	return 2;
}

- (NSInteger) pickerView: (UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {

	if (component == kProvinceComponent)
		return [self.i_provinces count];
	return [self.i_cities count];
}

- (NSString *) pickerView: (UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	if (component == kProvinceComponent)
		return [self.i_provinces objectAtIndex:row];
	return [self.i_cities objectAtIndex:row];
}

- (void) pickerView: (UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

	if (component == kProvinceComponent)
	{
		NSString *selectedProvince = [i_provinces objectAtIndex:row];
		self.i_cities = [i_provinceCities objectForKey:selectedProvince];
		
		[i_pickerView selectRow:0 inComponent:kCityComponent animated:YES];
		[i_pickerView reloadComponent:kCityComponent];
	}
}

- (IBAction)switchView {
	ResultsView *rView = [[ResultsView alloc] initWithCity:@"TestCity"];
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
	
	[i_provinceCities release];
	[i_pickerView release];
	[i_pickerSheet release];
    [super dealloc];
}

@end
