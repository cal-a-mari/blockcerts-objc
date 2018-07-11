//
//  CertificateDetailViewController.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 6/30/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "CertificateDetailViewController.h"
#import "CertificateDetailTableViewCell.h"

@implementation CertificateDetailViewController

Certificate *_certificate;

-(instancetype)initWithCertificate:(Certificate *)certificate {
    self = [super initWithNibName:@"CertificateDetailViewController"
                           bundle:nil];
    if (self) {
        _certificate = certificate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CertificateDetailTableViewCell class]
           forCellReuseIdentifier:[CertificateDetailTableViewCell cellIdentifier]];
    self.navigationItem.title = _certificate.title;
    self.imageView.image = _certificate.image;
    [self.tableView reloadData];
    [self.tableView setAllowsSelection:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CertificateDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CertificateDetailTableViewCell cellIdentifier]
                                                                     forIndexPath:indexPath];

    if (indexPath.row == 0) {
        cell.textLabel.text = @"Title";
        cell.detailTextLabel.text = _certificate.title;
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"Subtitle";
        cell.detailTextLabel.text = _certificate.subtitle;
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"Description";
        cell.detailTextLabel.text = _certificate.certificateDescription;
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"Issuer";
        cell.detailTextLabel.text = _certificate.issuer.name;
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"Share URL";
        cell.detailTextLabel.text = _certificate.shareURL.absoluteString;
    }
    
    return cell;
}

@end
