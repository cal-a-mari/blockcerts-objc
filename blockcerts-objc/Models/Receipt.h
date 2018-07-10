//
//  Receipt.h
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/9/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Receipt : NSObject

@property (nonatomic, readonly, copy) NSString *merkleRoot;
@property (nonatomic, readonly, copy) NSString *targetHash;
//@property (nonatomic, readonly, copy) NSString *proof;
@property (nonatomic, readonly, copy) NSString *transactionID;

+(instancetype) initWithData:(NSDictionary *)data;
-(instancetype) initWithMerkleRoot:(NSString *)merkleRoot
                        targetHash:(NSString *)targetHash
                     transactionID:(NSString *)transactionID;

@end
