// Solution to problem Queues: A Tale of Two Stacks
// https://www.hackerrank.com/challenges/ctci-queue-using-two-stacks

#import <Foundation/Foundation.h>

@interface Queue: NSObject
@property (nonatomic, readonly) NSMutableArray *queue;

- (void)enqueue:(NSInteger)value;
- (NSInteger)dequeue;
- (void)printHead;
@end

@implementation Queue
- (instancetype)init
{
    self = [super init];
    if (self) {
        _queue = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)enqueue:(NSInteger)value
{
    [self.queue addObject:@(value)];
}

- (NSInteger)dequeue
{
    if (self.queue.count == 0) {
        return 0;
    }
    
    NSNumber *number = self.queue.firstObject;
    [self.queue removeObjectAtIndex:0];
    
    return number.integerValue;
}

- (void)printHead
{
    if (self.queue.count == 0) {
        return;
    }
    
    NSNumber *number = self.queue.firstObject;
    printf("%ld\n", (long)number.integerValue);
}
@end

int main(int argc, const char * argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int n;
    scanf("%i", &n);
    // ideally we should load commands from the console and create a
    // queue with all commands but running from this site the last 
    // input is loaded repeatly
    /*Queue *commands = [[Queue alloc] init];
    while (n != EOF) {
        scanf("%i", &n);
        [commands enqueue:n];
    }*/
    Queue *queue = [[Queue alloc] init];
    for (int i = 0; i < n; i++) {
        int command;
        scanf("%i", &command);
        switch(command) {
            case 1: {
                int value;
                scanf("%i", &value);
                [queue enqueue:value];
            }
                break;
            case 2: 
                [queue dequeue];
                break;
            default:
                [queue printHead];
                break;
        }
    }

    [pool drain];
    return 0;
}
