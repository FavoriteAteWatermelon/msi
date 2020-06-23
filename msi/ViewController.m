//
//  ViewController.m
//  msi
//
//  Created by s on 2020/6/23.
//  Copyright © 2020 s. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
@interface ViewController ()<UITextFieldDelegate>
@end
@interface ViewController ()
#define UICOLOR_RGB(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
@property(nonatomic,strong,readwrite) UITextField *user;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_RGB(0, 0, 0, 0.5);
    [self createImage];
    [self createTitle];
    [self createInput];
    [self loginBtn];
    [self createServer];
    
    // Do any additional setup after loading the view.
}
- (void)createImage {
    UIImage *logoImage = [UIImage imageNamed:@"logo"];
    
    UIImageView *logoView = [UIImageView new];
    logoView.image = logoImage;
    [self.view addSubview:logoView];
    logoView.contentMode = UIViewContentModeScaleAspectFill;
    logoView.frame = CGRectMake(60, 40, 30, 50);
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(45, 35, 60, 60);
    [self.view addSubview:view];
    view.layer.cornerRadius = 4;
    view.layer.borderWidth = 1;
    view.layer.borderColor = UICOLOR_RGB(255,255,255,0.5).CGColor;
}
- (void)createTitle{
    UILabel *label = [UILabel new];
    label.text = @"HI,今天过的怎么样?";
    
    label.tintColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize: 26];
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(45, 80, 260, 80);
    [self.view addSubview: label];
}

-(void)createInput{
    self.user= [UITextField new];

    self.user.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"手机号/用户名/工号" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.user.delegate =self;
    self.user.textAlignment = NSTextAlignmentCenter;
    self.user.textColor = [UIColor whiteColor];
    self.user.frame = CGRectMake( 50, 160, self.view.bounds.size.width - 100, 50);
    [self.view addSubview:self.user];
   
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0,self.user.bounds.origin.y + 50 - 1, self.user.bounds.size.width, 1)];
    lineView.backgroundColor = UICOLOR_RGB(255, 255, 255, 0.2);
    [self.user addSubview:lineView];
    UITextField *password = [UITextField new];

       password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请 输  入 密 码" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    password.textAlignment = NSTextAlignmentCenter;
    password.textColor = [UIColor whiteColor];
    password.delegate = self;
    password.secureTextEntry = YES;
    password.frame = CGRectMake( 50, 220, self.view.bounds.size.width - 100, 50);
    [self.view addSubview:password];
    UIView *lineViewp = [[UIView alloc]initWithFrame:CGRectMake(0,password.bounds.origin.y + 50 - 1, password.bounds.size.width, 1)];
    lineViewp.backgroundColor = UICOLOR_RGB(255, 255, 255, 0.2);
    [password addSubview:lineViewp];
}

-(void)loginBtn{
    UIButton *btn = [UIButton new];
    [btn setImage:[UIImage imageNamed:@"login"] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(15, 15, 15, 15)];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.textColor = [UIColor whiteColor];
    btn.backgroundColor = UICOLOR_RGB(255, 0, 0, 0.6);
    btn.frame = CGRectMake(self.view.bounds.size.width / 2  - 30, 290, 60, 60);
    btn.layer.cornerRadius = 30;
    [self.view addSubview:btn];
}
-(void)createServer{
    UILabel *otherLogin = [UILabel new];
    otherLogin.text = @"其他登陆";
    otherLogin.textColor = [UIColor whiteColor];
    otherLogin.frame = CGRectMake(self.view.bounds.size.width / 2 - 35, self.view.bounds.size.height - 50, 70, 30);
    [self.view addSubview:otherLogin];
    UIView *leftView = [UIView new];
    leftView.backgroundColor= [UIColor whiteColor];
    leftView.frame = CGRectMake(self.view.bounds.size.width / 2 - 55, self.view.bounds.size.height - 45, 2, 20);
    [self.view addSubview:leftView];
    UIView *rightView = [UIView new];
    rightView.backgroundColor= [UIColor whiteColor];
    rightView.frame = CGRectMake(self.view.bounds.size.width / 2 + 50, self.view.bounds.size.height - 45, 2, 20);
    [self.view addSubview:rightView];
    UILabel *mregister = [UILabel new];
    mregister.text = @"用户注册";
    mregister.textColor = [UIColor whiteColor];
    mregister.frame = CGRectMake(self.view.bounds.size.width / 2 - 145, self.view.bounds.size.height - 50, 70, 30);
    [self.view addSubview:mregister];
    UILabel *recall = [UILabel new];
    recall.text = @"用户注册";
    
    recall.textColor = [UIColor whiteColor];
    recall.frame = CGRectMake(self.view.bounds.size.width / 2 + 70, self.view.bounds.size.height - 50, 70, 30);
    [self.view addSubview:recall];
}

-(void) test {
//        HomeViewController *first = [[HomeViewController alloc] init];
//        UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:first];
//    //       [self.navigationController pushViewController:nv animated:YES];
//        [self presentViewController:nv animated:YES completion:^{}];
//
    HomeViewController *homePage = [[HomeViewController alloc] init] ;
    UINavigationController *conC= [[UINavigationController alloc] initWithRootViewController:homePage];
 conC.modalPresentationStyle = UIModalPresentationFullScreen;
     conC.edgesForExtendedLayout = YES;
    [self presentViewController:conC animated:YES completion:^{}];
//  NSString *uuid =  [UIDevice currentDevice].identifierForVendor.UUIDString;
//    NSLog(@"uuid %@",uuid);
}
- (BOOL)textFieldShouldReturn:(UITextField *)user{
    [user resignFirstResponder];
    return true;
}
//开始编辑的时候
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"start edit");
    return YES;
}


//编辑结束，打印编辑内容
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if(textField == self.user){
        NSLog(@"edit end111111=%@", textField.text);
    }else {
         NSLog(@"password = %@", textField.text);
    }
}


@end
