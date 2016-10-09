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
    
Queue *loadCommands(int count) {
    Queue *commands = [[Queue alloc] init];
    for (int i = 0; i < count; i++) {
        int cmd;
        scanf("%i", &cmd);
        [commands enqueue:cmd];
        if (cmd == 1) {
            scanf("%i", &cmd);
            [commands enqueue:cmd];
        }
    }
    
    return commands;
}

void runCommands(Queue *commands) {
    Queue *queue = [[Queue alloc] init];
    while (commands.queue.count > 0) {
        NSInteger command = [commands dequeue];
        switch(command) {
            case 1: {
                NSInteger value = [commands dequeue];
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
}

int main(int argc, const char * argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int n;
    scanf("%i", &n);
    
    Queue *commands = loadCommands(n);
    runCommands(commands);

    [pool drain];
    return 0;
}
