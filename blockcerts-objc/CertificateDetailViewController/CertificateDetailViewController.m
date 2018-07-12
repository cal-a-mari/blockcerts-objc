//
//  CertificateDetailViewController.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 6/30/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "CertificateDetailViewController.h"
#import "CertificateDetailTableViewCell.h"

typedef NS_ENUM(NSInteger, RowSection)
{
  RowSectionDetails,
  RowSectionIssuer,
  RowSectionRecipient,
  RowSectionAssertion,
  RowSectionVerify
};

@implementation CertificateDetailViewController

Certificate *_certificate;

- (instancetype)initWithCertificate:(Certificate *)certificate {
  if (self = [super initWithNibName:@"CertificateDetailViewController"
                             bundle:nil]) {
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
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                            initWithTitle:@"Validate"
                                            style:UIBarButtonItemStylePlain
                                            target:self
                                            action:@selector(didTapValidateButton:)];
  self.imageView.image = _certificate.image;
  [self.tableView reloadData];
  [self.tableView setAllowsSelection:NO];
}

-(void)didTapValidateButton:(UIBarButtonItem *)sender {
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  switch (section) {
    case RowSectionDetails:
      return 3;
    case RowSectionIssuer:
      return 3;
    case RowSectionVerify:
      return 2;
    case RowSectionAssertion:
      return 3;
    case RowSectionRecipient:
      return 5;
  }
  return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 5;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  switch (section) {
    case RowSectionDetails:
      return @"Details";
    case RowSectionIssuer:
      return @"Issuer";
    case RowSectionVerify:
      return @"Verify";
    case RowSectionAssertion:
      return @"Assertion";
    case RowSectionRecipient:
      return @"Recipient";
  }
  return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  CertificateDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CertificateDetailTableViewCell cellIdentifier]
                                                                         forIndexPath:indexPath];
  RowSection section = (RowSection)indexPath.section;
  
  switch (section) {
    case RowSectionDetails:
      [self constructDetailCellForRow:indexPath.row cell:cell];
      break;
    case RowSectionIssuer:
      [self constructIssuerCellForRow:indexPath.row cell:cell];
      break;
    case RowSectionVerify:
      [self constructVerifyCellForRow:indexPath.row cell:cell];
      break;
    case RowSectionAssertion:
      [self constructAssertionCellForRow:indexPath.row cell:cell];
      break;
    case RowSectionRecipient:
      [self constructRecipientCellForRow:indexPath.row cell:cell];
      break;
  }
  
  return cell;
}

- (void)constructDetailCellForRow:(NSInteger)row cell:(UITableViewCell *)cell {
  switch (row) {
    case 0:
      cell.textLabel.text = @"Description";
      cell.detailTextLabel.text = _certificate.certificateDescription;
      break;
    case 1:
      cell.textLabel.text = @"ID";
      cell.detailTextLabel.text = _certificate.certificateIDString;
      break;
    case 2:
      cell.textLabel.text = @"Title";
      cell.detailTextLabel.text = _certificate.title;
      break;
  }
}

- (void)constructIssuerCellForRow:(NSInteger)row cell:(UITableViewCell *)cell {
  switch (row) {
    case 0:
      cell.textLabel.text = @"Email";
      cell.detailTextLabel.text = _certificate.issuer.email;
      break;
    case 1:
      cell.textLabel.text = @"ID";
      cell.detailTextLabel.text = _certificate.issuer.issuerURL.absoluteString;
      break;
    case 2:
      cell.textLabel.text = @"Name";
      cell.detailTextLabel.text = _certificate.issuer.name;
      break;
  }
}

- (void)constructRecipientCellForRow:(NSInteger)row cell:(UITableViewCell *)cell {
  switch (row) {
    case 0:
      cell.textLabel.text = @"isHashed";
      cell.detailTextLabel.text = _certificate.recipient.isHashed ? @"True" : @"False";
      break;
    case 1:
      cell.textLabel.text = @"Identity";
      cell.detailTextLabel.text = _certificate.recipient.identity;
      break;
    case 2:
      cell.textLabel.text = @"Identity Type";
      cell.detailTextLabel.text = _certificate.recipient.identityType;
      break;
    case 3:
      cell.textLabel.text = @"Name";
      cell.detailTextLabel.text = _certificate.recipient.name;
      break;
    case 4:
      cell.textLabel.text = @"Public Key";
      cell.detailTextLabel.text = _certificate.recipient.publicKey;
      break;
  }
}

- (void)constructAssertionCellForRow:(NSInteger)row cell:(UITableViewCell *)cell {
  switch (row) {
    case 0:
      cell.textLabel.text = @"Evidence";
      cell.detailTextLabel.text = @"";
      break;
    case 1:
      cell.textLabel.text = @"ID";
      cell.detailTextLabel.text = _certificate.assertion.assertionID;
      break;
    case 2:
      cell.textLabel.text = @"Issued On";
      NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
      [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
      cell.detailTextLabel.text = [dateFormatter stringFromDate:_certificate.assertion.issuedOn];
      break;
  }
}

- (void)constructVerifyCellForRow:(NSInteger)row cell:(UITableViewCell *)cell {
  switch (row) {
    case 0:
      cell.textLabel.text = @"Public Key";
      cell.detailTextLabel.text = _certificate.verification.publicKey;
      break;
    case 1:
      cell.textLabel.text = @"Signing Method";
      cell.detailTextLabel.text = _certificate.verification.signingMethod;
      break;
  }
}

@end
