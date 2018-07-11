//
//  Recipient.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/10/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "Recipient.h"

@implementation Recipient

+ (instancetype)initWithData:(NSDictionary *)data error:(NSError *)error {
  NSDictionary *recipientData = [data valueForKey:@"recipient"];
  NSDictionary *recipientProfileData = [data valueForKey:@"recipientProfile"];
  NSString *identityType = [recipientData valueForKey:@"type"];
  NSString *identity = [recipientData valueForKey:@"identity"];
  NSString *name = [recipientProfileData valueForKey:@"name"];
  NSString *publicKey = [recipientProfileData valueForKey:@"publicKey"];
  return [[Recipient alloc] initWithIdentity:identity
                                identityType:identityType
                                        name:name
                                   publicKey:publicKey];
}

- (instancetype)initWithIdentity:identity
                    identityType:(NSString *)identityType
                            name:(NSString *)name
                       publicKey:(NSString *)publicKey {
  if (self = [super init]) {
    _identity = identity;
    _identityType = identityType;
    _name = name;
    _publicKey = publicKey;
  }
  return self;
}

@end
