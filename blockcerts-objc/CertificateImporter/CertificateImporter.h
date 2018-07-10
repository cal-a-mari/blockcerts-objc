//
//  CertificateImporter.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/8/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Certificate.h"

@protocol CertificateImporter

/// Attempt importing a certificate from local data storage
+(Certificate *) importFromData:(NSData *)data error:(NSError *)error;
/// Attempt importing a certificate from a specified URL
+(void) importFromURL:(NSURL *)url completion:(void (^) (Certificate *certificate, NSError *error))completion;

@end
