//
//  SecurityPanelSpec.m
//  ColorCombo
//
//  Created by Alex Ogorek on 3/27/16.
//  Copyright © 2016 pillartest. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Kiwi.h"
#import "SecurityPanel.h"

SPEC_BEGIN(SecurityPanelSpec)

describe(@"Security Panel", ^{
	context(@"when passed a marker color and an identical chip", ^{
		it(@"unlocks the panel", ^{
			SecurityPanel *panel = [[SecurityPanel alloc] init];
			
			NSArray *chipsArray = @[@"blue,green", @"blue,green"];
			NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
			[[returnedOrder should] equal:@"blue,green"];
		});
	});
	
	
	
	context(@"when passed a marker color and 2 chips", ^{
		context(@"when chips align", ^{
			it(@"should return correct order", ^{
				SecurityPanel *panel = [[SecurityPanel alloc] init];
				
				NSArray *chipsArray = @[@"blue,green", @"red,green", @"blue,red"];
				NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
				[[returnedOrder should] equal:@"blue,red red,green"];
			});
		});
	});
	
	context(@"when passed a marker color and not a matching chip", ^{
		it(@"says it cannot be unlocked", ^{
			SecurityPanel *panel = [[SecurityPanel alloc] init];
			
			NSArray *chipsArray = @[@"blue,green", @"blue,red"];
			NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
			[[returnedOrder should] equal:@"Cannot unlock master panel"];
		});
	});
});

SPEC_END
