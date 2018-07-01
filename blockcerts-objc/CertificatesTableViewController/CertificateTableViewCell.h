//
//  CertificateTableViewCell.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 6/30/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CertificateTableViewCell : UITableViewCell

+ (NSString *)cellIdentifier;

@property (weak, nonatomic) IBOutlet UIImageView *certificateImageView;
@property (weak, nonatomic) IBOutlet UIStackView *labelStackView;
@property (weak, nonatomic) IBOutlet UILabel *issuerLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
