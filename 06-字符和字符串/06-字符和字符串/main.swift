//
//  main.swift
//  06-字符和字符串
//
//  Created by gaojun on 16/4/2.
//  Copyright © 2016年 高军. All rights reserved.
//

import Foundation

print("Hello, World!")

//——————————————————————字符和字符串基本------------------------

/*
Swift和OC字符不一样
1.Swift是用双引号
2.Swift中的字符类型和OC中的也不一样, OC中的字符占一个字节,因为它只包含ASCII表中的字符, 而Swift中的字符除了可以存储ASCII表中的字符还可以存储unicode字符,
例如中文:
OC:char charValue = '李'; // 错误
Swift: var charValue2:Character = "李" // 正确

OC的字符是遵守ASCII标准的,Swift的字符是遵守unicode标准的, 所以可以存放世界上所有国家语言的字符(大部分)
*/

/*
注意: 双引号中只能放一个字符, 如下是错误写法
var charValue3:Character = "ab"
*/


//字符
var charValue : Character = "a"
print("charValue:",charValue)

var charValue1 : Character = "高"
print("charValue1:",charValue1)


/*
字符串:
字符是单个字符的集合, 字符串是多个字符的集合, 想要存放多个字符需要使用字符串

C:
char *stringValue = "ab";
char stringArr = "ab";

OC:
NSString *stringValue = "ab";
*/

//字符串
var charValue2 = "ab"
print("charValue2:",charValue2)

var charValue3 = "高军"
print("charValue3:",charValue3)

/*
C语言中的字符串是以\0结尾的, 例如:
char *stringValue = "abc\0bcd";
printf("%s", stringValue);
打印结果为abc

OC语言中的字符串也是以\0结尾的, 例如:
NSString *stringValue = @"abc\0bcd";
NSLog(@"%@", stringValue);
打印结果为abc
*/

var charValue4 = "abc\0dre"//swift中\0不是字符串的结束标志
print("charValue4:",charValue4)
// 打印结果为abcbcd
// 从此可以看出Swift中的字符串和C语言/OC语言中的字符串是不一样的

//--------------------字符和字符串构造------------------------

//计算字符串长度
var stringValue = "a"
print("stringValue长度:",stringValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))

var stringValue1 = "abc高"//一个汉字占3个字节(8位时)
print("stringValue1长度:",stringValue1.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
/*
计算字符串长度:
C:
char *stringValue = "abc李";
printf("%tu", strlen(stringValue));
打印结果6

OC:
NSString *stringValue = @"abc李";
NSLog(@"%tu", stringValue.length);
打印结果4, 以UTF16计算
*/



//字符串拼接
var str1 = "abc"
var str2 = "Gj"
var str = str1 + str2
print("str:",str)
/*
字符串拼接
C:
char str1[] = "abc";
char *str2 = "bcd";
char *str = strcat(str1, str2);

OC:
NSMutableString *str1 = [NSMutableString stringWithString:@"abc"];
NSString *str2 = @"bcd";
[str1 appendString:str2];
NSLog(@"%@", str1);

*/




//格式化字符串
var index = 1
var str3 = "http://www.baidu.com/\(index).jpg"
print("str3:",str3)//http://www.baidu.com/1.jpg
/*
格式化字符串
C: 相当麻烦, 指针, 下标等方式
OC:
NSInteger index = 1;
NSString *str1 = [NSMutableString stringWithFormat:@"http://ios.itcast.cn/pic/%tu.png", index];
NSLog(@"%@", str1);
*/




//字符串比较
var str4 = "abc"
var str5 = "abc"
var str6 = "abd"

if str4 == str5 {
    print("str4等于str5")
}

if str4 >= str6 {
    print("str4大于等于str6")
}else {
    print("str4小于str6")
}
/*
字符串比较:
OC:
NSString *str1 = @"abc";
NSString *str2 = @"abc";
if ([str1 compare:str2] == NSOrderedSame)
{
NSLog(@"相等");
}else
{
NSLog(@"不相等");
}

if ([str1 isEqualToString:str2])
{
NSLog(@"相等");
}else
{
NSLog(@"不相等");
}

Swift:(== / != / >= / <=), 和C语言的strcmp一样是逐个比较
*/




//判断前后缀
var str7 = "http://www.baidu.com"
if str7 .hasPrefix("http") {
    print("str7是url")
}

if str7 .hasSuffix("com") {
    print("str7是顶级域名")
}
/*
判断前后缀
OC:
NSString *str = @"http://ios.itcast.cn";
if ([str hasPrefix:@"http"]) {
NSLog(@"是url");
}

if ([str hasSuffix:@".cn"]) {
NSLog(@"是天朝顶级域名");
}
*/




//大小写转化
var str8 = "abc.txt"
print("小写转大写:",str8.uppercaseString)
print("大写转小写:",str8.uppercaseString.lowercaseString)
/*
大小写转换
OC:
NSString *str = @"abc.txt";
NSLog(@"%@", [str uppercaseString]);
NSLog(@"%@", [str lowercaseString]);
*/



//转换为基本数据类型(注意拆装包,好好研究)
var str9 = "123"
// 如果str不能转换为整数, 那么可选类型返回nil
// str = "250sb" 不能转换所以可能为nil
var number : Int? = Int(str9)
if number != nil {
    // 以前的版本println会自动拆包, 现在的不会
    print("number:",number!)
}
/*
转换为基本数据类型
OC:
NSString *str = @"250";
NSInteger number = [str integerValue];
NSLog(@"%tu", number);
*/


