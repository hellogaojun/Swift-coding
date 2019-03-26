//
//  swiftFourTests.swift
//  swiftFourTests
//
//  Created by gaojun on 2019/1/2.
//  Copyright © 2019年 gaojun. All rights reserved.
//

import XCTest
@testable import swiftFour

class swiftFourTests: XCTestCase {
    var p1: Person?
    var p2: Person?
    var p3: Person?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPersonReference() {
        p1 = Person(name: "gaojun")
        p2 = p1
        p3 = p2
        
        p1 = nil
        p2 = nil
        p3 = nil;
    }
    
    func testStrongReference() {
        //MARK:weak
//        var john: Person?
//        var unit4A: Apartment?
//
//        john = Person(name: "hh")
//        unit4A = Apartment(unit: "4A")
//
//        john!.apartment = unit4A
//        unit4A!.tenant = john
//
//        john = nil
//        unit4A = nil
        
        //MARK:unowned one
//        var john: Customer?
//        john = Customer(name: "john")
//        john!.card = CreditCard(number: 123456789,customer: john!)
//
//        john = nil
        
         //MARK:unowned two
        let country = Country(name: "China",capitalName: "Beijing")
        print("\(country.name)'s capital city is called \(country.capitalCity.name)")
    }
    
    func testClosureStrongReference() {
        let paragraph: HTMLElement? = HTMLElement(name: "p",text: "hello world")
        print(paragraph!.asHTML())
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
