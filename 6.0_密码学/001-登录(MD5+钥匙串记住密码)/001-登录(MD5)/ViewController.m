//
//  ViewController.m
//  001-登录(MD5)
//
//  Created by mac on 2018/4/23.
//  Copyright © 2018年 mac. All rights reserved.
//
/*
 逆向 破解！！
 */

#import "ViewController.h"
#import "NSString+Hash.h"
#import "SSKeychain.h"

@interface ViewController ()
@property(nonatomic,copy)NSString * user;
@property(nonatomic,copy)NSString * pwd;
@end

@implementation ViewController

//盐
static NSString * salt =@"*DJSF(*QYEWOIOAJ()*)ASDASDASD";

- (void)viewDidLoad {
    [super viewDidLoad];
    //发给服务器校验！
    self.user = @"user";
    self.pwd = @"123456";
//    pwd=[pwd stringByAppendingString:salt];
//    pwd=pwd.md5String;
    //加密！直接MD5加密
   
    //直接发送给服务端pwd可以嘛？
    //答案是不可以，因为虽然MD5是不可逆的，但是一些简单的密码转换成哈希值之后是固定的，有大量的网站依然可以匹配出你加密后的哈希，然后找到你的原密码。那有没有方法解决呢？我们可以进行“加盐”
    
    //如果盐被泄露呢？那就严重了，所以肯定不能使用固定的盐
    //我们尝试另一种方式：HMAC
//    self.pwd =[self.pwd hmacSHA1StringWithKey:@"hank"];
    //（HMAC密码+服务器时间戳+盐（服务器和客户端商议））md5
    //服务端存储用户名 key HMAC密码
    //服务端验证：1.（HMAC密码+服务器时间戳（时间戳只到分钟）+key（服务器和客户端商议）MD5
    //2.（HMAC密码+服务器时间戳（上1分钟）+key（服务器和客户端商议）MD5
//     NSLog(@"加密之后：%@",self.pwd);
    
    /*
     非对称加密算法
     一.运行终端，生成私钥
     1.cd /Users/mac/Desktop/iOS/加密
     2.openssl genrsa -out private.pem 512 //生成私钥，注意：这个私钥其实是放在服务器的
     3.openssl rsa -in private.pem -out public.pem -pubout //通过2生成的私钥获取公钥
     4.我们会发现已经在加密文件下，创建成功了两个文件
     5.cat private.pem  //打开私钥，可以看见base64编码的文件格式
     6. openssl rsa -in private.pem -text -out private.txt  //转换成明文格式打开看看
     RSA加密使用效率偏低，它有哪些应用场景呢？
     我们都知道私钥是放在服务端的，公钥是在客户端的。何为公钥？公钥可以理解为公共钥匙，任何客户端都可以向服务器获取公钥。当你的项目在被做逆向的时候，其他人就可以模仿客户端来获取公钥，所以没有绝对的安全，只有相对的安全。因此我们的重要数据仍然需要做加密处理。我们知道OC的方法调用和函数调用是不一样的，方法调用可以显示方法名，而函数调用则返回的是内存地址。所以在大公司中，一些核心算法都是使用的C。
     */
    
    //模拟网络请求用户登录成功后,保存密码
    //明文账户密码
    [self savePwdWithAccunt:self.user pas:self.pwd];
    
    //第二次登录 - 加载本地用户信息
    [self loadUserInfo];
}

//加载本地用户信息
-(void)loadUserInfo{
    //加载账户
    self.user = [[NSUserDefaults standardUserDefaults] stringForKey:@"BundelID"];
    //钥匙串访问方法：找出所有账户
    self.pwd = [SSKeychain passwordForService:@"BundelID" account:self.user];
    NSLog(@"%@",[SSKeychain allAccounts]);
    NSLog(@"%@",self.pwd);
    /*
     2018-05-15 17:09:50.522587+0800 001-登录(MD5)[15894:1009983] (
     {
     accc = "<SecAccessControlRef: 0x604000430080>";
     acct = user;
     agrp = "XV99QKSRHM.com.audition.www.-01----MD5-";
     cdat = "2018-05-15 09:09:49 +0000";
     mdat = "2018-05-15 09:09:49 +0000";
     musr = <>;
     pdmn = ak;
     persistref = <>;
     sha1 = <29d75170 a70839b0 33d12e4c 81e88bee 7a350bf6>;
     svce = BundelID;
     sync = 0;
     tomb = 0;
     }
     )
     */
}
//保存账户密码
-(void)savePwdWithAccunt:(NSString *)accunt pas:(NSString *)pwd{
    //保存账户
    [[NSUserDefaults standardUserDefaults] setObject:accunt forKey:@"BundelID"];
    //同步
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //保存密码
    if (accunt > 0 && pwd.length>0) {
        
        /**
         钥匙串保存密码
          参数
          1.密码明文
          2.服务，可以随便写，但是它是App的一个标识，建议使用BundelID
          3.账户，用户名
         */
        [SSKeychain setPassword:pwd forService:@"BundelID" account:accunt];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
