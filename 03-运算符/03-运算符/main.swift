//
//  main.swift
//  03-运算符
//
//  Created by gaojun on 16/4/2.
//  Copyright © 2016年 高军. All rights reserved.
//

import Foundation

print("Hello, World!")

/*
算术运算符: 除了取模, 其它和OC一样, 包括优先级
+ - * / % ++ --
*/

var result = 10 + 10
result = 10 * 10
result = 10 - 10
result = 10 / 10
print(result)

/*
取模 %
OC: 只能对整数取模
NSLog(@"%tu", 10 % 3);

Swift: 支持小数取模
*/
print(10 % 3.2)


/*
注意:Swift是安全严格的编程语言, 会在编译时候检查是否溢出, 但是只会检查字面量而不会检查变量, 所以在Swift中一定要注意隐式溢出
可以检测
var num1:UInt8 = 255 + 1;
无法检测
var num1:UInt8 = 255
var num2:UInt8 = 250
var result = num1 + num2
println(result)

遇到这种问题可以利用溢出运算符解决该问题:http://www.yiibai.com/swift/overflow_operators.html

&+ &- &* &/ &%
*/

//var over1 : UInt8 = 255
//var over2 : UInt8 = 250
//var result1 = over1 + over2
//print(result1)

//自增,自减
var number = 10
number++
print(number)
number--
print(number)

//赋值运算符
var num1 = 10
num1 = 20
num1 += 10
num1 -= 10
num1 *= 10
num1 /= 10
num1 %= 10
print(num1)

//关系运算符
var res:Bool = 123 > 12
print(res)//true

var res2 = 123 > 12 ? 123:12
print(res2)

//逻辑运算符,Swift中的逻辑运算符只能操作Bool类型数据, 而OC可以操作整形(非0即真

//if 5 {//错误写法
//    print("5")
//}

var open = false
if !open {
    print("开房")
}else {
    print("开你个头")
}

var age = 25
var height = 185
var wage = 30000
if age > 25 && age < 40 && height > 175 || wage > 20000 {
    print("约炮")
}else {
    print("约你个蛋")
}

/*
区间
闭区间: 包含区间内所有值  a...b 例如: 1...5
半闭区间: 包含头不包含尾  a..<b  例如: 1..<5
注意: 1.Swift刚出来时的写法是 a..b
2.区间只能用于整数, 写小数会有问题
应用场景: 遍历, 数组等
*/

for i in 1...5 {
    print("闭区间--i:",i)
}

for i in 1..<5 {
    print("半闭区间--i:",i)
}



