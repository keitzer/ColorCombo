//
//  SecurityPanel.m
//  ColorCombo
//
//  Created by Alex Ogorek on 3/27/16.
//  Copyright © 2016 pillartest. All rights reserved.
//

#import "SecurityPanel.h"

@interface SecurityPanel ()
@property (nonatomic, strong) NSArray *markerColors;
@end

@implementation SecurityPanel

-(NSString *)unlockPanelWithChipsAndMarkers:(NSArray *)chipsAndMarkerArray {
	if (chipsAndMarkerArray.count < 2) {
		return @"NOT ENOUGH ELEMENTS";
	}
	else if (chipsAndMarkerArray.count == 2 && [chipsAndMarkerArray[0] isEqualToString:chipsAndMarkerArray[1]]) {
		return chipsAndMarkerArray[1];
	}
	else {
		
		self.markerColors = [chipsAndMarkerArray[0] componentsSeparatedByString:@","];
		
		NSMutableArray *chipsOnlyArray = [chipsAndMarkerArray mutableCopy];
		[chipsOnlyArray removeObjectAtIndex:0];
		
		NSString *solution = [self getCombinationWithRemainingChips:chipsOnlyArray forPreviousColor:self.markerColors[0]];
		NSLog(@"%@", solution);
		return solution;
		
	}
	
	//when in doubt, return "cannot unlock"
	return @"Cannot unlock master panel";
}

-(NSString*)getCombinationWithRemainingChips:(NSArray*)remainingChips forPreviousColor:(NSString*)previousColor {
	
	if (remainingChips.count == 1) {
		NSArray *chipColors = [remainingChips[0] componentsSeparatedByString:@","];
		if ([chipColors[0] isEqualToString:previousColor] && [chipColors[1] isEqualToString:self.markerColors[1]]) {
			return remainingChips[0];
		}
		else {
			return @"Cannot unlock master panel";
		}
	}
	
	
	NSString *solution = @"";
	BOOL solutionFound = NO;
	
	for (NSString *chip in remainingChips) {
		solution = @"";
		NSArray *chipColors = [chip componentsSeparatedByString:@","];
		
		if ([chipColors[0] isEqualToString:previousColor]) {
			NSMutableArray *newChipArray = [remainingChips mutableCopy];
			[newChipArray removeObjectAtIndex:[remainingChips indexOfObject:chip]];
			
			solution = [NSString stringWithFormat:@"%@ %@", chip, [self getCombinationWithRemainingChips:newChipArray forPreviousColor:chipColors[1]]];
			
			if (![solution containsString:@"Cannot unlock master panel"]) {
				solutionFound = YES;
				break;
			}
		}
	}
	
	if (!solutionFound) {
		return @"Cannot unlock master panel";
	}
	else {
		return solution;
	}
}

@end
