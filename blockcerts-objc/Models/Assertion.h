//
//  Assertion.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/9/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Assertion : NSObject

@property (nonatomic, readonly, copy) NSDate *issuedOn;
@property (nonatomic, readonly, copy) NSString *assertionID;
@property (nonatomic, readonly, copy) NSURL *assertionIDURL;

+(nullable instancetype) initWithData:(NSDictionary *)data error:(NSError *)error;

@end
