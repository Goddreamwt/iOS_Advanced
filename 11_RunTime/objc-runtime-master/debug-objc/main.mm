
//  main.m
//  debug-objc
//
//
//

#import <Foundation/Foundation.h>
#import "Person.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person* p = [Person new];
        
        id __weak p1;
        {
            NSLog(@"000");
            p1 = p;
            NSLog(@"111");
            NSLog(@"%p, p = %p", &p1, &p);
        }
        NSLog(@"222");
    }
    return 0;
}
