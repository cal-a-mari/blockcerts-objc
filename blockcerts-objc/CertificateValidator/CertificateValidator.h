//
//  CertificateValidator.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/8/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Certificate.h"

@interface CertificateValidator : NSObject

+(BOOL) certificateIsValid:(Certificate *)certificate error:(NSError *)error;

@end
