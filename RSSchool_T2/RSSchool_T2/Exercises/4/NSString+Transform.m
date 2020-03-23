#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    if ([[self stringByTrimmingCharactersInSet: set] length] == 0)
    {
        self = @"";
        return self;
    }
    BOOL result = YES;
    NSArray *alphabet = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k",@"l",@"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z"];
    NSArray *vovels = @[@"a", @"e", @"i", @"o", @"u", @"y"];
    NSArray *constants = @[@"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k",@"l",@"m", @"n", @"p", @"q", @"r", @"s", @"t", @"v", @"w", @"x", @"z"];
    for(int i = 0; i < alphabet.count; i++) {
        if ([self.lowercaseString containsString:alphabet[i]]) {
            result = YES;
        } else {
            result = result && NO;
            break;
        }
    }
    if (result) {
        NSMutableArray *array = [self componentsSeparatedByString:@" "];
        for(int a = 0; a < array.count; a++) {
            if ([[array[a] stringByTrimmingCharactersInSet: set] length] == 0) {
                [array removeObject:array[a]];
            }
        }
        
        for(int wordIndex = 0; wordIndex < array.count; wordIndex++) {
            int count = 0;
            for(int vovelIndex = 0; vovelIndex < vovels.count; vovelIndex++) {
                if ([[array[wordIndex] lowercaseString] containsString:vovels[vovelIndex]]) {
                NSRange range = [[array[wordIndex] lowercaseString] rangeOfString:vovels[vovelIndex]];
                    NSMutableString *a = array[wordIndex];
                    NSString *v = [[a substringWithRange:range] uppercaseString];
                    NSUInteger length = [self numberOfOccurencesOfSubstring:vovels[vovelIndex] inString:[a lowercaseString]];
                    a = [a stringByReplacingOccurrencesOfString:[a substringWithRange:range]
                    withString:v];
                    count += (int)length;
                    array[wordIndex] = a;
                }
            }
            NSRange range = NSMakeRange(0, 0);
            array[wordIndex] = [array[wordIndex] stringByReplacingCharactersInRange:range
                                                                withString:[NSString stringWithFormat:@"%i", count]];
        }
        array = [array sortedArrayWithOptions:0
                       usingComparator:^NSComparisonResult(id obj1, id obj2)
        {
            id cat1 = [obj1 substringToIndex:1];
            id cat2 = [obj2 substringToIndex:1];
            return [cat1 compare:cat2 options:NSCaseInsensitiveSearch];
        }];
        self = [array componentsJoinedByString:@" "];;
    } else {
        NSMutableArray *array = [self componentsSeparatedByString:@" "];
        for(int a = 0; a < array.count; a++) {
            if ([[array[a] stringByTrimmingCharactersInSet: set] length] == 0) {
                [array removeObject:array[a]];
            }
        }
        for(int wordIndex = 0; wordIndex < array.count; wordIndex++) {
            int count = 0;
            for(int constantIndex = 0; constantIndex < constants.count; constantIndex++) {
                if ([[array[wordIndex] lowercaseString] containsString:constants[constantIndex]]) {
                NSRange range = [[array[wordIndex] lowercaseString] rangeOfString:constants[constantIndex]];
                    NSMutableString *a = array[wordIndex];
                    NSString *v = [[a substringWithRange:range] uppercaseString];
                    NSUInteger length = [self numberOfOccurencesOfSubstring:constants[constantIndex] inString:[a lowercaseString]];
                    a = [a stringByReplacingOccurrencesOfString:[a substringWithRange:range]
                    withString:v];
                    count += (int)length;
                    array[wordIndex] = a;
                }
            }
            NSRange range = NSMakeRange(0, 0);
            array[wordIndex] = [array[wordIndex] stringByReplacingCharactersInRange:range
                                                                withString:[NSString stringWithFormat:@"%i", count]];
        }
        
        array = [array sortedArrayWithOptions:0
                       usingComparator:^NSComparisonResult(id obj1, id obj2)
        {
            id cat1 = [obj1 substringToIndex:1];
            id cat2 = [obj2 substringToIndex:1];
            return [cat1 compare:cat2 options:NSCaseInsensitiveSearch];
        }];
        self = [array componentsJoinedByString:@" "];;
    }
    return self;
}

- (int)numberOfOccurencesOfSubstring:(NSString *)substring inString:(NSString*)string
{
    NSArray *components = [string componentsSeparatedByString:substring];
    return components.count - 1;
}

@end
