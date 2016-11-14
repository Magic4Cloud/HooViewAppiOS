//
//  CoreCollectionViewCell.h
//  ReYinApp
//
//  Created by Benjamin on 4/25/2016.
//  Copyright © 2016 Shanghai REYIN Culture Development Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


// --- Core CollectionViewCell class root --- //
@interface CoreCollectionViewCell : UICollectionViewCell

// Localization methods
@property (nonatomic, strong)       NSString        *localizationItemName;
- (NSString *)stringWithKey:(NSString *)key;

// Setup something in here
- (void)setup;

+ (__kindof UICollectionViewCell *)reusableCellDequeueCollectionView:(UICollectionView *) collectionView forIndexPath:(NSIndexPath *)indexPath;

+ (NSString *)cellReuseIdentifier;

+ (CGSize)sizeOfCollectionViewCell;

@end




// --- Core Xib file CollectionViewCell class --- //
IB_DESIGNABLE
@interface CoreXibCollectionViewCell : CoreCollectionViewCell

+ (__kindof UICollectionViewCell *)reusableCellDequeueCollectionView:(UICollectionView *) collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
