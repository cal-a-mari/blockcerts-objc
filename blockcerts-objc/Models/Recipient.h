//
//  Recipient.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/10/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipient : NSObject

@property (nonatomic, nonnull, copy) NSString *identity;
@property (nonatomic, nonnull, copy) NSString *identityType;
@property (nonatomic, nonnull, copy) NSString *name;
@property (nonatomic, nonnull, copy) NSString *publicKey;
@property (nonatomic) BOOL isHashed;

+ (instancetype)initWithData:(NSDictionary *)data error:(NSError *)error;

@end
