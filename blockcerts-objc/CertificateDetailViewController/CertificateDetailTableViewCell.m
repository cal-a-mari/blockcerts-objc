//
//  CertificateDetailTableViewCell.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 6/30/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "CertificateDetailTableViewCell.h"

@implementation CertificateDetailTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:[CertificateDetailTableViewCell cellIdentifier]];
    return self;
}

+(NSString *) cellIdentifier {
    return @"CertificateDetailTableViewCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

@end
