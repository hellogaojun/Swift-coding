//
//  main.swift
//  12-内存管理
//
//  Created by gaojun on 16/4/2.
//  Copyright © 2016年 高军. All rights reserved.
//

import Foundation

print("Hello, World!")

//------------------------------------------内存相关-----------------------------//

/*
Swift内存管理:
管理引用类型的内存,不会管理值类型,值类型不需要管理
内存管理原则:当没有任何强引用指向对象,系统会自动销毁对象
(默认情况下所有的引用都是强引用)
如果做到该原则:ARC
*/

//默认强引用
class Person {
    var name : String
    init(name : String) {
        print("对象初始化---init")
        self.name = name
    }
    
    deinit {
        print("对象被销毁---deinit")
    }
}

var p : Person? = Person(name: "gaojun")    //对象初始化---init(p持有一个强引用)
print("p name : \(p!.name)")
p = nil //对象被销毁---deinit（当没有任何强引用指向对象,系统会自动销毁对象）
if let pp = p {
    print("p name : \(p!.name)")
}else {
    print("空")  //空
}


//weak弱引用
class Person1 {
    var name : String
    init(name : String) {
        print("对象初始化---init")
        self.name = name
    }
    
    deinit {
        print("对象被销毁---deinit")
    }
}

//弱引用
//如果利用weak修饰变量,当对象释放后会自动将变量设置为nil
//所以利用weak修饰的变量必定是一个可选类型,因为只有可选类型才能设置为nil
weak var p1 : Person1? = Person1(name: "gaojun")
if let pp1 = p1 {
    print("p1 name : \(p1!.name)")
}else {
    print("空")  //空
}


if let p = p1 {
    print("p:\(p)")
}else {
    print("p1:\(p1)")   //nil
}

/*
unowned无主引用,相当于OC unsafe_unretained
unowned和weak的区别:
1,利用unowned修饰的变量,对象释放后不会设置为nil,不安全
  利用weak修饰的变量,对象释放后会设置为nil
2,利用unowned修饰的变量,不是可选类型
  利用weak修饰的变量,是可选类型
weak和unowned的使用时机???
*/
class Person2 {
    var name : String
    init(name : String) {
        print("对象初始化---init")
        self.name = name
    }
    
    deinit {
        print("对象被销毁---deinit")
    }
}
unowned var p2 : Person2 = Person2(name: "高军")
//print("p2 name :\(p2.name)") //崩溃,p2不持有引用

/*
循环引用
ARC不是万能的,它可以很好的解决内存问题,但是在某些场合下不能很好的解决内存泄露问题
例如两个或多个对象之间的循环引用问题
*/
//1.weak修饰
class Apartment {
    var number : Int    //房间号
    var tenant : People?    //租客
    
    init (number : Int) {
        print("Apartment 被初始化啦")
        self.number = number
    }
    deinit {
        print("Apartment被销毁啦")
    }
}

class People {
    var name : String   //姓名
    weak var apartment : Apartment?  //公寓
    init(name : String) {
        print("People被初始化啦")
        self.name = name
    }
    deinit {
        print("People被销毁啦")
    }
}

var people : People? = People(name: "高军")
var apartment : Apartment? = Apartment(number: 98)

//下面两句将会造成people和apartment的循环引用（为打破循环,考虑一使用weak修饰apartment或tenant）
people!.apartment = apartment
apartment!.tenant = people

//此时经过下面两句,people和apartment也不会释放
people = nil
apartment = nil

//2.unowned修饰
class Student {
    var name : String   //姓名
    var card : Card?    //饭卡(不一定有)
    init(name : String) {
        print("Student被初始化啦")
        self.name = name
    }
    deinit {
        print("Student被销毁啦")
    }
}

class Card {
    let number : Int
    
    //当某一个变量或常量必须有值,一直有值,那么可以使用unowned修饰
    unowned let student : Student   //饭卡必须有所属用户
    init(number : Int, student : Student) {
        print("Card被初始化啦")
        self.number = number
        self.student = student
    }
    deinit {
        print("Crad被销毁啦")
    }
}

//初始化对象
var student : Student? = Student(name: "gaojun")
var card : Card? = Card(number: 666, student: student!)
student!.card = card

//释放对象
student = nil
card = nil

