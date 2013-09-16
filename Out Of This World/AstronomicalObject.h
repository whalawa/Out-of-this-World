//
//  AstronomicalObject.h
//  Out Of This World
//
//  Created by Teddy Wyly on 9/13/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AstronomicalObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *image;
@property (nonatomic) NSUInteger diameter;
@property (nonatomic) NSUInteger lenghtOfYear;
@property (nonatomic) NSInteger temperature;
@property (nonatomic) NSUInteger numberOfMoons;
@property (strong, nonatomic) NSString *nickname;

- (id)initWithName:(NSString *)name andImage:(UIImage *)image;



@end
