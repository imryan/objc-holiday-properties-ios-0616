//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    return self.database[season];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season {
    return self.database[season][holiday];
}

- (BOOL)holiday:(NSString* )holiday isInSeason:(NSString *)season {
    BOOL inSeason = NO;
    
    for (NSString *theHoliday in self.database[season]) {
        if ([theHoliday isEqualToString:holiday]) {
            inSeason = YES;
            break;
        }
    }
    
    return inSeason;
}

- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season {
    BOOL inSeason = NO;
    
    for (NSString *theSupply in self.database[season][holiday]) {
        if ([theSupply isEqualToString:supply]) {
            inSeason = YES;
            break;
        }
    }
    
    return inSeason;
}

- (void)addHoliday:(NSString *)holiday toSeason:(NSString *)season {
    [self.database[season] setObject:@[] forKey:holiday];
}

- (void)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season {
    [self.database[season][holiday] addObject:supply];
}

@end
