//
//  CustomAnnotationView.m
//  GaoDeMap
//
//  Created by Mamba on 2017/12/25.
//  Copyright © 2017年 HZGeenk. All rights reserved.
//

#import "CustomAnnotationView.h"


#define kWidth  150.f
#define kHeight 60.f

#define kHoriMargin 5.f
#define kVertMargin 5.f

#define kPortraitWidth  50.f
#define kPortraitHeight 50.f

#define kCalloutWidth   200.0 //弹框宽
#define kCalloutHeight  70.0//弹框高

@interface CustomAnnotationView ()


@end

@implementation CustomAnnotationView

@synthesize calloutView;

//@synthesize portraitImageView   = _portraitImageView;
//@synthesize nameLabel           = _nameLabel;


#pragma mark - Handle Action

//- (void)btnAction
//{
//    CLLocationCoordinate2D coorinate = [self.annotation coordinate];
//
//    NSLog(@"coordinate = {%f, %f}", coorinate.latitude, coorinate.longitude);
//}

#pragma mark - Override
//- (NSString *)name
//{
//    return self.nameLabel.text;
//}
////
//- (void)setName:(NSString *)name
//{
//    self.nameLabel.text = name;
//}

//- (UIImage *)portrait
//{
//    return self.portraitImageView.image;
//}
//
//- (void)setPortrait:(UIImage *)portrait
//{
//    self.portraitImageView.image = portrait;
//}

- (void)setSelected:(BOOL)selected
{
    [self setSelected:selected animated:NO];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.selected == selected)
    {
        return;
    }
    
    if (selected)
    {
        if (self.calloutView == nil)
        {
            /* Construct custom callout. */
            self.calloutView = [[CustomCalloutView alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,-CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
            
            UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
            name.backgroundColor = [UIColor whiteColor];
            name.font = [UIFont systemFontOfSize:13];
            name.textColor = [UIColor blackColor];
            name.text = self.annotation.title;
            name.textAlignment = 1;
            name.numberOfLines = 0;
            name.layer.cornerRadius = 6;
            name.layer.masksToBounds = YES;
            [self.calloutView addSubview:name];
        }
        
        [self addSubview:self.calloutView];
    }
    else
    {
        [self.calloutView removeFromSuperview];
    }
    [super setSelected:selected animated:animated];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL inside = [super pointInside:point withEvent:event];
    /* Points that lie outside the receiver’s bounds are never reported as hits,
     even if they actually lie within one of the receiver’s subviews.
     This can occur if the current view’s clipsToBounds property is set to NO and the affected subview extends beyond the view’s bounds.
     */
    if (!inside && self.selected)
    {
        inside = [self.calloutView pointInside:[self convertPoint:point toView:self.calloutView] withEvent:event];
    }
    
    return inside;
}

#pragma mark - Life Cycle
//标记点
- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.bounds = CGRectMake(0.f, 0.f, 50, 50);
        
        self.backgroundColor = [UIColor clearColor];
        
        /* Create portrait image view and add to view hierarchy. */
        self.portraitImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.portraitImageView.image = [UIImage imageNamed:@"定位"];
        [self addSubview:self.portraitImageView];
        
        /* Create name label. */
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(12.5,5,25,25)];
        self.nameLabel.backgroundColor  = [UIColor whiteColor];
        self.nameLabel.textAlignment    = NSTextAlignmentCenter;
        self.nameLabel.textColor        = [UIColor blackColor];
        self.nameLabel.font             = [UIFont systemFontOfSize:15.f];
        self.nameLabel.layer.cornerRadius = 12.5;
        self.nameLabel.layer.masksToBounds = YES;
        [self addSubview:self.nameLabel];
    }
    
    return self;
}

@end
