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
        //2.从语境中推断类型 省略 () ->返回值
        reversedNames = names.sorted(by: {s1,s2 in return s1 > s2})
        print(reversedNames)
        //3.单表达式闭包隐式返回 省略 () ->返回值 return
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

//在Playground中进行测试的
/**
 //捕获值
 //一个闭包能够从上下文捕获已被定义的常量和变量。即使定义这些常量和变量的原作用域已 经不存在，闭包仍能够在其函数体内引用和修改这些值。
 
 func makeIncrement(forIncrement amount: Int) -> () -> Int {
 var runningTotal  = 0
 func increment() -> Int {
 runningTotal += amount
 return runningTotal;
 }
 
 return increment
 }
 
 let incrementByFive = makeIncrement(forIncrement: 5)
 incrementByFive()
 incrementByFive()
 incrementByFive()
 
 let incrementBySeven = makeIncrement(forIncrement: 7)
 incrementBySeven()
 
 incrementByFive()
 
 //闭包是引用类型
 let alsoIncrementByFive = incrementByFive
 alsoIncrementByFive()
 
 //逃逸闭包
 //当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了，因为它可以在 函数返回之后被调用。当你声明一个接受闭包作为形式参数的函数时，你可以在形式参数前 写 @escaping 来明确闭包是允许逃逸的。
 var completionHandlers: [() -> Void] = []
 func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
 completionHandlers.append(completionHandler)
 }
 
 //非逃逸闭包
 func someFunctionWithNonEscaping(closure: () -> Void) {
 closure()
 }
 
 class SomeClass {
 var x = 10
 func doSomething() {
 //让闭包 @escaping 意味着你必须在闭包中显式地引用 self
 someFunctionWithEscapingClosure {
 self.x = 100
 }
 
 //传给 someFunctionWithNonescapingClosure(_:) 的闭包是非逃逸闭包，也 就是说它可以隐式地引用 self 。
 someFunctionWithNonEscaping {
 x = 200
 }
 }
 
 }
 
 let instance = SomeClass()
 instance.doSomething()
 print(instance.x)
 
 completionHandlers.first?()
 print(instance.x)
 
 //自动闭包
 //自动闭包是一种自动创建的用来把作为实际参数传递给函数的表达式打包的闭包。它不接受 任何实际参数，并且当它被调用时，它会返回内部打包的表达式的值。
 //自动闭包允许延时处理,自动闭包内部的代码直到你调用它的时候才会运行
 
 var customersInLine = ["Apple","Orange","Watermelon","banana","tomato"]
 print(customersInLine.count)
 
 //省略部分:() -> String in return
 let customerProvider = {customersInLine.remove(at: 0)}
 print(customersInLine.count)
 
 print("New fruit0 \(customerProvider())")
 print(customersInLine.count)
 //参数类型为:一个明确有返回值类型的闭包
 func serve(customer customerProvider: () -> String) {
 print("New fruit1 \(customerProvider())")
 }
 //serve { () -> String in
 //
 //}
 serve(customer: {customersInLine.remove(at: 0)})
 
 //参数类型为:使用 @autoclosure标记该形式参数 使用自动闭包
 func serve2(customer customerProvider: @autoclosure () -> String) {
 print("New fruit2 \(customerProvider())")
 }
 //现在你可以调用函数就像它接收了一个 String 实际参数 而不是闭包。实际参数自动地转换为闭包，因为 customerProvider 形式参数的类型被标记为 @autoclosure 标记。
 serve2(customer: customersInLine.remove(at: 0))
 
 
 //普通实现||
 func OR(left: Bool,right: Bool) -> Bool {
 if left {
 return true
 } else {
 return right
 }
 }
 
 //使用@autoclosure标志实现||的优化
 func OR2(left: Bool,right: @autoclosure () -> Bool) -> Bool {
 if left {
 return true
 } else {
 return right()
 }
 }
 
 ///也可以同时使用@autoclosure,@escaping设置(自动) (逃逸) 闭包
 */
