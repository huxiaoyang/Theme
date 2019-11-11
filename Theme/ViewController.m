//
//  ViewController.m
//  Theme
//
//  Created by huxiaoyang on 2019/11/11.
//  Copyright © 2019 hy. All rights reserved.
//

#import "ViewController.h"
#import "KSSkinManager.h"
#import "UILabel+Theme.h"
#import "UIButton+Theme.h"

#define SCREEN_WIDTH            ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT           ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH-40, 40)];
    label.text = @"Label1";
    [label bl_setThemeTextColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, SCREEN_WIDTH-40, 40)];
    label2.text = @"Label2";
    [label2 bl_setThemeTextColor];
    label2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label2];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 180, SCREEN_WIDTH-40, 40);
    [button setTitle:@"Button1" forState:UIControlStateNormal];
    [button bt_setThemeTextColor];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(20, 240, SCREEN_WIDTH-40, 40);
    [button2 setTitle:@"Button2" forState:UIControlStateNormal];
    [button2 bt_setThemeTextColor];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(20, 320, (SCREEN_WIDTH-60)/2, 40);
    button3.tag = 101;
    [button3 setTitle:@"主题1" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(themeAction:) forControlEvents:UIControlEventTouchUpInside];
    [button3 bt_setThemeTextColor];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(40+(SCREEN_WIDTH-60)/2, 320, (SCREEN_WIDTH-60)/2, 40);
    button4.tag = 102;
    [button4 setTitle:@"主题2" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(themeAction:) forControlEvents:UIControlEventTouchUpInside];
    [button4 bt_setThemeTextColor];
    [self.view addSubview:button4];
}

-(void) themeAction:(UIButton *)sender{
    if (sender.tag == 101) {
        NSLog(@"主题1");
        skin_switch(KSSkinStyleDefault);
    }else{
        NSLog(@"主题2");
        skin_switch(KSSkinStyleTheme1);
    }
}

@end
