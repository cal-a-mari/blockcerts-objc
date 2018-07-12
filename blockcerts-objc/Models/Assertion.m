//
//  Assertion.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/9/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "Assertion.h"

@interface Assertion()



@end

@implementation Assertion

+(nullable instancetype) initWithData:(NSDictionary *)data error:(NSError *)error {
  return [[Assertion alloc] initWithData:data error:error];
}

-(instancetype) initWithData:(NSDictionary *)data error:(NSError *)error {
  self = [super init];
  if (self) {
    NSString *assertionID = [data valueForKey:@"id"];
    _assertionID = assertionID;
    _assertionIDURL = [NSURL URLWithString:assertionID];
    
    NSISO8601DateFormatter *isoDateFormatter = [[NSISO8601DateFormatter alloc] init];
    NSString *issuedOnDateString = [data valueForKey:@"issuedOn"];
    NSDate *issuedOn = [isoDateFormatter dateFromString:issuedOnDateString];
    NSArray<NSString *> *isoFormats = @[@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
                                        @"yyyy-MM-dd'T'HH:mm:ss.SSS",
                                        @"yyyy-MM-dd"];
    
    if (issuedOn == nil) {
      NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
      for (NSString *format in isoFormats) {
        dateFormatter.dateFormat = format;
        issuedOn = [dateFormatter dateFromString:issuedOnDateString];
        if (issuedOn != nil) { break; }
      }
    }
    
    _issuedOn = issuedOn;
  }
  return self;
}

@end
