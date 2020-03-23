#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd.MM.yy";
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru_RU"];
    formatter.locale = locale;
    NSString * dateString = [NSString stringWithFormat:@"%@.%@.%@", day, month, year];
    NSDate *date = [formatter dateFromString:dateString];
    formatter.dateFormat = @"d MMMM, EEEE";
    NSString *result = [formatter stringFromDate:date];
    if (result == nil) {
        return @"Такого дня не существует";
    }
    return result;
}

@end
