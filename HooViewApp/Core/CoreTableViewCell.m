//
//  CoreTableViewCell.m
//  HotMusic
//
//  Created by Benjamin on 5/27/2015.
//  Copyright (c) 2015 ReYin. All rights reserved.
//

#import "CoreTableViewCell.h"
#import "CoreNibFileCache.h"

@implementation CoreTableViewCell

- (NSString *)stringWithKey:(NSString *)key
{
    return NSLocalizedStringFromTable(key, self.localizationItemName, nil);
}

- (void)setup
{}

+ (__kindof UITableViewCell *)reusableCellDequeueTableView:(UITableView *)tableView
{
    NSString *cellReuseIdentifier = NSStringFromClass([self class]);
    CoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    
    if (!cell) {
        cell = [[self alloc] initWithReuseIdentifier:cellReuseIdentifier];
        [tableView registerClass:[self class] forCellReuseIdentifier:cellReuseIdentifier];
    }
    
    return cell;
}

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

- (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end



@implementation CoreXibTableViewCell

- (void) setup
{
    [super setup];
}

+ (__kindof UITableViewCell *)reusableCellDequeueTableView:(UITableView *)tableView
{
    NSString *cellReuseIdentifier = NSStringFromClass([self class]);
    CoreXibTableViewCell *xibCell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    
    if (!xibCell) {
        NSString *nibClassName = NSStringFromClass([self class]);
        UINib *nib = [[CoreNibFileCache sharedInstance] nibWithNameKey:nibClassName];
        if (!nib)
        {
            NSException *exception = [NSException exceptionWithName:NSInvalidArgumentException
                                                             reason:[NSString stringWithFormat:@"CoreNibFileCache could not find nib file %@", nibClassName]
                                                           userInfo:nil];
            [exception raise];
        }
        
        NSArray *arrayCells = [nib instantiateWithOwner:self options:nil];
        if (arrayCells.count != 1)
        {
            NSException *exception = [NSException exceptionWithName:NSInvalidArgumentException
                                                             reason:[NSString stringWithFormat:@"CoreNibFileCache found more than one view in nib file %@", nibClassName]
                                                           userInfo:nil];
            [exception raise];
        }
        
        xibCell = arrayCells.firstObject;
        [tableView registerNib:nib forCellReuseIdentifier:cellReuseIdentifier];
    }
    
    xibCell.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    return xibCell;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
