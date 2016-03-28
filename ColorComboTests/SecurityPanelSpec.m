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
	__block SecurityPanel *panel;
	
	beforeEach(^{
		panel = [[SecurityPanel alloc] init];
	});
	
	context(@"when passed a marker color and an identical chip", ^{
		it(@"unlocks the panel", ^{
			NSArray *chipsArray = @[@"blue,green", @"blue,green"];
			NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
			[[returnedOrder should] equal:@"blue,green"];
		});
	});
	
	context(@"when passed a marker color and 2 chips", ^{
		context(@"when chips align", ^{
			it(@"should return correct order", ^{
				NSArray *chipsArray = @[@"blue,green", @"red,green", @"blue,red"];
				NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
				[[returnedOrder should] equal:@"blue,red red,green"];
			});
		});
		
		context(@"when chips don't align", ^{
			it(@"should return unable to unlock", ^{
				NSArray *chipsArray = @[@"blue,green", @"red,purple", @"blue,red"];
				NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
				[[returnedOrder should] equal:@"Cannot unlock master panel"];
			});
		});
	});
	
	context(@"when passed a marker color and 4 chips", ^{
		context(@"when chips align", ^{
			it(@"should return correct order", ^{
				NSArray *chipsArray = @[@"blue,green", @"red,purple", @"blue,red", @"yellow,green", @"purple,yellow"];
				NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
				[[returnedOrder should] equal:@"blue,red red,purple purple,yellow yellow,green"];
			});
		});
		
		context(@"when chips don't align", ^{
			it(@"should return unable to unlock", ^{
				NSArray *chipsArray = @[@"blue,green", @"red,purple", @"blue,red", @"yellow,blue", @"purple,yellow"];
				NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
				[[returnedOrder should] equal:@"Cannot unlock master panel"];
			});
		});
	});
	
	context(@"EX ONE: when passed a marker color and 5 chips that don't match", ^{
		it(@"should say it cannot be unlocked", ^{
			NSArray *chipsArray = @[@"blue,green", @"blue,yellow", @"red,orange", @"red,green", @"yellow,red", @"orange,purple"];
			NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
			[[returnedOrder should] equal:@"Cannot unlock master panel"];
		});
	});
	
	context(@"EX TWO: when passed a marker color and 5 chips that do match ", ^{
		it(@"should print the correct order", ^{
			NSArray *chipsArray = @[@"blue,green", @"blue,yellow", @"red,orange", @"red,green", @"yellow,red", @"orange,red"];
			NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
			[[returnedOrder should] equal:@"blue,yellow yellow,red red,orange orange,red red,green"];
		});
	});
	
	context(@"when passed a marker color and not a matching chip", ^{
		it(@"says it cannot be unlocked", ^{
			NSArray *chipsArray = @[@"blue,green", @"blue,red"];
			NSString *returnedOrder = [panel unlockPanelWithChipsAndMarkers:chipsArray];
			[[returnedOrder should] equal:@"Cannot unlock master panel"];
		});
	});
});

SPEC_END
