//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//01:方法的柯里化
//把接受多个参数的方法变换成接受第一个参数的方法，并且返回接受余下的参数并且返回结果的新方法
func addTwoNumbers(a:Int)(num:Int)(b:Int) ->Int {
    return a + num + b
}

let addToFour = addTwoNumbers(4)
let result = addToFour(num:6)
let result1 = result(b: 12)


func greaterThan(comparor:Int)(input:Int) ->Bool {

    return input > comparor
}


let greaterThan10 = greaterThan(10)
greaterThan10(input: 12)
greaterThan10(input: 8)


//02:Struct Mutable的方法

//使用struct定义一个纯数据类型
struct User {
    var age : Int
    var weight : Float
    var height : Float
    
    //struct出来的变量是Immutable,要想改变变量的值，必须加上一个关键字mutating
    
    //改变变量内容的方法(func前用mutating修饰)
    mutating func setWeight(newWeight:Float) {
        
        weight += newWeight
    }
}

var user = User(age: 24, weight: 62.5, height: 174)
user.setWeight(70)


//03:将protocol的方法声明为mutating
//Swift中的protocol不仅可以被class类型实现,也适用于struct和enum

protocol Vehicle {
    var numberOfWheels : Int {get}
    var color : UIColor {set get}
    
   mutating func changeColor(newColor:UIColor)
}

struct Car:Vehicle {
    let numbefOfWheels = 4
    var color = UIColor.blackColor()
    
    mutating func changeColor(newColor: UIColor) {
        color = newColor
    }
}

var car = Car(color: UIColor.blackColor())
car.changeColor(UIColor.redColor())








