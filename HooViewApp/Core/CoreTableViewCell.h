//
//  CoreTableViewCell.h
//  HotMusic
//
//  Created by Benjamin on 5/27/2015.
//  Copyright (c) 2015 ReYin. All rights reserved.
//

#import <UIKit/UIKit.h>

// --- Core TableViewCell class root --- //
@interface CoreTableViewCell : UITableViewCell

// Localization methods
@property (nonatomic, strong)       NSString        *localizationItemName;
- (NSString *)stringWithKey:(NSString *)key;

// Setup something
- (void)setup;

+ (__kindof UITableViewCell *)reusableCellDequeueTableView:(UITableView *)tableView;

+ (NSString *)cellReuseIdentifier;

@end


// --- Core Xib file TableViewCell class --- //
IB_DESIGNABLE
@interface CoreXibTableViewCell : CoreTableViewCell

+ (__kindof UITableViewCell *)reusableCellDequeueTableView:(UITableView *)tableView;

@end
