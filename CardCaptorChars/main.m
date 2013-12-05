//
//  main.c
//  CardCaptorChars
//
//  Created by Oscar Calles on 12/5/13.
//  Copyright (c) 2013 ocalles@gmail.com. All rights reserved.
// http://www.andyibanez.com/74-key-value-coding-key-value-observing-and-cocoa-bindings-a-basic-tutorial

#include <stdio.h>
#import <Foundation/Foundation.h>
#import "Character.h"




int main()
{
    Character *player1;
    Character *player2;
    
    
    //Create and give the properties some values with KVC...
    player1 = [[Character alloc] init];
    [player1 setValue:@"Sakura Kinomoto" forKey:@"characterName"];
    [player1 setValue:[NSNumber numberWithInt:20] forKey:@"ownedClowCards"];
    
    player2 = [[Character alloc] init];
    [player2 setValue:@"Li Shaoran" forKey:@"characterName"];
    [player2 setValue:[NSNumber numberWithInt:21] forKey:@"ownedClowCards"];
    
    
    [player1 addObserver:player1 forKeyPath:@"ownedClowCards" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

    
    
    //Done! Now we are going to fetch the values using KVC.
    
    NSString *mainCharacter = [player1 valueForKey:@"characterName"];
    NSNumber *mainCharCards = [player1 valueForKey:@"ownedClowCards"];
    
    NSString *rival = [player2 valueForKey:@"characterName"];
    NSNumber *rivalCards = [player2 valueForKey:@"ownedClowCards"];
    
    NSLog(@"%@ has %d Clow Cards", mainCharacter, [mainCharCards intValue]);
    NSLog(@"%@ has %d Clow Cards", rival, [rivalCards intValue]);
    
    
    
    
    [player1 removeObserver:player1 forKeyPath:@"ownedClowCards"];
    
}

