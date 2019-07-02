//
//  ViewController.swift
//  swiftFour
//
//  Created by gaojun on 2019/1/2.
//  Copyright © 2019年 gaojun. All rights reserved.
//

import UIKit
///观察下面枚举的内存布局
enum TestEnum1 {
    case test0
    case test1
    case test2
    case test4(Int)
    case test5(Int, Int)
    case test6(Int, Int, Int, Bool)
}

enum TestEnum2 {
    case test0
    case test1
    case test2
    case tes4(Int)
    case test5(Int,Int)
    case test6(Int, Int, Bool, Int)
}

enum testEnum3 {
    case test0
    case test1
    case test2
    case test4(Int)
    case test5(Int, Int)
    case test6(Int, Bool, Int)
}


class ViewController: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //String,Array,Dictionary,Set在Swift中都是结构体类型,Swift标准库为了提升性能,采用了Copy On Write技术
        //仅当有写操作时,才会真正执行拷贝操作
        let _: String = "hhh"
        let _: Array = [1,2,3]
        let _: Dictionary = ["name":"hhh"]
        let _: Set = [1,2,3]
        
    }

    func testStruct() {
        struct Point {
            var x: Int
            var y: Int
            
            init() {
                x = 0
                y = 0
            }
        }
        
        var p = Point()
    }
}

