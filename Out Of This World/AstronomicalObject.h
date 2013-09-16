//
//  AstronomicalObject.h
//  Out Of This World
//
//  Created by Teddy Wyly on 9/13/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AstronomicalObject : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSDictionary *astronomicalInformation;


- (id)initWithInfo:(NSDictionary *)info andImage:(UIImage *)image;



@end
