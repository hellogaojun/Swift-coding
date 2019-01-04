//
//  Closure.swift
//  swiftFour
//
//  Created by gaojun on 2019/1/4.
//  Copyright © 2019年 gaojun. All rights reserved.
//

import Foundation
class Closure: NSObject {
    
   class func test() {
        
        ///闭包
        //闭包符合下列三种形式中的一种:
        //1.全局函数是一个有名字但不会捕获任何值的闭包;
        //2.内嵌函数是一个有名字且能从其上层函数捕获值的闭包;
        //3.闭包表达式是一个轻量级语法所写的可以捕获其上下文中常量或变量值的没有名字的 闭包。
        
        //定义闭包:{(参数列表) -> 返回值 in 操作表达式}
        //0.无参数无返回值
        var test = {() -> Void in }
        
        //1.有参数无返回值
        var successClosure: ([String:Any]) -> Void = {(result:[String:Any]) -> Void in
            print(result)
        }
        
        successClosure(["data":"shfdjsf"])
        
        //2.有参数有返回值
        var sum = {(num1: Int,num2: Int) -> Int in
            return num1 + num2
        }
        
        sum(2,3)
        
        var names: [String] = ["Tom","Mike","Jack","Jobs","Steams"]
        //闭包的几种可能写法(闭包表达式优化):
        //1.正常写法
        var reversedNames: [String] = names.sorted { (s1: String, s2: String) -> Bool in
            return s1 > s2
        }
        print(reversedNames)
        //2.从语境中推断类型 省略 {} ->返回值
        reversedNames = names.sorted(by: {s1,s2 in return s1 > s2})
        print(reversedNames)
        //3.单表达式闭包隐式返回 省略 {} ->返回值 return
        reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
        print(reversedNames)
        //4.简写实际参数名
        reversedNames = names.sorted(by: {$0 > $1})
        print(reversedNames)
        //5.通过运算符函数
        reversedNames = names.sorted(by: >)
        print(reversedNames)
        //names.sorted(by: T##(String, String) throws -> Bool)
        
        //尾随闭包
        //闭包表达式作为函数的最后一个参数
        func someFunction(num: Int,closure: () -> Void) {
            closure()
        }
        
        print("xixiixiixiixi")
        //尾随闭包是一个被书写在函数形式参数的括号外面(后面)的闭包 表达式
        someFunction(num: 6) {
            print("哈哈哈")
        }
        
        //note:如果闭包表达式被用作函数唯一的实际参数并且你把闭包表达式用作尾随闭包，那么
        //调用这个函数的时候你就不需要在函数的名字后面写一对圆括号 ()。
        func someFunc2(closure: () -> Void) {
            closure()
        }
        someFunc2 {
            print("😄👌")
        }
        
    }
    
    
}
