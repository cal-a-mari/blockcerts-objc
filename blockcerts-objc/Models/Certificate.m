//
//  Certificate.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 6/30/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "Certificate.h"

@implementation Certificate

-(instancetype)initWithData:(NSData *)data {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title
                    subtitle:(NSString *)subtitle
                 description:(NSString *) description
                       image:(UIImage *)image
                    language:(NSString *)language
                    shareURL:(NSURL *)shareURL
                      issuer:(NSString *)issuer {
    self = [super init];
    if (self) {
        self.title = title;
        self.subtitle = subtitle;
        self.certificateDescription = description;
        self.image = image;
        self.language = language;
        self.shareURL = shareURL;
        self.issuer = issuer;
    }
    return self;
}

@end
