//
//  FirstTestAppDelegate.h
//  FirstTest
//
//  Created by Roxanne Panthaky on 10-09-14.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstTestViewController;

@interface FirstTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FirstTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FirstTestViewController *viewController;


@end

