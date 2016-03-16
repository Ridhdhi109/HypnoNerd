//
//  RDHypnosisView.m
//  RDHypnosister
//
//  Created by Ridhdhi Desai on 3/12/16.
//  Copyright © 2016 Ridhdhi Desai. All rights reserved.
//

#import "RDHypnosisView.h"

@interface RDHypnosisView ()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation RDHypnosisView

- (instancetype) initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  //figure out the center of the bound rectangle
    CGRect bounds = self.bounds;
    CGPoint center ;
    
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    
    //the circle will be the s that will fit in the view both portrain and landscape
    
    //float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
    
    //the largest circle will circulscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    //Add and arc to the path at center, with radius of radius
    //from 0 to 2*PI radians (a circle)
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    path.lineWidth = 10;
    
    //Configure the drawing color to light array
    
    [self.circleColor setStroke];
    
    //Draw the line!
    [path stroke];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@ "%@ was touched", self);
    
    //Get three random numbers between 0 to 1
    
    float red = (arc4random() % 100) / 100.0;
    float green =  (arc4random() % 100)/ 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.circleColor = randomColor;
}

-(void) setCircleColor:(UIColor *)circleColor {

    _circleColor = circleColor;
    [self setNeedsDisplay];
}

@end
