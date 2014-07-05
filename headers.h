//
//  MarkAsRead7.xm
//  MarkAsRead7
//
//  Created by Pigi Galdi on 05.07.2014.
//  Copyright (c) 2014 Pigi Galdi. All rights reserved.
//
// Apple.
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
// Cydia.
#include <substrate.h>
// Check iOS Version.
#define MODERN_iOS ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
// Private Interface.
@interface SBIcon
- (void)setBadge:(id)arg1;
@end
@interface SBIconModel
-(id)expectedIconForDisplayIdentifier:(id)arg1 ;
@end
@interface SBIconController
-(id)sharedInstance;
-(SBIconModel *)model;
@end
@interface SBNotificationsSectionInfo
- (id)identifier;
@end
