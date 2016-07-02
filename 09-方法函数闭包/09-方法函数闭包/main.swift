//
//  main.swift
//  09-方法函数闭包
//
//  Created by gaojun on 16/4/2.
//  Copyright © 2016年 高军. All rights reserved.
//

import Foundation

print("Hello, World!")

//---------------------------函数------------------------------------//
/*
函数: 完成某个特定任务的代码块, 给代码起一个合适的名称称之为函数名称. 以后需要执行代码块只需要利用函数名称调用即可, 好比每个人都有一个名字, 叫名字就能找到对应的人
格式:
func 函数名称(参数名:参数类型, 参数名:参数类型...) -> 函数返回值 {函数实现部分}

OC:
- (void)say
{
NSLog(@"hello");
}
- (void)sayWithName:(NSString *)name
{
NSLog(@"hello %@", name);
}
- (void)sayWithName:(NSString *)name age:(NSInteger)age
{
NSLog(@"hello %@ , I'm %tu years old", name, age);
}
- (NSString *)info
{
return @"name = lnj, age = 30";
}
- (NSString *)infoWithName:(NSString *)name age:(NSInteger)age
{
return [NSString stringWithFormat:@"name = %@, age = %tu", name, age];
}

Person *p = [[Person alloc] init];
[p say];
[p sayWithName:@"lnj"];
[p sayWithName:@"lnj" age:30];
NSLog(@"%@", [p info]);
NSLog(@"%@", [p infoWithName:@"lnj" age:30]);
*/

//无参无返回值
func eat() -> Void {
    print("eat")
}
eat()

//无参有返回值
func eat() -> String {
    return "吃饭"
}
print("\(eat())")

//有参无返回值
func eat(name : String) -> Void {
    print("eat \(name)")
}
eat("apple")

//有参有返回值
func eat(name : String) -> String {
    return "eat" + " " + name
}
print("\(eat("apple"))")

//函数的嵌套
//遍历数组
func showArray(array : [Int]) {
    for number in array {
        print("array: \(number) ")
    }
}

//交换两个数
func swap(inout num1 : Int,inout num2 : Int) {
    let temp = num1
    num1 = num2
    num2 = temp
}
var num1 = 20
var num2 = 30
swap(&num1, &num2)
print("num1=\(num1),num2=\(num2)")
//10,20
func swap1(inout num1 : Int,inout num2 : Int) {
    num1 = num1 + num2//30
    num2 = num1 - num2//10
    num1 = num1 - num2//20
}

func swap2(inout num1 : Int,inout num2 : Int) {
    num1 = num1 ^ num2
    num2 = num1 ^ num2
    num1 = num1 ^ num2
}

//冒泡排序
func bubbleSort(inout array : [Int]) {
    
    //标志位
    var flag : Bool
    flag = false
    
    
    for var i = 1;i < array.count;i++ {
        for var j = 0;j < (array.count - i);j++ {
            if array[j] > array[j + 1] {
                flag = true
                swap2(&array[j], num2: &array[j + 1])
            }
        }
    }
    
    while !flag {
        break
    }
    
   // showArray(array)    //排序成功（var修饰参数.只能在函数内部起作用）
}

var array : Array<Int> = [23,12,56,87,2]
showArray(array)
bubbleSort(&array)//排序成功(inout修饰参数,可以改变参数在函数外的值)
//bubbleSort(array)

showArray(array)

/*
函数类型:
类似于C语言的指向函数的指针
类似于OC语言的block
函数类型是由函数的参数类型和返回值类型组成的
*/

//下面两个函数的类型是(Int,Int) -> Int
func sum(a : Int,b : Int) -> Int {
    return a + b
}

func sub(a : Int,b : Int) -> Int {
    return a - b
}

//1,可以利用函数类型去定义变量和常量
var funcP : (Int,Int) -> Int = sum
print("函数类型 加:",funcP(10,20))

funcP = sub
print("函数类型 减:",funcP(10,20))


//2,函数类型可以作为函数的参数
func calcFunc(a : Int,b : Int,option : (Int,Int) -> Int) ->Int {
    return option(a,b)
}
print("函数类型作函数参数:",calcFunc(10,b: 20,option: sum))
print("函数类型作函数参数:",calcFunc(10,b: 20,option: sub))


//3,函数类型可以作为函数返回值
func max(a : Int,b : Int) -> Int {
    return a > b ? a : b
}

func min(a : Int,b : Int) -> Int {
    return a > b ? b : a
}

func  chooseFunc(getMax : Bool) -> (Int,Int) -> Int {
    return getMax ? max : min
}
var funcP2 : (Int,Int) -> Int = chooseFunc(false)
print("函数类型作函数返回值:",funcP2(10,20))

//----------------------------方法-----------------------------------//
/*
隶属于每一个类或结构体的函数称之为方法:
方法分为类方法和实例方法, 对应OC中的+ - 方法
实例方法:实例方法一定是通过对象来调用的, 实例方法隶属于某一个类
*/
class Person {
    var _name : String = "高军"
    var _age : Int = 24
    var _height : Float = 174.8
    
    //如果不希望某个参数作为外部参数，可以在参数前面加上_,忽略外部参数
    func setName(name : String, _ age : Int,height : Float) {
        _name = name
        _age = age
        _height = height
    }
    
    
    func show() {
        print("name = \(_name) age = \(_age) height = \(_height)")
    }
}

var p = Person()
p.show()
//由于第一个参数可以通过方法名指定，所以默认第一个参数不作为外部参数
p.setName("gaojun", 23, height: 180.0)
p.show()

//函数
func setName1(name : String, age : Int) {

}
func setName2(myName name : String, myAge age : Int) {
    
}
// 实例方法和函数的区别在于, 实例方法会自动将除第一个参数以外的其它参数既当做外部参数又当做内部参数, 而函数需要我们自己指定才会有外部参数, 默认没有

setName1("zs", age: 25)
setName2(myName: "ls", myAge: 34)

/*
self关键字,  Swift中的self和OC中的self基本一样. self指当前对象, 如果self在对象方法中代表当前对象. 但是在类方法中没有self
*/
class Person1 {
    var name : String = "jun"
    var age : Int = 28
    
    func setName(name : String, age : Int) {
        self.name = name
        self.age = age

    }
    
    func show() {
        print("name = \(self.name) age = \(self.age)")
    }
    
}

var p1 = Person1()
p1.show()


/*
mutating方法
值类型(结构体和枚举)默认方法是不可以修改属性的, 如果需要修改属性, 需要在方法前加上mutating关键字, 让该方法变为一个改变方法
*/
//结构体
struct Person2 {
    var name : String = "gao"
    var age : Int = 34
    
    mutating func setName(name : String, age : Int) {
        self.name = name
        self.age = age
    }
    
    func show() {
        print("name = \(name) age = \(age)")
    }
}
//结构体的逐一构造器
var p2 = Person2(name: "hehe", age: 23)
p2.show()

//枚举
enum LightSwitch {
    case OFF,ON
    mutating func next() {
        switch self {
            case .OFF:
                self = ON
            case ON:
                self = OFF
        }
    }
}
var ls : LightSwitch = LightSwitch.OFF
if ls == LightSwitch.OFF {
    print("off")
}
ls.next()
if ls == LightSwitch.ON {
    print("on")
}


/*
类方法:
和类属性一样通过类名来调用, 类方法通过static关键字(结构体/枚举), class(类)
类方法中不存在self
*/
struct Person3 {
    var name : String = "gaojun"
    static var age : Int = 23
    
    func show() {
        print("name = \(self.name) age = \(Person3.age)")
    }
    
    //静态方法对应OC中的+号方法,和OC一样在类方法中不能访问非静态属性
    static func staticShow() {
        print("age = \(Person3.age)")
    }
}
var p3 = Person3()
p3.show()
Person3.staticShow()

//在类中,类方法或属性可以被static或class修饰
class Person4 {
    var name : String = "gaojun"
    class var age : Int {
        return 23
    }
    
    func show() {
        print("name = \(name) age = \(Person4.age)")
    }
    
    class func  staticShow() {
        print("age = \(Person4.age)")
    }
}
var p4 = Person4()
p4.show()
Person4.staticShow()


//构造方法1:
/*
构造方法:
作用: 对实例对象的内容进行初始化
Swift要求类或者结构体中的存储属性(非lazy的)在对象构造完毕后要有初始化值
语法:
init(参数列表){ 初始化代码 }
注意: 1.在Swift中类/结构体/枚举都需要构造方法
2.构造方法的作用仅仅是用于初始化属性, 而不是分配内存, 分配内存是系统帮我们做的
3.构造方法是隐式调用的, 通过 类名称() 形式创建一个对象就会隐式调用init()构造方法
4.如果所有的存储属性都有默认值, 可以不提供构造方法, 系统会提供一个隐式的构造方法
5.如果存储属性可以提供缺省, 那么提倡大家使用设置缺省值的方式, 这样可以简化代码(不用自定义构造方法, 不用写存储属性类型)
*/
class Animal {
    var name : String = "animal"
    var age : Int = 2
    
    func description() {
        print("name = \(name) age = \(age)")
    }
    
    init() {
        print("init")
        age = 3
    }
}
//1.分配内存,2.初始化name和age 3.构造方法是隐式调用的
var animal = Animal()
animal.description()//显示调用

/*
带参数的构造方法
*/
class Animal1 {
    var name : String
    var age : Int
    func description() -> String {
        return "name = \(name) age = \(age)"
    }
    //构造方法的内部参数,默认也是外部参数
    //函数的内部参数默认不会当做外部参数
    //方法的内部参数，从第二个开始才会当做外部参数
    //构造方法对存储属性的顺序没有要求,只要保证对象构造完时，所有存数属性被初始化即可
    init(age : Int, name : String) {
        self.age = age
        self.name = name
    }
    
    func setName(name : String, age : Int) {
        
    }
}
var animal1 = Animal1(age: 23, name: "dog")
animal1.setName("hhh", age: 2)
func setName(name : String, age : Int) {
    
}
setName("hshv", age: 4)


/*
常量存储属性与构造方法
常量存储属性只能通过缺省值或在构造方法中被修改, 其它任何地方都不能修改
*/
class Animal2 {
    var name : String = "cat"
    var age : Int
    
    init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
    
    func description() {
        print("name = \(name) age = \(age)")
    }
    
}
var animal2 = Animal2(name: "kitty", age: 23)
animal2.description()
animal2.age = 35
animal2.name = "jobs"//常量存储属性初始化后不允许被修改（这句话有问题！！！）
animal2.description()


/*
可选属性与构造方法
*/
class Car {
    var name : String
    init(name : String) {
        self.name = name
    }
}
class Person5 {
    var name : String
    var age : Int
    var car : Car?
    
    // 可选值存储属性可以不在构造方法中初始化,
    // 也就是说可选值在对象构造完毕后不用初始化
    // 其实如果不对可选存储属性进行初始化, 默认就是nil
    init(name : String, age : Int){
        self.name = name
        self.age  = age
    }
    
    func description() ->String {
        return "name = \(name) age = \(age)"
    }
}
var p5 = Person5(name: "jz", age: 34)
print(p5.description())
print("p5.car:\(p5.car)")//nil

/*
结构体构造方法
*/
struct Rect {
    var width : Double = 0.0
    var height : Double = 6.0
 
    //结构体的逐一构造器类似于下面这个方法的实现
//    init(width : Double, height : Double) {
//        self.height = height
//        self.width = width
//    }
    
    
    //如果在结构体中自定义了构造方法,那么系统不会生成默认的逐一构造器
//    init() {
//        self.width = 3
//        self.height = 4
//    }
}

//如果给结构体的存储属性提供了缺省值,结构体还会生成逐一构造器方法
var rect = Rect(width: 3, height: 4)

//如果给结构体的存储属性提供了缺省值,可以使用不带参数的方法初始化结构体
var rect1 = Rect()
print("width = \(rect.width) height = \(rect.height)")


/*"值类型"的构造器代理
构造器代理: 构造方法之间的相互调用
构造方法可以调用其他构造方法来完成实例的构造, 称之为构造器代理
好处: 减少构造方法之间的重复代码
*/
struct Rect2 {
    var width : Double
    var height : Double
    init(width : Double, height : Double) {
        self.height = height
        self.width = width
    }
    
    init() {
        //构造器代理
        self.init(width:0, height: 0)
    }
    func show() {
        print("width = \(width) height = \(height)")
    }
}
var rect2 = Rect2(width: 3, height: 4.5)
rect2.show()
var rect21 = Rect2()
rect21.show()


/*
通过闭包或者全局函数/类方法 设置存储属性的缺省值
如果需要经过计算,或者需要进行一些列额外的操作才能确定初始值时就可以通过闭包或者全局函数设置存储属性的缺省值
*/


//构造方法2:

//析构方法(对应OC中的dealloc方法):

//----------------------------闭包-----------------------------------//
/*
闭包:
函数是闭包的一种
类似于OC语言的block
闭包表达式(匿名函数) -- 能够捕获上下文中的值

语法: in关键字的目的是便于区分返回值和执行语句
闭包表达式的类型和函数的类型一样, 是参数加上返回值, 也就是in之前的部分
{
(参数) -> 返回值类型 in
执行语句
}
*/

//完整写法
let say1:(String) -> Void = {
    (name : String) -> Void in
    print("name = \(name)")
}
say1("gaojun")

//无参数写法
let say2:() -> Void = {
    () -> Void in
    print("name = hhh")
}
say2()

//无参数无返回值写法
let say3:() -> Void = {
    () -> Void in
    print("name = hehe")
}
say3()

//有参数有返回值(闭包)
let sum2 = {
    (num1 : Int, num2 : Int) -> Int in
    return num1 + num2
}

func sum1(num1 : Int, num2 : Int) -> Int {
    return num1 + num2
}

print(sum2(3, 4))
print(sum1(3, num2: 4))


/*
闭包表达式作为回调函数
*/
let cmp = {
    (num1 : Int, num2 : Int) -> Int in
    if num1 > num2 {
        return 1
    }else if num1 < num2 {
        return -1
    }else {
        return 0
    }
}


func bubbleSort1(inout array : [Int],cmp:(Int,Int) -> Int) {
    let count = array.count
    for var i = 1;i < count;i++ {
        for var j = 0;j < count - i;j++ {
            if cmp(array[j],array[j + 1]) == 1 {
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}

var arr : Array = [1,-2,5,9,7]
bubbleSort1(&arr, cmp: cmp)
showArray(arr)

/*
闭包作为参数传递
*/
bubbleSort1(&arr, cmp: {(num1 : Int, num2 : Int) -> Int in
    if num1 > num2 {
        return 1
    }else if num1 < num2 {
        return -1
    }else {
        return 0
    }
})
showArray(arr)

//如果闭包是最后一个参数,可以直接将闭包写到参数列表后面,这样可以提高阅读性,称为尾随闭包
bubbleSort1(&arr) {
    (num1 : Int, num2 : Int) -> Int in
    if num1 > num2 {
        return 1
    }else if num1 < num2 {
        return -1
    }else {
        return 0
    }
}
showArray(arr)


/*
闭包表达式优化
1.类型优化,由于函数中已经声明了闭包参数的类型,所以传入的实参可以不用写类型
2.返回值优化,由于函数中已经声明了返回值类型,所以返回值可以不用写类型
3.参数优化,swift可以使用$索引的方式来访问闭包的参数,默认从0开始(注意当使用$索引来访问闭包的参数时,闭包的参数不应该显示的写出来,如下所示)
*/
bubbleSort1(&arr) {
    //(num1 : Int, num2 : Int) -> Int in
    //(num1,num2) in
    if $0 > $1 {
        return 1
    }else if $0 < $1 {
        return -1
    }else {
        return 0
    }

}
showArray(arr)

//如果只有一条语句可以省略return
let hehe = {
    "hehe"
}
print(hehe())


//******************************************************************************
/*
闭包捕获值
*/
func getIncFunction(inc : Int) -> (Int) -> Int {
    var max = 10
    func incFunction(x : Int) -> Int {
        max++
        return max + x
    }
    
    return incFunction
}

let incFunc = getIncFunction(5)
print(incFunc(5))//16
print(incFunc(5))//17
print(incFunc(5))//18

let incFunc2 = getIncFunction(5)
print(incFunc2(5))//16

//*******************************************************************************



