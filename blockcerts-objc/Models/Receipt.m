//
//  Receipt.m
//  blockcerts-objc
//
//  Created by Mari Batilando on 7/9/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

#import "Receipt.h"

@implementation Receipt

+(instancetype) initWithData:(NSDictionary *)data {
    NSString *merkleRoot = [data valueForKey:@"merkleRoot"];
    NSString *targetHash = [data valueForKey:@"targetHash"];
    NSArray<NSDictionary *> *anchors = [data valueForKey:@"anchors"];
    NSString *transactionID = [anchors[0] valueForKey:@"sourceId"];
    return [[Receipt alloc] initWithMerkleRoot:merkleRoot targetHash:targetHash transactionID:transactionID];
    
}

-(instancetype) initWithMerkleRoot:(NSString *)merkleRoot
                        targetHash:(NSString *)targetHash
                     transactionID:(NSString *)transactionID {
    self = [super init];
    if (self) {
        _merkleRoot = merkleRoot;
        _targetHash = targetHash;
        _transactionID = transactionID;
    }
    return self;
}

@end
