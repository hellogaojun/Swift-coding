//
//  ErrorHandler.swift
//  swiftFour
//
//  Created by gaojun on 2019/3/27.
//  Copyright © 2019年 gaojun. All rights reserved.
//

import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case sufficientFunds(coinsNeeded: Int)
    case outOfStock
}


class ErrorHandler: NSObject {
   
    //抛出函数
    //抛出函数可以把它内部抛出的错误传递到它被调用的生效范围之内。
    func canThrowErrors() throws -> String {
        return ""
    }
    
    //1.使用抛出函数传递错误
    //2.使用Do-Catch处理错误
    
}
