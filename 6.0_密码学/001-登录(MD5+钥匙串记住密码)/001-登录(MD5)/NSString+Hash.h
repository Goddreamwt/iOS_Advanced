//
//  NSString+Hash.h
//
//  Created by Tom Corwine on 5/30/12..
//

#import <Foundation/Foundation.h>

@interface NSString (Hash)
/*
 计算MD5散列结果：
 
 终端测试命令：
 @code
 md5 -s "string"
 @endcode
 
 <p>提示：随着MD5碰撞生成器的出现，MD5算法不应被用于任何软件完整性校验或代码签名的用途</p>
 @return 32个字符的MD5散列字符串
 **/
@property (readonly) NSString *md5String;
/*
 计算SHA1散列结果：
 @code
 echo -n "string" | openssl sha -sha1
 @endcode
 
 @return 40个字符的SHA1散列字符串
 **/
@property (readonly) NSString *sha1String;
/*
 计算SHA256散列结果：
 @code
 echo -n "string" | openssl sha -sha256
 @endcode
 
 @return 40个字符的SHA1散列字符串
 **/
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

@end
