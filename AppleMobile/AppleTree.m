#import "AppleTree.h"

@implementation AppleTree

@synthesize arrayOfApple = _arrayOfApple;
@synthesize arrayOfLeaf = _arrayOfLeaf;
@synthesize age = _age;
@synthesize countOfApple = _countOfApple;
@synthesize countOfLeaf = _countOfLeaf;

-(bool) dropApple: (Apple *) apple
{
    NSUInteger indexObjectInArray = [[self arrayOfApple] indexOfObject:apple];
    if(indexObjectInArray != NSNotFound)
    {
        [[[self arrayOfApple] objectAtIndex:indexObjectInArray] drop];
        [[self arrayOfApple] removeObject:apple];
        int count = [[self countOfApple] intValue] - 1;
        [self setCountOfApple:[[NSNumber alloc] initWithInt:count]];
        NSLog(@"Apple was droped");
        return true;
    }
    return false;
}
-(bool) dropLeaf: (Leaf *) leaf
{
    NSUInteger indexObjectInArray = [[self arrayOfLeaf] indexOfObject: leaf];
    if(indexObjectInArray != NSNotFound)
    {
        [[[self arrayOfLeaf] objectAtIndex:indexObjectInArray] drop];
        [[self arrayOfLeaf] removeObject: leaf];
        int count = [[self countOfLeaf] intValue] + 1;
        [self setCountOfLeaf:[[NSNumber alloc] initWithInt:count]];
        NSLog(@"Leaf was droped");
        return true;
    }
    return false;
}
-(void) addLeaf:(Leaf *)leaf
{
    [[self arrayOfLeaf] addObject: leaf];
    int count = [[self countOfLeaf] intValue] + 1;
    [self setCountOfLeaf:[[NSNumber alloc] initWithInt:count]];
    NSLog(@"Leaf was added");
}
-(void) addApple:(Apple *)apple
{
    [[self arrayOfApple] addObject: apple];
    int count = [[self countOfApple] intValue] + 1;
    [self setCountOfApple:[[NSNumber alloc] initWithInt:count]];
    NSLog(@"Apple was added");
}
-(void) grow
{
    int countAddApple = arc4random()%6 + 1;
    int countAddLeaf = arc4random()%6 + 1;
    
    for(int i = 0; i < countAddApple; ++i)
    {
        [[self arrayOfApple] addObject: [[Apple alloc] initWithSeedCount:
                                         [[NSNumber alloc] initWithInt: arc4random()%10]]];
    }
    
    for(int i = 0; i < countAddLeaf; ++i)
    {
        [[self arrayOfLeaf] addObject: [[Leaf alloc] init]];
    }
    int count = [[self countOfLeaf] intValue] + countAddLeaf;
    [self setCountOfLeaf:[[NSNumber alloc] initWithInt:count]];
    count = [[self countOfApple] intValue] + countAddApple;
    [self setCountOfApple:[[NSNumber alloc] initWithInt:count]];
    NSLog(@"AppleTree grew");
    
}
-(void) shake
{
    int countDropApple = arc4random()%6 + 1;
    int countDropLeaf = arc4random()%6 + 1;
    NSUInteger countAppleInArray = [[self arrayOfApple] count];
    NSUInteger countLeafInArray = [[self arrayOfLeaf] count];
    
    int i = 0;
    for(i = 0; i < countDropApple && i < countAppleInArray; ++i)
    {
        [[[self arrayOfApple] lastObject] drop];
        [[self arrayOfApple] removeLastObject];
    }
    int count = [[self countOfApple] intValue] - i;
    [self setCountOfApple:[[NSNumber alloc] initWithInt:count]];
    
    for(i = 0; i < countDropLeaf && i < countLeafInArray; ++i)
    {
        [[[self arrayOfLeaf] lastObject] drop];
        [[self arrayOfLeaf] removeLastObject];
    }
    count = [[self countOfLeaf] intValue] - i;
    [self setCountOfLeaf:[[NSNumber alloc] initWithInt:count]];
    NSLog(@"AppleTree was shaken");

}
-(id) initWithAge:(NSNumber *)age
{
    self = [super init];
    if(self)
    {
        [self setAge:age];
        NSMutableArray * temp = [[NSMutableArray alloc] init];
        [self setArrayOfApple:temp];
        temp = [[NSMutableArray alloc] init];
        [self setArrayOfLeaf:temp];
        NSLog(@"AppleTree was created");
    }
    return self;
}

@end
