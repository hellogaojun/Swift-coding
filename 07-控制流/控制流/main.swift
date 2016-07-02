//
//  main.swift
//  控制流
//
//  Created by gaojun on 16/4/2.
//  Copyright © 2016年 高军. All rights reserved.
//

import Foundation

print("Hello, World!")

//---------------------if---------------------------------//
/*
if语句基本使用
OC:
int age1 = 10;
int age2 = 20;
int max;
max = age2;
if (age1 > age2) {
max = age1;
}
NSLog(@"%d", max);

if (age1 > age2) {
max = age1;
}else
{
max = age2;
}
NSLog(@"%d", max);

如果只有一条指令if后面的大括号可以省略

Swift:
if 条件表达式 {指令}   if 条件表达式 {指令} else{指令}
0.if后的圆括号可以省略
1.只能以bool作为条件语句
2.如果只有1条指令if后面的大括号不可以省略
*/

var age1:Int = 12
var age2:Int = 34
var max:Int
max = age2;
if age1 > age2
{
    max = age1
}
print(max)

if age1 > age2
{
    max = age1;
}else
{
    max = age2;
}
print(max)

/*
多分支
OC:
float score = 99.9;
if (score >= 90) {
NSLog(@"优秀");
}else
{
if (score >= 60) {
NSLog(@"良好");
}else
{
NSLog(@"不给力");
}
}

if (score >= 90) {
NSLog(@"优秀");
}else if (score >= 60)
{
NSLog(@"良好");
}else
{
NSLog(@"不给力");
}
*/

var score = 99.9;
if score >= 90
{
    print("优秀")
}else if score >= 60
{
    print("良好")
}else
{
    print("不给力")
}

//---------------------while------------------------------//
/*
while循环
格式:while(循环保持条件){需要执行的语句}
OC:
int i = 0;
int sum = 0;
while (i <= 10) {
sum = i++;
}

while (i <= 10)
sum = i++;

NSLog(@"%d", sum);
如果只有一条指令while后面的大括号可以省略

Swift:
0.while后的圆括号可以省略
1.只能以bool作为条件语句
2.如果只有条指令while后面的大括号不可以省略
*/

var i:Int = 0
var sum:Int = 0
while (i <= 10)
{
    sum = i++
}
print("\(sum)")

var i1:Int = 0
var sum1:Int = 0
while i1 <= 10
{
    sum1 = i1++
}
print("\(sum1)")

/*
do while循环
格式:do while(循环保持条件) {需要执行的语句}
OC:
int i = 0;
int sum = 0;
do {
sum = i++;
} while (i <= 10);
NSLog(@"%d", sum);

int i = 0;
int sum = 0;
do
sum = i++;
while (i <= 10);
NSLog(@"%d", sum);
如果只有一条指令if后面的大括号可以省略

Swift2.0之后变为 repeat while, do用于捕捉异常
0.while后的圆括号可以省略
1.只能以bool作为条件语句
2.如果只有条指令do后面的大括号不可以省略
*/

var i2:Int = 0
var sum2:Int = 0
repeat{
    sum2 = i2++;
}while(i2 <= 10)
print(sum2)

var i3:Int = 0
var sum3:Int = 0
repeat{
    sum3 = i3++;
}while i3 <= 10
print(sum3)

//----------------------for-------------------------------//
/*
for循环
格式: for (初始化表达式;循环保持条件;循环后表达式) {需要执行的语句}
OC:
int sum = 0;
for (int i = 0; i <= 10; i++) {
sum = i++;
}
NSLog(@"%d", sum);

int sum = 0;
int i = 0;
for (; i <= 10; i++) {
sum = i++;
}
NSLog(@"%d", sum);

int sum = 0;
int i = 0;
for (; i <= 10; ) {
sum = i++;
i++;
}
NSLog(@"%d", sum);


int sum = 0;
int i = 0;
for ( ; ; ) {
sum = i++;
i++;
if (i > 10) {
break;
}
}
NSLog(@"%d", sum);

int sum = 0;
int i = 0;
for ( ; ; ) {
sum = i++;
i++;
NSLog(@"%d", sum);
}
如果只有一条指令for后面的大括号可以省略
for后面的三个参数都可以省略, 如果省略循环保持语句, 那么默认为真


Swift:
0.for后的圆括号可以省略
1.只能以bool作为条件语句
2.如果只有条指令for后面的大括号不可以省略
3.for后面的三个参数都可以省略, 如果省略循环保持语句, 那么默认为真

*/
var s:Int = 0
for var i = 0 ; i <= 10 ; i++
{
    s = i++
}
print(s)

var s1:Int = 0
var a1 = 0
for  ; a1 <= 10 ; a1++
{
    s = a1++
}
print(sum1)

var s2:Int = 0
var a2 = 0
for ; a2 <= 10;
{
    s2 = a2++
    a2++
}
print(s2)


var s3:Int = 0
var a3 = 0
for ; ;
{
    s3 = a3++
    a3++
    if a3 > 10
    {
        break
    }
}
print(s3)


/*
for in循环
格式: for (接收参数 in 取出的参数) {需要执行的语句}
for in含义: 从(in)取出什么给什么, 直到取完为止
OC:
for (NSNumber *i  in @[@1, @2, @3, @4, @5]) {
NSLog(@"%@", i);
}

NSDictionary *dict = @{@"name":@"lnj", @"age":@30};
for (NSArray *keys  in dict.allKeys) {
NSLog(@"%@", keys);
}

NSDictionary *dict = @{@"name":@"lnj", @"age":@30};
for (NSArray *keys  in dict.allValues) {
NSLog(@"%@", keys);
}

Swift:
for in 一般用于遍历区间或者集合
*/

var sum4:Int = 0
for i4 in 1...10 // 会将区间的值依次赋值给i
{
    sum4 += i4;
}
print(sum4)

for dict in ["name":"lnj", "age":30]
{
    print(dict);
}

for (key, value) in ["name":"lnj", "age":30]
{
    print("\(key) = \(value)")
}

//----------------------switch-----------------------------//
/*
Swith
格式: switch(需要匹配的值) case 匹配的值: 需要执行的语句 break;
OC:
char rank = 'A';
switch (rank) {
case 'A':
NSLog(@"优");
break;
case 'B':
NSLog(@"良");
break;
case 'C':
NSLog(@"差");
break;
default:
NSLog(@"没有评级");
break;
}

可以穿透
char rank = 'A';
switch (rank) {
case 'A':
NSLog(@"优");
case 'B':
NSLog(@"良");
break;
case 'C':
NSLog(@"差");
break;
default:
NSLog(@"没有评级");
break;
}

可以不写default
char rank = 'A';
switch (rank) {
case 'A':
NSLog(@"优");
break;
case 'B':
NSLog(@"良");
break;
case 'C':
NSLog(@"差");
break;
}

default位置可以随便放
char rank = 'E';
switch (rank) {
default:
NSLog(@"没有评级");
break;
case 'A':
{
int score = 100;
NSLog(@"优");
break;
}
case 'B':
NSLog(@"良");
break;
case 'C':
NSLog(@"差");
break;
}


在case中定义变量需要加大括号, 否则作用域混乱
char rank = 'A';
switch (rank) {
case 'A':
{
int score = 100;
NSLog(@"优");
break;
}
case 'B':
NSLog(@"良");
break;
case 'C':
NSLog(@"差");
break;
}

不能判断对象类型
NSNumber *num = @100;
switch (num) {

case @100:
NSLog(@"优");
break;
default:
NSLog(@"没有评级");
break;
}
*/

/*
Swift: 可以判断对象类型, OC必须是整数
*/
//不可以穿透
//可以不写break,
var rank = "A"
switch rank{
case "A": //相当于if
    print("优")
case "B": // 相当于else if
    print("优")
case "C": // 相当于else if
    print("优")
default: // 相当于else
    print("没有评级")
}

/*
因为不能穿透所以不能这么写
var rank1 = "A"
switch rank1{
case "A":
case "B":
print("优")
case "C":
print("优")
default:
print("没有评级")
}
*/

//只能这么写
var rank1 = "A"
switch rank1{
case "A", "B": // 注意OC不能这样写
    print("优")
case "C":
    print("差")
default:
    print("没有评级")
}

/*
//不能不写default
var rank2 = "A"
switch rank2{
case "A":
print("优")
case "B":
print("良")
case "C":
print("差")
}
*/

/*
//default位置只能在最后
var rank3 = "A"
switch rank3{
default:
print("没有评级")
case "A":
print("优")
case "B":
print("良")
case "C":
print("差")
}
*/

//在case中定义变量不用加大括号
var rank4 = "A"
switch rank4{
case "A":
    var num = 10
    print("优")
case "B":
    print("良")
case "C":
    print("差")
default:
    print("没有评级")
}

/*
区间和元祖匹配
var num = 10;
switch num{
case 1...9:
print("个位数")
case 10...99:
print("十位数")
default:
print("其它数")

}


var point = (10, 15)
switch point{
case (0, 0):
print("坐标在原点")
case (1...10, 10...20): // 可以在元祖中再加上区间
print("坐标的X和Y在1~10之间")
case (_, 0): // X可以是任意数
print("坐标的X在X轴上")
default:
print("Other")
}
*/


/*
值绑定
var point = (1, 10)
switch point{
case (var x, 10): // 会将point中X的值赋值给X
print("x= \(x)")
case (var x, var y): // 会将point中XY的值赋值给XY
print("x= \(x) y= \(y)")
case var( x, y):
print("x= \(x) y= \(y)")
default:
print("Other")
}

根据条件绑定
var point = (100, 10)
switch point{
// 只有where后面的条件表达式为真才赋值并执行case后的语句
case var(x, y) where x > y:
print("x= \(x) y= \(y)")
default:
print("Other")
}
*/

//----------------------break-continue---------------------//
/*
break: 跳出循环, 无论循环保持条件是否还为真都不会再执行循环
continue: 跳出本次循环, 如果循环保持条件还为真还会继续执行循环

OC:
NSArray *arr = @[@1,@3, @5, @7, @8];
for (NSNumber *num in arr) {
if ([num isEqualTo:@(7)]) {
NSLog(@"找到幸运数字");
break;
}
NSLog(@"没有找到幸运数字");
}

NSArray *arr = @[@1,@3, @5, @7, @8];
int count = 0;
for (NSNumber *num in arr) {
if (num.intValue % 2 != 0 ) {
NSLog(@"不能被2整除");
continue;
}
NSLog(@"能被2整除");
count++;
}
NSLog(@"count = %d", count);
*/

var arr:Array<Int> = [1, 3, 5, 7, 8]
for num in arr{
    if num == 7
    {
        print("找到幸运数字")
        break
    }
    print("没有找到幸运数字")
}

var arr1:Array<Int> = [1, 3, 5, 7, 8]
var count:Int = 0
for num in arr1{
    if num % 2 != 0
    {
        print("不能被2整除")
        continue
    }
    print("能被2整除")
    count++
}
print("count = \(count)")

