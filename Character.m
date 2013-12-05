//
//  Character.m
//  CardCaptorChars
//
//  Created by Oscar Calles on 12/5/13.
//  Copyright (c) 2013 ocalles@gmail.com. All rights reserved.
//

#import "Character.h"

@implementation Character
@synthesize characterName;
@synthesize ownedClowCards;

-(void)hasLostClowCard
{
    [self removeObserver:self forKeyPath:@"ownedClowCards"];
}

-(void)hasGainedClowCard
{
   NSLog(@"%@ has earned a card! Cards now: %ld", characterName, ownedClowCards);
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject
                             :(id)object change
                             :(NSDictionary *)change context
                             :(void *)context
{
    if([keyPath isEqualToString:@"ownedClowCards"])
    {
        NSInteger oldC = [[change objectForKey:NSKeyValueChangeOldKey] integerValue];
        NSInteger newC = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        if(oldC < newC)
        {
            [self hasGainedClowCard];
        }else
        {
            [self hasLostClowCard];
        }
    }
}



@end
