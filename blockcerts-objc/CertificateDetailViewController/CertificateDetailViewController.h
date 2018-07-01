//
//  CertificateDetailViewController.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 6/30/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Certificate.h"

@interface CertificateDetailViewController : UIViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(instancetype)initWithCertificate:(Certificate *)certificate;

@end
