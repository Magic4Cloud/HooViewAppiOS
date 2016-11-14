//
//  CoreUIView.m
//  HotMusic
//
//  Created by Benjamin on 5/27/2015.
//  Copyright (c) 2015 ReYin. All rights reserved.
//

#import "CoreUIView.h"
#import "UIView+Extension.h"
#import "CoreNibFileCache.h"


@implementation CoreUIView

- (NSString *)stringWithKey:(NSString *)key {
    return NSLocalizedStringFromTable(key, self.localizationItemName, nil);
}

- (void)setup {
}

#pragma mark – Override methods

- (id)init {
    if ( (self = [super init]) ) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame] ) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ( self = [super initWithCoder:aDecoder] ) {
        if ( ![self isKindOfClass:[CoreDesignableXibUIView class]] ) {
            [self setup];
        }
    }
    return self;
}

@end



@implementation CoreDesignableXibUIView

- (id)initWithXib {
    if ( (self = [super init]) ) {
        //[self setup];
    }
    return self;
}

- (void)setup {
    [super setup];
    
    NSString *nibClassName = NSStringFromClass([self class]);
    UINib *nib = [[CoreNibFileCache sharedInstance] nibWithNameKey:nibClassName];
    if (!nib)
    {
        NSException *exception = [NSException exceptionWithName:NSInvalidArgumentException
                                                         reason:[NSString stringWithFormat:@"CoreNibFileCache could not find nib file %@", nibClassName]
                                                       userInfo:nil];
        [exception raise];
    }
    
    NSArray *arrayViews = [nib instantiateWithOwner:self options:nil];
    if (arrayViews.count != 1)
    {
        NSException *exception = [NSException exceptionWithName:NSInvalidArgumentException
                                                         reason:[NSString stringWithFormat:@"CoreNibFileCache found more than one view in nib file %@", nibClassName]
                                                       userInfo:nil];
        [exception raise];
    }
    
    UIView *view = arrayViews.firstObject;
    [self addSubview:view];
    
    //Constraints
    view.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *bindings = NSDictionaryOfVariableBindings(@"view", view);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:bindings]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:bindings]];
    self.sizeH = ((UIView *)view).sizeH;
    self.sizeW = ((UIView *)view).sizeW;
    [self setNeedsLayout];
}

- (id)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame] ) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ( self = [super initWithCoder:aDecoder] ) {
        [self setup];
    }
    return self;
}

@end
