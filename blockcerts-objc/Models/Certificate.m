//
//  Certificate.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 6/30/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "Certificate.h"

@implementation Certificate

+(instancetype)initWithData:(NSDictionary *)data error:(NSError *)error {
  return [[Certificate alloc] initWithData:data error:error];
}

-(instancetype)initWithData:(NSDictionary *)data error:(NSError *)error {
  self = [super init];
  if (self == nil) { return nil; }
  
  NSString *type = [data valueForKey:@"type"];
  
  if (![type isEqual: @"Assertion"]) { return nil; }
  
  NSDictionary *certificateData = [data valueForKey:@"badge"];
  
  if (certificateData == nil) { return nil; }
  
  V2Issuer *issuer = [V2Issuer initWithIssuerData:[certificateData valueForKey:@"issuer"] error:error];
  
  if (issuer == nil) { return nil; }
  
  Recipient *recipient = [Recipient initWithData:data error:error];
  
  if (recipient == nil) { return nil; }
  
  Assertion *assertion = [Assertion initWithData:data error:error];
  
  if (assertion == nil) { return nil; }
  
  Verification *verification = [Verification initWithData:[data valueForKey:@"verification"]];
  
  if (verification == nil) { return nil; }
  
  Receipt *receipt = [Receipt initWithData:[data valueForKey:@"signature"]];
  
  if (receipt == nil) { return nil; }
  
  NSString *title = [certificateData valueForKey:@"name"];
  NSString *description = [certificateData valueForKey:@"description"];
  NSString *subtitle = [certificateData valueForKey:@"subtitle"];
  NSString *certificateIDString = [certificateData valueForKey:@"id"];
  NSURL *shareURL = [[NSURL alloc] initWithString:certificateIDString];
  NSURL *certificateImageURL = [NSURL URLWithString:[certificateData valueForKey:@"image"]];
  NSData *imageData = [NSData dataWithContentsOfURL:certificateImageURL];
  UIImage *logo = [[UIImage alloc] initWithData:imageData];
  
  if (title == nil ||
      recipient == nil ||
      description == nil ||
      certificateIDString == nil ||
      shareURL == nil ||
      certificateImageURL == nil ||
      imageData == nil) { return nil; }
  
  _title = title;
  _certificateDescription = description;
  _subtitle = subtitle;
  _certificateIDString = certificateIDString;
  _shareURL = shareURL;
  _image = logo;
  _issuer = issuer;
  _recipient = recipient;
  _verification = verification;
  _receipt = receipt;
  _assertion = assertion;
  
  return self;
}

@end
