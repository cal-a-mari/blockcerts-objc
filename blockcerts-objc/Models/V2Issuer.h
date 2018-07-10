//
//  V2Issuer.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/8/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Issuer.h"

@interface V2Issuer : NSObject<Issuer>

+(nullable instancetype) initWithIssuerData:(NSDictionary *)data error:(NSError *)error;
-(instancetype) initWithName:(NSString *)name
                       email:(NSString *)email
                       image:(UIImage *)image
                       idURL:(NSURL *)idURL
                   issuerURL:(NSURL *)issuerURL
               revocationURL:(NSURL *)revocationURL;

@end
