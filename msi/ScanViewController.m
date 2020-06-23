//
//  ScanViewController.m
//  msi
//
//  Created by s on 2020/6/23.
//  Copyright © 2020 s. All rights reserved.
//

#import "ScanViewController.h"
#import "HomeViewController.h"
#import "ZBarSDK.h"

@interface ScanViewController ()<ZBarReaderDelegate>


@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self normalScanQRCodeView];

}
- (void)normalScanQRCodeView{
    //初始化扫描二维码控制器
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    //设置代理
    reader.readerDelegate = self;
    //基本适配
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    //二维码/条形码识别设置
    ZBarImageScanner *scanner = reader.scanner;
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    //弹出系统照相机，全屏拍摄
    [self presentViewController:reader animated:YES completion:^{
          
    }];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];
    ZBarSymbol * symbol;
    for(symbol in results)
        break;
      
    [picker dismissViewControllerAnimated:YES completion:nil];
      
    NSString *result = symbol.data;
      
    NSLog(@"%@",result);
      
    //二维码扫描成功，弹窗提示
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"扫描成功" message:[NSString stringWithFormat:@"二维码内容:\n%@",result] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:^{
    }];
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
