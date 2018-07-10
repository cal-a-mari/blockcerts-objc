//
//  V2Issuer.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/8/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "V2Issuer.h"

@implementation V2Issuer

@synthesize email;
@synthesize idURL;
@synthesize image;
@synthesize issuerURL;
@synthesize name;
@synthesize revocationURL;

+(nullable instancetype) initWithIssuerData:(NSDictionary *)data
                                      error:(NSError *)error {
    return [self parseFromData:data error:error];
}

+(nullable V2Issuer *) parseFromData:(NSDictionary *)data error:(NSError *)error {
    NSString *issuerURLString = [data valueForKey:@"url"];
    NSURL *issuerURL = [NSURL URLWithString:issuerURLString];
    NSString *logoURI = [data valueForKey:@"image"];
    NSURL *logoURL = [NSURL URLWithString:logoURI];
    NSData *imageData = [NSData dataWithContentsOfURL:logoURL];
    UIImage *logoImage = [UIImage imageWithData:imageData];
    NSString *email = [data valueForKey:@"email"];
    NSString *name = [data valueForKey:@"name"];
    NSString *issuerID = [data valueForKey:@"id"];
    NSURL *issuerIDURL = [NSURL URLWithString:issuerID];
    
    if (issuerURL == nil ||
        logoImage == nil ||
        email == nil ||
        name == nil ||
        issuerIDURL == nil) {
        // return error
        return nil;
    }
    
    NSString *revocationURLString = [data valueForKey:@"revocationList"];
    NSURL *revocationURL = [NSURL URLWithString:revocationURLString];
    
    return [[V2Issuer alloc] initWithName:name
                                    email:email
                                    image:logoImage
                                    idURL:issuerIDURL
                                issuerURL:issuerURL
                            revocationURL: revocationURL];
}

-(instancetype) initWithName:(NSString *)name
                       email:(NSString *)email
                       image:(UIImage *)image
                       idURL:(NSURL *)idURL
                   issuerURL:(NSURL *)issuerURL
               revocationURL:(NSURL *)revocationURL {
    self = [super init];
    if (self) {
        [self setName:name];
        [self setEmail:email];
        [self setImage:image];
        [self setIdURL:idURL];
        [self setIssuerURL:issuerURL];
        [self setRevocationURL:revocationURL];
    }
    return self;
}

@end
