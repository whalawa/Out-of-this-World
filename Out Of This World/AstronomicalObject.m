//
//  AstronomicalObject.m
//  Out Of This World
//
//  Created by Teddy Wyly on 9/13/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import "AstronomicalObject.h"

@implementation AstronomicalObject

- (id)initWithInfo:(NSDictionary *)info andImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.astronomicalInformation = info;
        self.image = image;
    }
    return self;
}

@end
