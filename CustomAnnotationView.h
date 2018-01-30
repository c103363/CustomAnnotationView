//
//  CustomAnnotationView.h
//  GaoDeMap
//
//  Created by Mamba on 2017/12/25.
//  Copyright © 2017年 HZGeenk. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "CustomCalloutView.h"

@interface CustomAnnotationView : MAAnnotationView

//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, strong) UIImage *portrait;

@property (nonatomic, strong) CustomCalloutView *calloutView;
@property (nonatomic, strong) UIImageView *portraitImageView;
@property (nonatomic, strong) UILabel *nameLabel;


@end
