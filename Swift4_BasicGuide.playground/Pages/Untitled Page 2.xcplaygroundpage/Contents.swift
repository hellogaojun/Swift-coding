//: [Previous](@previous)

import Foundation


class Person: NSObject {
    let name: String
//    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

//由于可选类型的变量会被自动初始化为一个 nil 值，目前还不会 引用到 Person 类的实例。
var reference1: Person?
var reference2: Person?
var reference3: Person?

//gj is being initialized
reference1 = Person(name: "gj")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
//当所有强引用被断开时,Person被销毁:gj is being deinitialized
reference3 = nil

//类之间的强循环引用
class Apartment: NSObject {
    let unit: String
    var person: Person?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
    
}

//: [Next](@next)
