//
//  HomeViewController.m
//  msi
//
//  Created by s on 2020/6/23.
//  Copyright © 2020 s. All rights reserved.
//

#import "HomeViewController.h"
#import <CoreImage/CoreImage.h>
#import "ScanViewController.h"
@interface HomeViewController ()<UITextFieldDelegate>
@property UIImageView *imageView;
@property(nonatomic,strong,readwrite) UITextField *textField;
@property(nonatomic,strong) NSString *textString;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.imageView = [UIImageView new];
    
    [self.view addSubview:self.imageView];
    self.imageView.frame = CGRectMake(self.view.bounds.size.width / 2 - 100, 200, 200, 200);
   
    self.textField = [UITextField new];
    
    self.textField.backgroundColor =[UIColor whiteColor];
    self.textField.layer.cornerRadius = 5;
    self.textField.frame = CGRectMake(self.view.bounds.size.width / 2  - 100, 80, 200, 50);
     self.textField.delegate =self;
    [self.view addSubview:self.textField];
    UIButton *button = [UIButton new];
    [button setTitle:@"二维码" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(touchesBegan) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(self.view.bounds.size.width / 2 + 100, 80, 100, 50);
    [self.view addSubview:button];
    UIButton *button1 = [UIButton new];
    [button1 setTitle:@"扫码" forState:UIControlStateNormal];
    button1.titleLabel.textColor = [UIColor whiteColor];
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(toScan) forControlEvents:UIControlEventTouchUpInside];
    button1.frame = CGRectMake( 20, 80, 100, 50);
    [self.view addSubview:button1];
    UILabel *label =[UILabel new];
    label.text = self.scanValue;
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(20, 300, 100, 30);
    [self.view addSubview:label];
    
//    self.view.backgroundColor= [UIColor redColor];
    // Do any additional setup after loading the view.
}

-(void)toScan{
    ScanViewController *scan = [ScanViewController new];
    [self.navigationController pushViewController:scan animated:NO];
}
- (void)touchesBegan{
    NSLog(@"ddd");
//    self.textString = @"hhlo";
    // 0.导入头文件#import <CoreImage/CoreImage.h>

    // 1.创建过滤器 -- 苹果没有将这个字符封装成常量
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];

    // 2.过滤器恢复默认设置
    [filter setDefaults];

    // 3.给过滤器添加数据(正则表达式/帐号和密码) -- 通过KVC设置过滤器,只能设置NSData类型
//    self.textString = @"http://www.baidu.com";
    NSData *data = [self.textString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];

    // 4.获取输出的二维码
    CIImage *outputImage = [filter outputImage];

    // 5.显示二维码
    self.imageView.image = [UIImage imageWithCIImage:outputImage];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}
//开始编辑的时候
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"start edit");
    return YES;
}


//编辑结束，打印编辑内容
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.textString = textField.text;
     NSLog(@"password = %@", textField.text);
    
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
