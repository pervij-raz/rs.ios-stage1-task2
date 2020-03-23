#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSMutableString *result = [[NSMutableString alloc] init];
    NSMutableString *hoursString = [[NSMutableString alloc] init];
    NSMutableString *minutesString = [[NSMutableString alloc] init];
    [hoursString setString:[self convertNumbers:hours]];
    if ([minutes intValue] == 0) {
        [hoursString appendString:@" o' clock"];
        [result appendString:hoursString];
    } else if ([minutes intValue] >= 60 || [minutes intValue] <= 0) {
        [hoursString setString:@""];
        [result appendString:hoursString];
    } else if ([minutes intValue] == 15) {
        [minutesString setString:[self convertNumbers:minutes]];
        [result appendString:minutesString];
        [result appendString:@" past "];
        [result appendString:hoursString];
    } else if ([minutes intValue] >= 0 && [minutes intValue] <= 20) {
        [minutesString setString:[self convertNumbers:minutes]];
        [result appendString:minutesString];
        [result appendString:@" minutes past "];
        [result appendString:hoursString];
    } else if ([minutes intValue] == 30) {
        [result appendString:@"half past "];
        [result appendString:hoursString];
    } else if ([minutes intValue] == 45) {
        NSString *minutesInt = [NSString stringWithFormat:@"%i", 60 - [minutes intValue]];
        [minutesString setString:[self convertNumbers:minutesInt]];
        [result appendString:minutesString];
        [result appendString:@" to "];
        NSString *hoursInt = [NSString stringWithFormat:@"%i", [hours intValue] + 1];
        [hoursString setString:[self convertNumbers:hoursInt]];
        [result appendString:hoursString];
    } else if ([minutes intValue] > 30) {
        if (((60 - [minutes intValue]) % 10) == 0) {
        NSString *minutesInt = [NSString stringWithFormat:@"%i", 60 - [minutes intValue]];
        [minutesString setString:[self convertNumbers:minutesInt]];
        [result appendString:minutesString];
        [result appendString:@" minutes to "];
        NSString *hoursInt = [NSString stringWithFormat:@"%i", [hours intValue] + 1];
        [hoursString setString:[self convertNumbers:hoursInt]];
        [result appendString:hoursString];
        } else {
            NSString *minutesInt = [NSString stringWithFormat:@"%i", 60 - [minutes intValue]];
            [minutesString setString:[self convertNumbers:minutesInt]];
            [result appendString:minutesString];
            if (60 - [minutes intValue] > 20) {
            [result appendString:@" "];
            [result appendString:[self convertNumbers:[NSString stringWithFormat:@"%i", [minutesInt intValue] % 10]]];
            }
            [result appendString:@" minutes to "];
            NSString *hoursInt = [NSString stringWithFormat:@"%i", [hours intValue] + 1];
            [hoursString setString:[self convertNumbers:hoursInt]];
            [result appendString:hoursString];
        }
    }
    return result;
}


- (NSString*)convertNumbers:(NSString*)number {
    NSMutableString *result = [[NSMutableString alloc] init];
    if ([number intValue] == 1) {
        [result setString:@"one"];
    } else if ([number intValue] == 2) {
        [result setString:@"two"];
    } else if ([number intValue] == 3) {
        [result setString:@"three"];
    } else if ([number intValue] == 4) {
        [result setString:@"four"];
    } else if ([number intValue] == 5) {
        [result setString:@"five"];
    } else if ([number intValue] == 6) {
        [result setString:@"six"];
    } else if ([number intValue] == 7) {
        [result setString:@"seven"];
    } else if ([number intValue] == 8) {
        [result setString:@"eight"];
    } else if ([number intValue] == 9) {
        [result setString:@"nine"];
    } else if ([number intValue] == 10) {
        [result setString:@"ten"];
    } else if ([number intValue] == 11) {
        [result setString:@"eleven"];
    } else if ([number intValue] == 12) {
        [result setString:@"twelve"];
    } else if ([number intValue] == 13) {
        [result setString:@"thirteen"];
    } else if ([number intValue] == 14) {
        [result setString:@"fourteen"];
    } else if ([number intValue] == 15) {
        [result setString:@"quarter"];
    } else if ([number intValue] == 16) {
        [result setString:@"sixteen"];
    } else if ([number intValue] == 17) {
        [result setString:@"seventeen"];
    } else if ([number intValue] == 18) {
        [result setString:@"eighteen"];
    } else if ([number intValue] == 19) {
        [result setString:@"nineteen"];
    } else if ([number intValue] >= 20) {
        [result setString:@"twenty"];
    } else if ([number intValue] >= 30) {
        [result setString:@"thirty"];
    } else if ([number intValue] >= 40) {
        [result setString:@"forty"];
    } else if ([number intValue] >= 50) {
        [result setString:@"fifty"];
    }
    return result;
}



@end
