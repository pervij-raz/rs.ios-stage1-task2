#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    BOOL result = YES;
    NSString *al = [a lowercaseString];
    NSString *bl = [b lowercaseString];
    NSUInteger len = [bl length];
    unichar buffer[len+1];
    NSMutableString *loc = [NSMutableString new];
    [bl getCharacters:buffer range:NSMakeRange(0, len)];
    for(int i = 0; i < len; i++) {
        NSString * charString = [NSString stringWithFormat:@"%c", buffer[i]];
        if (![al containsString:charString]) {
            result = result && NO;
        } else {
            NSRange range = [al rangeOfString:charString];
            if (range.location > [loc intValue]) {
            [loc setString:[NSString stringWithFormat:@"%lu", (unsigned long)range.location]];
            } else {
                return @"NO";
            }
        }
    }
    NSMutableString *resultString = [NSMutableString new];
    if (result) {
        [resultString setString:@"YES"];
    } else {
        [resultString setString:@"NO"];
    }
    return resultString;
}
@end
