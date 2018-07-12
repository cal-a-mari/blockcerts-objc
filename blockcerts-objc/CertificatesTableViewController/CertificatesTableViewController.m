//
//  CertificatesTableViewController.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 6/30/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "CertificatesTableViewController.h"
#import "CertificateTableViewCell.h"
#import "CertificateDetailViewController.h"
#import "Certificate.h"
#import "V2CertificateImporter.h"

@interface CertificatesTableViewController ()

//@property (nonatomic, nonnull) NSArray<Certificate *> *certificates;

@end

@implementation CertificatesTableViewController

NSMutableArray<Certificate *> *_certificates;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Certificates";
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"CertificateTableViewCell" bundle:nil]
         forCellReuseIdentifier:[CertificateTableViewCell cellIdentifier]];
    [self fetchCertificates];
    [self.tableView reloadData];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:self
                                                                                           action:@selector(didTapBarButtonItem:)];
}

-(void) fetchCertificates {
  NSURL *certURL = [NSURL URLWithString:@"https://api.myjson.com/bins/1g57c6"];
  [V2CertificateImporter importFromURL:certURL completion:^(Certificate *certificate, NSError *error) {
    [self addCertificate:certificate];
  }];
}

-(void)addCertificate:(Certificate *)certificate {
  if (certificate == nil) { return; }
  if (_certificates == nil) {
    _certificates = [NSMutableArray arrayWithObject:certificate];
  } else {
    [_certificates addObject:certificate];
  }
  [self.tableView reloadData];
}

-(void)didTapBarButtonItem:(UIBarButtonItem *)sender {
    UIAlertController *alertController = [[UIAlertController alloc] init];
    alertController.modalTransitionStyle = UIAlertControllerStyleActionSheet;
    [self addImportURLActionToAlertController:alertController];
    [self addImportFileActionToAlertController:alertController];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)addImportURLActionToAlertController:(UIAlertController *)alertController {
    UIAlertAction *addFromURLAction = [UIAlertAction actionWithTitle:@"Add from URL"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
         UIAlertController *urlAlertController = [UIAlertController alertControllerWithTitle:@"Import from URL"
                                                                                     message:@"Enter Certificate URL below"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
         [urlAlertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
             textField.placeholder = @"URL";
         }];
         UIAlertAction *importAction = [UIAlertAction actionWithTitle:@"Import"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
             UITextField *textField = urlAlertController.textFields.firstObject;
             NSURL *url = [[NSURL alloc] initWithString: textField.text];
             [self didTapImportFromURLButtonWithURL:url];
         }];
         [urlAlertController addAction:importAction];
         [self presentViewController:urlAlertController animated:YES completion:nil];
    }];
    [alertController addAction:addFromURLAction];
}

-(void)addImportFileActionToAlertController:(UIAlertController *)alertController {
    UIAlertAction *addFromFileAction = [UIAlertAction actionWithTitle:@"Add from File"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  UIDocumentPickerViewController *pickerViewController = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[@"public.json"]
                                                                                                                                                                                inMode:UIDocumentPickerModeImport];
                                                                  pickerViewController.delegate = self;
                                                                  pickerViewController.modalPresentationStyle = UIModalPresentationFormSheet;
                                                                  [self presentViewController:pickerViewController animated:YES completion:nil];
                                                              }];
    
    [alertController addAction:addFromFileAction];
}

-(void)didTapImportFromURLButtonWithURL:(NSURL *)url {
    [V2CertificateImporter importFromURL:url completion:^(Certificate *certificate, NSError *error) {
      [self addCertificate:certificate];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _certificates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Certificate *certificate = [_certificates objectAtIndex:indexPath.row];
    CertificateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CertificateTableViewCell cellIdentifier]];
    cell.titleLabel.text = certificate.title;
    cell.issuerLabel.text = certificate.issuer.name;
    cell.certificateImageView.image = certificate.image;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Certificate *certificate = [_certificates objectAtIndex:indexPath.row];
    CertificateDetailViewController *detailViewController = [[CertificateDetailViewController alloc] initWithCertificate:certificate];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
