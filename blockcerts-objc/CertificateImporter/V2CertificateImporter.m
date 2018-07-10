//
//  V2CertificateImporter.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/8/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "V2CertificateImporter.h"
#import "V2Issuer.h"
#import "Assertion.h"
#import "Verification.h"
#import "Receipt.h"

@implementation V2CertificateImporter

+(Certificate *) importFromData:(NSData *)data error:(NSError *)error {
    return [self parseFromData:data error:error];
}

+(void) importFromURL:(NSURL *)url completion:(void (^) (Certificate *certificate, NSError *error))completion {
    NSURLSession *session = [NSURLSession
                             sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error != nil) {
                completion(nil, error);
            } else {
                Certificate *certificate = [self parseFromData:data error:error];
                completion(certificate, error);
            }
        });
    }];
    [dataTask resume];
}

+(Certificate *) parseFromData:(NSData *)data error:(NSError *)error {
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                               options:0
                                                                 error:&error];
    if (error != nil) { return nil; }
    return [Certificate initWithData:dictionary error:error];
}



@end
