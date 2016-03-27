//
//  SecurityPanelSpec.m
//  ColorCombo
//
//  Created by Alex Ogorek on 3/27/16.
//  Copyright © 2016 pillartest. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Kiwi.h"

SPEC_BEGIN(SecurityPanel)

describe(@"Security Panel", ^{
	context(@"when passed a marker color and an identical chip", ^{
		it(@"unlocks the panel", ^{
			SecurityPanel *panel = [SecurityPanel mock];
			
			NSArray *chipsArray = @[@"blue,green", @"blue,green"];
			[panel unlockPanelWithChipsAndMarkers:chipsArray];
		});
	});
});

SPEC_END
