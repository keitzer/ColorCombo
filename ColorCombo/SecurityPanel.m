//
//  SecurityPanel.m
//  ColorCombo
//
//  Created by Alex Ogorek on 3/27/16.
//  Copyright © 2016 pillartest. All rights reserved.
//

#import "SecurityPanel.h"

@implementation SecurityPanel

-(NSString *)unlockPanelWithChipsAndMarkers:(NSArray *)chipsAndMarkerArray {
	if (chipsAndMarkerArray.count < 2) {
		return @"NOT ENOUGH ELEMENTS";
	}
	else if (chipsAndMarkerArray.count == 2 && [chipsAndMarkerArray[0] isEqualToString:chipsAndMarkerArray[1]]) {
		return chipsAndMarkerArray[1];
	}
	else {
		
		NSArray *markerColors = [chipsAndMarkerArray[0] componentsSeparatedByString:@","];
		
		NSMutableArray *chipsOnlyArray = [chipsAndMarkerArray mutableCopy];
		[chipsOnlyArray removeObjectAtIndex:0];
		
		for (NSString *chip in chipsOnlyArray) {
			NSArray *chipColors = [chip componentsSeparatedByString:@","];
			NSMutableArray *remainingChipsArray = [chipsOnlyArray mutableCopy];
			
			if ([chipColors[0] isEqualToString: markerColors[0]]) {
				[remainingChipsArray removeObjectAtIndex:[chipsOnlyArray indexOfObject:chip]];
				
				for (NSString *otherChip in remainingChipsArray) {
					NSArray *otherChipColors = [otherChip componentsSeparatedByString:@","];
					if ([otherChipColors[0] isEqualToString:chipColors[1]] && [otherChipColors[1] isEqualToString:markerColors[1]]) {
						return [NSString stringWithFormat:@"%@ %@", chip, otherChip];
					}
					else {
						return @"Cannot unlock master panel";
					}
				}
			}
		}
		
	}
	
	//when in doubt, return "cannot unlock"
	return @"Cannot unlock master panel";
}

@end
