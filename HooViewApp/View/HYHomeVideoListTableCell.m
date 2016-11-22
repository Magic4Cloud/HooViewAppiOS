//
//  HYHomeVideoListTableCell.m
//  HooViewApp
//
//  Created by Ananwu on 2016/11/16.
//  Copyright © 2016年 Ananwu. All rights reserved.
//

#import "HYHomeVideoListTableCell.h"

@interface HYHomeVideoListTableCell ()
@property (nonatomic, weak) IBOutlet UIView *containerBGView;
@property (nonatomic, weak) IBOutlet UIImageView *videoThumbImgView;
@property (nonatomic, weak) IBOutlet UIImageView *videoStatusImgView;
@property (nonatomic, weak) IBOutlet UIImageView *avatorIconView;
@property (nonatomic, weak) IBOutlet UIButton *isLivingBtn;
@property (nonatomic, weak) IBOutlet UIButton *recordWatchBtn;
@property (nonatomic, weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic, weak) IBOutlet UIButton *flwBtn;
@property (nonatomic, weak) IBOutlet UILabel *videoTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *watchConutLabel;

@end

@implementation HYHomeVideoListTableCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setup {
    [super setup];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.isLivingBtn.layer.cornerRadius = self.recordWatchBtn.layer.cornerRadius = 17.5f;
    self.avatorIconView.layer.cornerRadius = 15.0f;
    self.isLivingBtn.layer.masksToBounds = self.recordWatchBtn.layer.masksToBounds = self.avatorIconView.layer.masksToBounds = YES;
    
}

+ (CGFloat)heightForVideoListCell {
    return 230.0f;
}
- (IBAction)clickIsLivingBtn:(id)sender {
}
- (IBAction)clickRecordWatchBtn:(id)sender {
}
- (IBAction)clickFLWBtn:(id)sender {
}

@end
