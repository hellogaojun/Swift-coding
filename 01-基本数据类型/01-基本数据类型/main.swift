//
//  main.swift
//  01-基本数据类型
//
//  Created by gaojun on 16/4/2.
//  Copyright © 2016年 高军. All rights reserved.
//

import Foundation

print("Hello, World!")

/*
基本数据类型
OC:
整型  int intValue = 10;
浮点型 double doubleValue = 10.10; float floatValue = 5.1;
长 long
短 short
有符号 signed
无符号 unsigned
各种类型的数据的取值范围在不同位的编译器下取值范围不同

Swift:注意关键字大写
*/


//整型
var intValue = 10

//浮点型
var floatValue : Float = 12.4   //32位浮点数
var doubleValue : Double = 12.45    //64位浮点数

//如果按照长度划分,swift中的长短比OC更加精确
var value1 : Int8 = 8
var value2 : Int16 = 16
var value3 : Int32 = 32
var value4 : Int64 = 64

//有符号无符号
var uintValue : UInt = 12
//注意:无符号的数比有符号的数存储范围大，因为符号位也用来存值

var test : UInt = UInt.max + 1

var test1 : Int = INT_MAX + 1

floatValue = doubleValue


//Swift是类型安全的语言, 如果取值错误会直接报错, 而OC不会
/*
取值不对
OC:unsigned int intValue = -10; 不会报错
Swift:var intValue:UInt = -10 会报错
溢出:
OC:int intValue = INT_MAX + 1; 不会报错
Swift:var intValue:UInt = UInt.max + 1 会报错
*/

/*
数据类型的相互赋值(隐式类型转换)
OC可以
int intValue = 10;
double doubleValue = intValue;

Swift:不可以
var intValue:Int = 10
var doubleValue:Double = intValue
在Swift中“值永远不会被隐式转换为其他类型”(OC中可以隐式类型转换), 以上语句会报错
*/

print(floatValue)

