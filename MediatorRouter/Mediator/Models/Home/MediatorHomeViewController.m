
//
//  MediatorHomeViewController.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "MediatorHomeViewController.h"

#import "CTMediator+DetailExtension.h"

@interface MediatorHomeViewController ()

@end

@implementation MediatorHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    BOOL innerCallBack = YES;
    if (innerCallBack) {
        //1，本地调用
           [self.navigationController pushViewController:[[CTMediator sharedInstance] getDetailVCWithTitle:@"详情" name:@"传值"] animated:YES];
    } else {
        //ios : 区分安卓还是ios
        //teach: 教学中心，当模块之后，很难保证 多个模块里没有命名相同(url相同)的页面,所以加上一层判断，
        //productDetail : 商品详情页，如果其他的模块也有个商品详情页，所以前面加上模块名来区分。
        //App://home/productDetail?userId=xxx&studentId=xxx
        //    NSString * urlStr = @"http://www.baid.com/ios/home/ProductDetail?userId=xxx&studentId=xxx";
        //这个短链
        NSString * urlStr = @"App://MediatorHomeViewController/MediatorHomeViewController?Id=111";
        NSURL * url = [NSURL URLWithString:[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]];
        
        NSString * query = [url query];
        NSString * path = [url path];
        NSDictionary * queryDict = [self zh_dictionaryWithParamString:query];
        if ([path hasPrefix:@"/"]) {
            path = [path substringFromIndex:1];
        }
        NSArray * paths = [path componentsSeparatedByString:@"/"];
        NSLog(@"queryDict = %@",queryDict);
        NSLog(@"paths = %@",paths);
        
        //2，远程调用
        UIViewController * vc = [[CTMediator sharedInstance] performActionWithUrl:url completion:NULL];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (NSDictionary *)zh_dictionaryWithParamString:(NSString *)zh_paramString {
    if (zh_paramString == nil || [zh_paramString isEqualToString:@""]) {
        return nil;
    }
    NSArray *arr = [zh_paramString componentsSeparatedByString:@"&"];
    NSMutableDictionary *parameterDict = [NSMutableDictionary dictionary];
    for (int i = 0; i < arr.count; i++) {
        NSArray *str = [arr[i] componentsSeparatedByString:@"="];
        if (str.count == 2) {
            NSString *value = str[1];
            value = [value stringByRemovingPercentEncoding];
            [parameterDict setObject:value forKey:str[0]];
        }
        else if (str.count > 2){
            
            NSMutableString *appending = [[NSMutableString alloc] initWithCapacity:0];
            for (NSUInteger j = str.count - 1; j == 1; j--) {
                [appending appendString:str[j]];
            }
            
            NSString *value = [appending copy];
            value = [value stringByRemovingPercentEncoding];
            [parameterDict setObject:value forKey:str[0]];
        }
        else {
            NSLog(@"没有等号的参数跳过");
        }
    }
    return [parameterDict copy];
}

@end
