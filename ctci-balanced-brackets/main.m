// Solution to problem Stacks: Balanced Brackets
// https://www.hackerrank.com/challenges/ctci-balanced-brackets

#import <Foundation/Foundation.h>

BOOL isOpeningBracket(NSString *string) {
    return [@[@"(",  @"[", @"{"] containsObject:string];
}

BOOL arePaired(NSString *opening, NSString *closing) {
    NSArray *pairs = @[@"()", @"[]", @"{}"];
    return [pairs containsObject:[opening stringByAppendingString:closing]];
}

BOOL isBalanced(NSString *expression) {
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    for (NSUInteger index = 0; index < expression.length; index++) {
        NSRange range;
        range.location = index;
        range.length = 1;
        NSString *currentCharacter = [expression substringWithRange:range];
        if (isOpeningBracket(currentCharacter)) {
            [stack addObject:currentCharacter];
        }
        else {
            NSString *lastCharacter = stack.lastObject;
            [stack removeLastObject];
            if (!arePaired(lastCharacter, currentCharacter)) {
                return NO;
            }
        }
    }
    
    return stack.count == 0;
}

void printResult(BOOL result) {
    if (result) {
        printf("YES\n");
    }
    else {
        printf("NO\n");
    }
}

int main(int argc, const char * argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int t;
    scanf("%i",&t);
    for(int a0 = 0; a0 < t; a0++){
        NSString* expression;
        char* expression_temp = (char *)malloc(512000 * sizeof(char));
        scanf("%s",expression_temp);
        expression = [NSString stringWithFormat:@"%s", expression_temp];
        printResult(isBalanced(expression));
    }
    [pool drain];
    return 0;
}

