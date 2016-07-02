//
//  main.swift
//  13-内部参数与外部参数
//
//  Created by gaojun on 16/4/11.
//  Copyright © 2016年 高军. All rights reserved.
//

import Foundation

print("Hello, World!")

//--------------------------内(外)部参数---------------------------------------------
/*
内部参数: 默认情况下的参数都是内部参数
外部参数: 如果有多个参数的情况, 调用者并不知道每个参数的含义, 只能通过查看头文件的形式理解参数的含义
那么能不能和OC一样让调用者直观的知道参数的含义呢? 使用外部参数
外部参数只能外部用, 函数内部不能使用, 函数内部只能使用内部参数
*/

//第二个参数开始默认既是外部又是内部（第一个是内部参数）
func mul(num1 : Int, num2 : Int) -> Int {
    return num1 * num2
}

print("mul:",mul(2,num2: 3))

//外部参数只能外部用, 函数内部不能使用, 函数内部只能使用内部参数
func add(fisrt num1 : Double, second num2 : Double) -> Double {
    return num1 + num2
}
print("add :",add(fisrt: 4, second: 7))

//'#'has been removed from Swift(下面这种写法过时了)
//func sub(#num1 : Double, #num2 : Double) -> Double {
//    
//}


/*
默认参数:可以在定义函数的时候给某个参数赋值,当外部没有传递该参数时会自动使用默认值
*/

//1.没有默认参数
func joinString1(s1 : String, toString s2 : String, joiner s3 : String) -> String {
    return s1 + s2 + s3
}
print("joinString1 :",joinString1("Hi", toString: " gaojun", joiner: " happy "))

//2.有默认参数
func joinString2(s1 : String, toString s2 : String, joiner s3 : String = " fuck") -> String {
    return s1 + s2 + s3
}

//当外部没有传递该参数时会自动使用默认值joiner = " fuck"
print("joinString2 :",joinString2("Hi",toString: " gaojun"))
//当外部传递该参数时,会使用传递的值joiner = " haha"
print("joinString2 :",joinString2("Hehe",toString: " gaojun ",joiner: "haha"))

//3.默认参数的位置可以随便放
func joinString3(s1 : String, toString s2 : String = " fuck ", joiner s3 : String) -> String {
    return s1 + s2 + s3
}
print("joinStirng3 :",joinString3("Hi",joiner : "hehe"))

//4.如果指定了默认参数, 但是却没有声明外部参数时, 系统会自动把内部参数名称既作为内部参数也作为外部参数名称, 并且在调用时如果需要修改默认参数的值必须写上外部参数名称
func joinString4(s1 : String, toString s2 : String = " fuck ", s3 : String) -> String {
    return s1 + s2 + s3
}
print("joinString4 :",joinString4("Hi",toString: " gaojun ",s3: " s3"))


/*
常量参数和变量参数:
默认情况下Swift中所有函数的参数都是常量参数,如果想在函数中修改参数,必须在参数前加上var
*/
func swap(var a : Int, var b : Int) {
    print("交换前 a = \(a) b = \(b)")
    let temp = a;
    a = b;
    b = temp;
    print("交换后 a = \(a) b = \(b)")
}
swap(3, b: 13)

/*
inout参数,如果想在函数中修改外界传入的参数,可以将参数的var换成inout，这会传递参数本身而不是参数的值
*/
func swap3(inout a:Int, inout b:Int)
{
    let temp = a;
    a = b;
    b = temp;
}
var x1 = 10;
var y1 = 20;
print("交换前 a = \(x1) b = \(y1)")
swap3(&x1, b: &y1)
print("交换后 a = \(x1) b = \(y1)")


/*
变参函数:
如果没有变参函数,并且函数的参数个数又不确定,那么只能写多个方法或者将函数参数改为集合
变参只能放到参数列表的最后一位,变参必须指定数据类型,变参只能是同种类型的数据
*/

func add(num1:Int, num2:Int, num3:Int) -> Int
{
    let sum = num1 + num2 + num3
    return sum
}
print(add(1, num2: 2, num3: 3))

func add(nums : [Int]) -> Int {
    var sum = 0
    for num in nums {
        sum += num
    }
    return sum
}

print(add([1,2,3]))

func add(nums : Int...) -> Int {
    var sum = 0
    for num in nums {
        sum += num
    }
    return sum
}

print(add(1,2,3))

func add(others : Int, nums : Int...) -> Int {
    var sum = 0
    for num in nums {
        sum += num
    }
    return sum > others ? sum : others
}
print(add(45, nums: 1,2,3))//会将45传递给第一个参数,后面的传递给nums




