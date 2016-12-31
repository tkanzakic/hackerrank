// Solution to problem Queues: A Tale of Two Stacks
// https://www.hackerrank.com/challenges/ctci-queue-using-two-stacks

#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) Node *next;

- (instancetype)initWithValue:(NSInteger)value next:(Node *)next;
@end

@implementation Node
- (instancetype)initWithValue:(NSInteger)value next:(Node *)next
{
    self = [super init];
    if (self) {
        _value = value;
        _next = next;
    }

    return self;
}
@end

@interface Stack : NSObject
@property (nonatomic, strong) Node *head;

- (void)push:(NSInteger)value;
- (NSInteger)pop;
- (NSInteger)headValue;

- (BOOL)isEmpty;
@end

@implementation Stack

- (void)push:(NSInteger)value
{
    self.head = [[Node alloc] initWithValue:value next:self.head];
}

- (NSInteger)pop
{
    NSInteger value = self.head.value;
    self.head = self.head.next;

    return value;
}

- (NSInteger)headValue
{
    return self.head.value;
}

- (BOOL)isEmpty
{
    return !self.head;
}
@end

@interface Queue : NSObject
@property (nonatomic, strong) Stack *pushStack;
@property (nonatomic, strong) Stack *popStack;

- (void)enqueue:(NSInteger)value;
- (NSInteger)dequeue;
- (void)printHead;
@end

@implementation Queue
- (instancetype)init
{
    self = [super init];
    if (self) {
        _pushStack = [[Stack alloc] init];
        _popStack = [[Stack alloc] init];
    }

    return self;
}

- (void)fillPop
{
    while (!self.pushStack.isEmpty){
        [self.popStack push:self.pushStack.pop];
    }
}

- (void)enqueue:(NSInteger)value
{
    [self.pushStack push:value];
}

- (NSInteger)dequeue
{
    if (self.popStack.isEmpty) {
        [self fillPop];
    }

    return self.popStack.pop;
}

- (void)printHead
{
    if (self.popStack.isEmpty) {
        [self fillPop];
    }
    printf("%ld\n", (long)self.popStack.headValue);
}
@end

int main(int argc, const char * argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int n;
    scanf("%i", &n);
    
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
