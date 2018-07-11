//
//  Certificate.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 6/30/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "V2Issuer.h"
#import "Assertion.h"
#import "Verification.h"
#import "Receipt.h"
#import "Recipient.h"

@interface Certificate : NSObject

@property (nonatomic, copy, nonnull) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;
@property (nonatomic, copy, nonnull) NSString *certificateDescription;
@property (nonatomic, copy, nonnull) NSString *certificateIDString;
@property (nonatomic, copy, nullable) UIImage *image;
@property (nonatomic, copy, nonnull) NSString *language;
@property (nonatomic, copy, nonnull) NSURL *shareURL;
//@property (nonatomic, copy, nonnull) NSString *issuer;
@property (nonatomic, copy, nonnull) V2Issuer *issuer;
@property (nonatomic, copy, nonnull) Recipient *recipient;
@property (nonatomic, copy, nonnull) Assertion *assertion;
@property (nonatomic, copy, nonnull) Verification *verification;
@property (nonatomic, copy, nonnull) Receipt *receipt;

+(instancetype)initWithData:(NSDictionary *)data error:(NSError *)error;

@end
