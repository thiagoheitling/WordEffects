//
//  main.m
//  WordEffects
//
//  Created by Thiago Heitling on 2016-01-11.
//  Copyright © 2016 Thiago Heitling. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
        
        int infinitLoop = true;
        NSString *instructions = @"What would you like to do:\n 1. Uppercase\n 2. Lowercase \n 3. Numberize \n 4. Canadianize \n 5. Respond \n 6. De-Space-it\n 7. Word count\n";
        
        while (infinitLoop == true) {
            NSLog(@"%@", instructions);
            
            char inputNumber[255];
            printf("Input your number option: ");
            fgets(inputNumber, 255, stdin);
            NSString *inputOption = [NSString stringWithUTF8String:inputNumber];
            inputOption = [inputOption stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            
            NSMutableString *mutableInputOption = [inputOption mutableCopy]; // converting mutable/unmutable
            
            char inputChars[255];
            printf("Input a string: ");
            fgets(inputChars, 255, stdin);
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            
            NSMutableString *mutableInputString = [inputString mutableCopy]; // converting mutable/unmutable
            
            //1. Uppercase
            if ([inputOption isEqualToString:@"1"]) {
                NSLog(@"1. Uppercase is: %@", [inputString uppercaseString]);
            }
            
            //2. Lowecase
            if ([inputOption isEqualToString:@"2"]) {
                NSLog(@"2. Lowercase is: %@", [inputString lowercaseString]);
            }
            
            //3. Numberize
            if ([inputOption isEqualToString:@"3"]) {
                NSNumberFormatter *input = [[NSNumberFormatter alloc] init];
                input.numberStyle = NSNumberFormatterDecimalStyle;
                NSString *removeNewLine = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                NSNumber *myNumber = [input numberFromString:removeNewLine];
                if(myNumber != NULL) {
                    NSLog(@"3. Numberize string: %@", myNumber);
                }
                else {
                    NSLog(@"3. Numberize string: Sorry, cannot convert a letters into a number object");
                }
                
                NSMutableString *mutableRemoveNewLine = [removeNewLine mutableCopy]; // converting mutable/unmutable
            }
            //4. Canadianize
            if ([inputOption isEqualToString:@"4"]) {
                inputString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                NSString *canadianize = [inputString stringByAppendingString:@", eh?"];
                NSLog(@"4. Canadianize format: %@", canadianize);
                
                NSMutableString *mutableCanadianize = [canadianize mutableCopy]; // converting mutable/unmutable
            }
            
            //5. Respond
            if ([inputOption isEqualToString:@"5"]) {
                inputString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                if ([inputString hasSuffix:@"?"]) {
                    NSLog(@"5. Respond: I don't know.");
                };
                if ([inputString hasSuffix:@"!"]) {
                    NSLog(@"5. Respond: Whoa, calm down!");
                }
            }
            
            //6. De-Space-It
            if ([inputOption isEqualToString:@"6"]) {
                NSString *deSpaceIt = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
                NSLog(@"6. De-spacing-it: %@", deSpaceIt);
                
                NSMutableString *mutableDeSpaceIt = [deSpaceIt mutableCopy]; // converting mutable/unmutable
            }
            
            //7. Word count
            if ([inputOption isEqualToString:@"7"]) {
                NSUInteger times = [[inputString componentsSeparatedByString:@" "] count];
                NSLog(@"7. Number of words: %lu", times);
            }
        }
    }
    return 0;
}
