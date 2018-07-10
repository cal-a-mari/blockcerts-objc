//
//  Verification.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/9/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "Verification.h"

@implementation Verification

+(instancetype) initWithPublicKey:(NSString *)publicKey
                    signingMethod:(NSString *) signingMethod {
    return [[Verification alloc] initWithPublicKey:publicKey signingMethod:signingMethod];
}

+(instancetype) initWithData:(NSDictionary *)data {
    NSString *publicKey = [data valueForKey:@"publicKey"];
    NSArray<NSString *> *signingMethods = [data valueForKey:@"type"];
    NSString *signingMethod = signingMethods[0];
    return [[Verification alloc] initWithPublicKey:publicKey signingMethod:signingMethod];
}

-(instancetype) initWithPublicKey:(NSString *)publicKey
                    signingMethod:(NSString *)signingMethod {
    self = [super init];
    if (self) {
        _publicKey = publicKey;
        _signingMethod = signingMethod;
    }
    return self;
}

@end
