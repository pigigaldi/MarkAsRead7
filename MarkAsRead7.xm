//
//  MarkAsRead7.xm
//  MarkAsRead7
//
//  Created by Pigi Galdi on 05.07.2014.
//  Copyright (c) 2014 Pigi Galdi. All rights reserved.
//
// Imports.
#import "headers.h"

%group modern_ios7 // modern.

// Handle "Clear" button (section) touched.
%hook SBBulletinObserverViewController
- (void)clearSection:(SBNotificationsSectionInfo *)section {
	
	// Remove section from NC.
	%orig();

	// Getting icon.
	SBIconController *_iconController = [%c(SBIconController) sharedInstance];
	SBIconModel *_iconModel = [_iconController model];
	SBIcon *_currentIcon = [_iconModel applicationIconForBundleIdentifier:[section identifier]];
	// "Removing" badge by setting it to 0.
	[_currentIcon setBadge:[NSNumber numberWithInt:0]];
}
%end
%end // modern.

%ctor {
	@autoreleasepool {
		if (MODERN_iOS)
			%init(modern_ios7);
	}
}
