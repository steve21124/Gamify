//
//  AAAAChievement.m
//  Gamify
//
//  Created by Håkon Bogen on 13.02.14.
//  Copyright (c) 2014 Haaakon Bogen. All rights reserved.
//

#import "AAAAchievement.h"

@implementation AAAAchievement
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.key forKey:@"key"];
    [aCoder encodeObject:self.titleText forKey:@"titleText"];
    [aCoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [aCoder encodeObject:self.image forKey:@"image"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _key = [aDecoder decodeObjectForKey:@"key"];
        _titleText = [aDecoder decodeObjectForKey:@"titleText"];
        _descriptionText = [aDecoder decodeObjectForKey:@"descriptionText"];
        _image = [aDecoder decodeObjectForKey:@"image"];
    }
    return self;
}

- (AAAAchievement *)initWithKey:(NSString *)key
                      titleText:(NSString *)titleText
                descriptionText:(NSString *)descriptionText
                          image:(UIImage *)image
{
    self = [super init];
    if (self) {
        _key = key;
        _titleText = titleText;
        _descriptionText = descriptionText;
        _image = image;
    }
    return self;
}

@end
