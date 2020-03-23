#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSMutableArray *array = [NSMutableArray new];
    NSNumber *a = @0;
    [array addObject:a];
    NSNumber *b = @1;
    [array addObject:b];
    NSNumber *c = [NSNumber numberWithInt:[a intValue] + [b intValue]];
    [array addObject:c];
//    do {
//        a = b;
//        b = c;
//        c = [NSNumber numberWithInt:[a intValue] + [b intValue]];
//        [array addObject:c];
//    } while ( number < [NSNumber numberWithInt:[b intValue] * [c intValue]] );
//    NSNumber *test = [NSNumber numberWithInt:[b intValue] * [c intValue]];
//    BOOL m = [number intValue] > [[NSNumber numberWithInt:[b intValue] * [c intValue]] intValue];
    while ( [number intValue] > [[NSNumber numberWithInt:[b intValue] * [c intValue]] intValue] )
    {
          a = b;
          b = c;
          c = [NSNumber numberWithInt:[a intValue] + [b intValue]];
          [array addObject:c];
    }
    
    if ([NSNumber numberWithInt:[b intValue] * [c intValue]] == number) {
        [array addObject:@1];
         } else {
            [array addObject:@0];
        }
    NSArray *result = [array subarrayWithRange:NSMakeRange(array.count - 3, 3)];

    return result;
}
@end

//Given a number n, calculate the n-th Fibonacci number. (Recall Fibonacci is 1, 1, 2, 3, 5, 8, 13, ... Start with 1 and 1 and add these values together to get the next value. The next value is the sum of the previous two. So the next value in this case is 8+13 = 21.) */
//
//let givenNumber: UInt = 3
//var oddNumber = 1
//var evenNumber = 1
//var indexOfOddNumber = 1
//var indexOfEvenNumber = 2
//var fibonacciNumber = 0
//
// while indexOfOddNumber != givenNumber && indexOfEvenNumber != givenNumber {
//    oddNumber = oddNumber + evenNumber
//    indexOfOddNumber += 2
//    evenNumber = oddNumber + evenNumber
//    indexOfEvenNumber += 2
// }
//
//if givenNumber <= 2 {
//    fibonacciNumber = 1
//} else if givenNumber % 2 == 0 {
//    fibonacciNumber = evenNumber
//} else {
//    fibonacciNumber = oddNumber
//}
// 
//print (fibonacciNumber)
