//
//  ViewController.m
//  001-XML解析
//
//  Created by mac on 2018/5/10.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "Video.h"

@interface ViewController ()<NSXMLParserDelegate>
//MARK: - XML解析需要的素材
//1.可变数组
@property(nonatomic,strong)NSMutableArray * videos;
//2.当前解析的节点 -- 模型
@property(nonatomic,strong)Video * currentVideo;

//3.拼接字符串  -- 可变字符串
@property(nonatomic,strong)NSMutableString * elementStr;

@end

@implementation ViewController

//MARK: - 懒加载
-(NSMutableArray *)videos{
    if (!_videos) {
        _videos = [NSMutableArray array];
    }
    return _videos;
}

-(NSMutableString *)elementStr{
    if (!_elementStr) {
        _elementStr =[NSMutableString string];
    }
    return _elementStr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    [self loadData];
}

//MARK: - XML解析
-(void)loadData{
    //1.url
    NSURL * url = [NSURL URLWithString:@"http://127.0.0.1/videos.xml"];
    //2.request
    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:10.0];
    //3.发送请求
    //使用新建队列，保证所有的XML解析工作再后台完成
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //XML解析 -- 耗时操作
       NSXMLParser * parser =  [[NSXMLParser alloc]initWithData:data];
        //设置代理- 一旦解析器开始解析，后续的工作都是通过代理来监听实现的
        parser.delegate = self;
        //解析XML
        [parser parse];
    }];
}

#pragma mark - <XML解析的代理方法>
//1.打开文档
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"1.开始文档");
    //清空数组
    [self.videos removeAllObjects];
}
//2.开始节点(Element - 元素) attributeDict 包含在开始节点内的拓展属性
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"2.开始节点 %@ %@",elementName,attributeDict);
    //如果element 是video
    if ([elementName isEqualToString:@"video"]) {
        //新建video对象
        self.currentVideo = [[Video alloc]init];
        //设置videoId 属性 @()包装成NSNumber
        self.currentVideo.videoId = @([attributeDict[@"videoId"] intValue]);
    }
}
//3.发现节点内容(一个节点的内容，可能会读取很多次！) string（内容）
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"3.发现节点内容==> %@",string);
    //拼接字符串
    [self.elementStr appendString:string];
}
//4.结束节点
/*
 KVC 键值编码  cocoa 大招
 */
-(void)parser:(NSXMLParser *)parser didEndElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
    NSLog(@"4.结束节点 %@ %@",elementName,namespaceURI);
    //如果是name length imageURL desc video
//    if ([elementName isEqualToString:@"video"]) {
//        //如果是video 就添加模型到数组
//        [self.videos addObject:self.currentVideo];
//    }else if ([elementName isEqualToString:@"name"]){
//        self.currentVideo.name = self.elementStr;

//    }else if ([elementName isEqualToString:@"length"]){
//        self.currentVideo.length = @(self.elementStr.intValue);
//        [self.currentVideo setValue:self.elementStr forKey:@"name"];
//    }else if ([elementName isEqualToString:@"videoURL"]){
//        self.currentVideo.videoURL = self.elementStr;
//    }else if ([elementName isEqualToString:@"imageURL"]){
//        self.currentVideo.imageURL = self.elementStr;
//    }else if ([elementName isEqualToString:@"desc"]){
//        self.currentVideo.desc = self.elementStr;
//    }else if ([elementName isEqualToString:@"teacher"]){
//        self.currentVideo.teacher = self.elementStr;
//    }
    
    if ([elementName isEqualToString:@"video"]) {
                //如果是video 就添加模型到数组
         [self.videos addObject:self.currentVideo];
    }else if (![elementName isEqualToString:@"videos"]){
        [self.currentVideo setValue:self.elementStr forKey:elementName];
    }
    //清空字符串
    [self.elementStr setString:@""];
}
//5.结束文档
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"5.结束文档 %@",self.videos);
}
//6.出现错误（只要是网络开发，就需要处理错误！！）
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"6.发生错误 %@",parseError);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
