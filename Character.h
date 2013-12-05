//
//  Character.h
//  CardCaptorChars
//
//  Created by Oscar Calles on 12/5/13.
//  Copyright (c) 2013 ocalles@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject
{
    NSString *characterName;
    NSInteger ownedClowCards;
}
@property (nonatomic, copy) NSString *characterName;
@property NSInteger ownedClowCards;
-(void)hasLostClowCard;
-(void)hasGainedClowCard;
@end
