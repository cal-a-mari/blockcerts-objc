//
//  Verification.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/9/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Verification : NSObject

@property (nullable, nonatomic, copy, readonly) NSString *publicKey;
@property (nonnull, nonatomic, copy, readonly) NSString *signingMethod;

+(instancetype) initWithPublicKey:(NSString *)publicKey signingMethod:(NSString *) signingMethod;
+(instancetype) initWithData:(NSDictionary *)data;

@end
