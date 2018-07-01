//
//  Certificate.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 6/30/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Certificate : NSObject

@property (nonatomic, copy, nonnull) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;
@property (nonatomic, copy, nonnull) NSString *certificateDescription;
@property (nonatomic, copy, nullable) UIImage *image;
@property (nonatomic, copy, nonnull) NSString *language;
@property (nonatomic, copy, nonnull) NSURL *shareURL;
@property (nonatomic, copy, nonnull) NSString *issuer;

-(instancetype)initWithData:(NSData *)data;
-(instancetype)initWithTitle:(NSString *)title
                    subtitle:(NSString *)subtitle
                 description:(NSString *) description
                       image:(UIImage *)image
                    language:(NSString *)language
                    shareURL:(NSURL *)shareURL
                      issuer:(NSString *)issuer;

@end
