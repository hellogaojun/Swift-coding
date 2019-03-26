//
//  ARC.swift
//  swiftFour
//
//  Created by gaojun on 2019/1/7.
//  Copyright © 2019年 gaojun. All rights reserved.
//

import Foundation
//自动引用计数
///引用计数只应用于类的实例.结构体和枚举是值类型,不是引用类型,没有通过引用存储和传递.

//MARK:weak
//Scene One:Person 和 Apartment 的例子展示了两个属性的值都允许为 nil ，并会潜在的产生循环强引用。这种场景最适合用弱引用来解决。

class Person: NSObject {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

class Apartment: NSObject {
    let unit: String
    //weak打破循环强引用
    weak var tenant:Person?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("\(unit) is being deinitialized")
    }
    
}

//和弱引用类似，无主引用不会牢牢保持住引用的实例。但是不像弱引用，总之，无主引用假定是永远有值的。因此，无主引用总是被定义为非可选类型。你可以在声明属性或者变量时，在前面加上关键字 unowned 表示这是一个无主引用。

//MARK:unowned
//Scene Two:Customer 和 CreditCard 的例子展示了一个属性的值允许为 nil ，而另一个属性的值不允许 为 nil ，这也可能导致循环强引用。这种场景最好使用无主引用来解决。
class Customer: NSObject {
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard: NSObject {
    let number: UInt64
    //unowned打破循环强引用
    unowned let customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.customer = customer;
        self.number = number
    }
    
    deinit {
         print("Card \(number) is being deinitialized")
    }
}

//MARK:unowned
//Scene Three:在这种场景中，两个属性都必须有值，并且初始化完成后永远不会为 nil 。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式展开的可选属性。

class Country: NSObject {
    let name: String
    var capitalCity: City!
    
    init(name: String,capitalName: String) {
        self.name = name
        //'self' used before 'super.init' call
        super.init()
        self.capitalCity = City(name: capitalName, country: self)
    }
    
    deinit {
        print("country \(name) is is being deinitialized")
    }
}

class City: NSObject {
    let name: String
    unowned let country: Country
    
    init(name: String,country:Country) {
        self.name = name
        self.country = country
    }
    
    deinit {
        print("city \(name) is is being deinitialized")
    }
}


//MARK:closure cycle reference
//定义捕获列表作为闭包的定义来解决在闭包和类实例之间的循环强引用.捕获列表定义了当在闭包体里捕获一个或多个引用类型的规则。
//在闭包和捕获的实例总是互相引用并且总是同时释放时，将闭包内的捕获定义为无主引用。
//如果被捕获的引用永远不会变为 nil ，应该用无主引用而不是弱引用。
//具体情况根据编译器提示吧😄

class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        //用无主引用而不是强引用来捕获 self
        [unowned self] in
        
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}




