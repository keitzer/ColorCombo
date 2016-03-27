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
	
	if (chipsAndMarkerArray[0] == chipsAndMarkerArray[1]) {
		return chipsAndMarkerArray[1];
	}
	else {
		return @"Cannot unlock master panel";
	}
}

@end
