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
        NSLog(@"Leaf was droped");
        return true;
    }
    return false;
}
-(void) addLeaf:(Leaf *)leaf
{
    [[self arrayOfLeaf] addObject: leaf];
    NSLog(@"Leaf was added");
}
-(void) addApple:(Apple *)apple
{
    [[self arrayOfApple] addObject: apple];
    NSLog(@"Apple was added");
}
-(void) grow
{
    int countAddApple = arc4random()%6;
    int countAddLeaf = arc4random()%6;
    
    for(int i = 0; i < countAddApple; ++i)
    {
        [[self arrayOfApple] addObject: [[Apple alloc] initWithSeedCount:
                                         [[NSNumber alloc] initWithInt: arc4random()%10]]];
    }
    
    for(int i = 0; i < countAddLeaf; ++i)
    {
        [[self arrayOfLeaf] addObject: [[Leaf alloc] init]];
    }
    NSLog(@"AppleTree grew");
    
}
-(void) shake
{
    int countDropApple = arc4random()%6;
    int countDropLeaf = arc4random()%6;
    NSUInteger countAppleInArray = [[self arrayOfApple] count];
    NSUInteger countLeafInArray = [[self arrayOfLeaf] count];
    
    for(int i = 0; i < countDropApple && i < countAppleInArray; ++i)
    {
        [[[self arrayOfApple] lastObject] drop];
        [[self arrayOfApple] removeLastObject];
    }
    
    for(int i = 0; i < countDropLeaf && i < countLeafInArray; ++i)
    {
        [[[self arrayOfLeaf] lastObject] drop];
        [[self arrayOfLeaf] removeLastObject];
    }
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