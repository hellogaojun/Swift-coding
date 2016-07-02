//
//  main.swift
//  02-常量变量
//
//  Created by gaojun on 16/4/2.
//  Copyright © 2016年 高军. All rights reserved.
//

import Foundation

/*
输出:
C: printf("Hello, World!");
OC:NSLog(@"Hello, World!");
Swift1.2:println("Hello, World!")
Swift2.0:print("Hello, World!")
*/
print("Hello, World!")

/*
“使用let来声明常量，使用var来声明变量”

变量:
OC:
>先定义再初始化
int num;
num = 10;

>定义的同时初始化
int num2 = 20;

Swift:
>先定义再初始化
var num
报错: 没有指定数据类型(type annotation missing in pattern), 在Swift中如果想要先定义一个变量, 以后使用时再初始化必须在定义时告诉编译器变量的类型(类型标注)
*/

/*
>定义的同时初始化
在Swift中如果定义的同时初始化一个变量,可以不用写数据类型, 编译期会根据初始化的值自动推断出变量的类型(其它语言是没有类型推断的)
以后在开发中如果在定义的同时初始化就没有必要指定数据类型, 除非需要明确数据类型的长度或者定义时不初始化才需要指定数据类型
*/


//变量
var value1 :Int
value1 = 10

var value2:Float = 34

var value3 = 32

var 变量 = 7

//常量
let value4:Float = 2

let value5 = 4

//下面这种表示错误(定义常量时必须初始化)
//let value6
//value6 = 12

//常量:
//OC: const int num = 10;
//Swift: let num = 10
//
//错误:
//let num : Int
//Swift中的常量必须在定义时初始化(OC可以不初始化), 否则会报错
//常量的用途: 某些值以后不需要改变, 例如身份证
//*/
let 常量 = 9

print(变量,常量)


