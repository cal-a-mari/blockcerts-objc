//
//  Issuer.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/8/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol Issuer <NSObject>

@required

@property (nonatomic, nonnull, copy) NSString *name;
@property (nonatomic, nonnull, copy) NSString *email;
@property (nonatomic, nonnull) UIImage *image;
@property (nonatomic, nonnull, copy) NSURL *idURL;
@property (nonatomic, nonnull, copy) NSURL *issuerURL;
//@property (nonatomic, nonnull, copy) NSArray<NSString *> *publicKeys;

@optional

@property (nonatomic, nonnull, copy) NSURL *revocationURL;

@end
