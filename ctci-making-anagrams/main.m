// Solve problem Strings: Making Anagrams
// https://www.hackerrank.com/challenges/ctci-making-anagrams

#import <Foundation/Foundation.h>

void countCharacterOccurrenceInString(NSString * str, NSMutableDictionary *savingIn, NSInteger multiplier) {
    for (NSUInteger i = 0; i < str.length; i++) {
        NSRange range;
        range.location = i;
        range.length = 1;
        NSString *character = [str substringWithRange:range];
        NSInteger current = [savingIn[character] integerValue];
        savingIn[character] = @(multiplier*1 + current);
    }
}

NSUInteger absoluteSumOfElementsInDictionary(NSDictionary *dictionary) {
    NSUInteger total = 0;
    for (NSString *key in dictionary.allKeys) {
        total += labs([dictionary[key] integerValue]);
    }
    
    return total;
}

NSUInteger numberOfCharacterToRemoveToCreateAnagram(NSString *str1, NSString *str2) {
    NSMutableDictionary *characterCount = [[NSMutableDictionary alloc] init];
    countCharacterOccurrenceInString(str1, characterCount, 1);
    countCharacterOccurrenceInString(str2, characterCount, -1);
    
    return absoluteSumOfElementsInDictionary(characterCount);
}

int main(int argc, const char * argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* a;
    char* a_temp = (char *)malloc(512000 * sizeof(char));
    scanf("%s",a_temp);
    a = [NSString stringWithFormat:@"%s", a_temp];
    NSString* b;
    char* b_temp = (char *)malloc(512000 * sizeof(char));
    scanf("%s",b_temp);
    b = [NSString stringWithFormat:@"%s", b_temp];
    
    int numberOfCharactersToAnagram = numberOfCharacterToRemoveToCreateAnagram(a, b);
    printf("%ld", (long)numberOfCharactersToAnagram);
    
    [pool drain];
    return 0;
}
