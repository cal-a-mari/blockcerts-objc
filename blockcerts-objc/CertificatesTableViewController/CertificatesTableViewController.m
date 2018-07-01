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

@interface CertificatesTableViewController ()

@property (nonatomic, nonnull) NSArray<Certificate *> *certificates;

@end

@implementation CertificatesTableViewController

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
    UIImage *image1 = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://coursera-university-assets.s3.amazonaws.com/2c/0c9966c6a65516868e8ff99ec0c0af/Square-logo-for-university-page-blue.png"]]];
    UIImage *image2 = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-course-photos.s3.amazonaws.com/ee/2b33505cfd11e8b7aa710a36ed3069/bitcoins-logo.png?auto=format%2Ccompress&dpr=2&w=80&h=80&fit=fill&bg=FFF"]]];
    UIImage *image3 = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/3c/aadfb0eeed11e6a498537bc42417aa/UCI-Square-Logo.png?auto=format%2Ccompress&dpr=2&w=200&h=100&fit=clip"]]];
    NSURL *shareURL = [[NSURL alloc] initWithString:@"http://google.com"];
    
    Certificate *cert1 = [[Certificate alloc] initWithTitle:@"De-mystifying Mindfulness"
                                                   subtitle:@"My subtitle"
                                                description:@"Description"
                                                      image:image1
                                                   language:@"EN-US"
                                                   shareURL:shareURL
                                                     issuer:@"Universiteit Leiden"];
    Certificate *cert2 = [[Certificate alloc] initWithTitle:@"Bitcoin and Cryptocurrencies"
                                                   subtitle:@"My subtitle"
                                                description:@"Description"
                                                      image:image2
                                                   language:@"EN-US"
                                                   shareURL:shareURL
                                                     issuer:@"Princeton University"];
    Certificate *cert3 = [[Certificate alloc] initWithTitle:@"Academic English: Writing"
                                                   subtitle:@"My subtitle"
                                                description:@"Description"
                                                      image:image3
                                                   language:@"EN-US"
                                                   shareURL:shareURL
                                                     issuer:@"University of California, Davis"];
    self.certificates = @[cert1, cert2, cert3];
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
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.certificates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Certificate *certificate = [self.certificates objectAtIndex:indexPath.row];
    CertificateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CertificateTableViewCell cellIdentifier]];
    cell.titleLabel.text = certificate.title;
    cell.issuerLabel.text = certificate.issuer;
    cell.certificateImageView.image = certificate.image;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Certificate *certificate = [self.certificates objectAtIndex:indexPath.row];
    CertificateDetailViewController *detailViewController = [[CertificateDetailViewController alloc] initWithCertificate:certificate];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
