#import <Foundation/Foundation.h>
#import "Fruit.h"

@interface Apple :  NSObject <Fruit>
@property NSNumber *seed;
@property FruitColor currentColor;
-(BOOL) drop;
-(void) grow;
-(id) initWithSeedCount: (NSNumber *) seedCount;

@end