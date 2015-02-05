#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    
    // Increment the time since the last obstacle was added
    timeSinceObstacle += delta;
    
    if (timeSinceObstacle > 2.0f) {
        
        [self addObstacle];
        
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    [character flap];
}

@end
