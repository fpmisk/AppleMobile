#import "Apple.h"

@implementation Apple

@synthesize seed = _seed;
@synthesize currentColor = _currentColor;
@synthesize isHang = _isHang;

-(BOOL) drop {
    
    if ([self isHang] == true) {
        [self setIsHang:false];
        NSLog(@"Apple drop from tree");
    }
    return [self isHang];
}

-(void) grow {
    if([self currentColor] == fruitOfRed){
        NSLog(@"Apple is red");
    }
    else if([self currentColor] == fruitOfGreen){
        [self setCurrentColor: (FruitColor) fruitOfYellow];
        NSLog(@"Apple is yellow");
    }
    else if([self currentColor] == fruitOfYellow){
        [self setCurrentColor: (FruitColor) fruitOfRed];
        NSLog(@"Apple is red");
    }
}
-(id) initWithSeedCount: (NSNumber *) seedCount{
    
    self = [super init];
    if(self)
    {
        [self setCurrentColor: (FruitColor) fruitOfGreen];
        [self setSeed: seedCount];
        [self setIsHang: true];
        NSLog(@"Apple was created");
    }
    return self;
}
@end