//
//  TwoViewController.m
//  RN2iOSNative
//
//  Created by Jason on 16/8/4.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *goBlackButton;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
//  label.text = @"你好我是第二个页面";
//  [self.view addSubview:label];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)goBlackMethod:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
