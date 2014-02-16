//
//  AAAAChievement.m
//  Gamify
//
//  Created by Håkon Bogen on 13.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAAchievement.h"

@implementation AAAAchievement
- (AAAAchievement*)initWithKey:(NSString *)key titleText:(NSString*)titleText descriptionText:(NSString*)descriptionText image:(UIImage*)image{
    self = [super init];
    if (self ){
        _key = key;
        _titleText = titleText;
        _descriptionText = descriptionText;
        _image = image;
    }
    return self;
}
@end
