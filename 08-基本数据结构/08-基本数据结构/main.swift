//
//  main.swift
//  08-基本数据结构
//
//  Created by gaojun on 16/4/2.
//  Copyright © 2016年 高军. All rights reserved.
//

import Foundation

print("Hello, World!")

//-------------------------数组-------------------------------------//
/*
数组定义:
OC:
有值数组
NSArray *arr0 = @[@1, @2, @3];
NSArray *arr1 = [NSArray arrayWithObjects:@1, @2, @3, nil];
NSLog(@"%@", arr1);

空数组
NSArray *arr2 = @[];
NSArray *arr3 = [NSArray array];
NSLog(@"%@", arr3);

不可变数组:NSArray
可变数组:NSMutableArray
*/

//有值数组
var arr0 = [1,2,3]
var arr1 : Array = [1,2,3]
var arr2 : Array<Int> = [3,2,4]
var arr3 : Array<Any> = [1.3,2,"gaojun"]
var arr4 : [Int] = [1,2,3]
//var arr4 : Int[] = [1,2,3]这是早期的写法

//空数组
var arr5 = []
var arr6 = [Int]()
var arr7 = Array<Int>()
print(arr7)


//不可变数组
let arr8 = [1]

//可变数组
var arr9 = []

/*
元素类型
OC:
NSArray *arr = @[@1, @"lnj", @1.75];
NSLog(@"%@", arr);
*/

//元素类型
var arr10 = [1,"gao",9.8]
print("arr10:",arr10)
//如果想要明确表示数组中存放的是不同类型的数据,可以使用Any关键字,表示数组中可以存放不同类型的数据
var arr11 : Array<Any> = [1,0.9,"haha"]
print("arr11:\(arr11)")

/*
数组操作
1.获取长度
OC:
NSArray *arr = @[@1, @2, @3];
NSLog(@"%tu", arr.count);
*/

//获取长度
var arr12 = [1,2,3]
print("arr12 length:",arr12.count)

/*
2.判断是否为空
OC:
NSArray *arr = @[];
NSLog(@"%d", arr.count != 0);
*/

//判断是否为空
var arr13 = [1,2,3]
print("arr13 is empty or not?",arr13.isEmpty)

/*
3.检索
OC:
NSArray *arr = @[@1, @2, @3];
NSLog(@"%@", arr[0]);
*/

//检索
var arr14 = [1,2,3]
print("arr14的第二个元素",arr14[1])

/*
4.追加
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr addObject:@4];
NSLog(@"%@", arr);
*/

//追加
var arr15 = [1,3,2]
arr15.append(4)
print("arr15:",arr15)

arr15 += [5]
print("arr15:",arr15)

arr15 += arr15[0...1]
print("arr15:",arr15)

/*
5.插入
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr insertObject:@4 atIndex:0];
NSLog(@"%@", arr);
*/

//插入
var arr16 = [1,2,3]
arr16.insert(4, atIndex: 2)
print("arr16:",arr16)

/*
6.更新
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
arr[0] = @8;
NSLog(@"%@", arr);
*/

//更新
var arr17 = [1,2,3]
arr17[0] = 4
print("arr17:\(arr17)")

/*
7.删除
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr removeObject:@1];
NSLog(@"%@", arr);

NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr removeLastObject];
NSLog(@"%@", arr);

NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr removeAllObjects];
NSLog(@"%@", arr);
*/

//删除
var arr18 = [1,2,3]
arr18.removeAtIndex(2)
print("arr18:",arr18)
var arr19 = [1,2,3]
arr19.removeLast()
print("arr19:",arr19)
var arr20 = [1,2,3]
arr20.removeAll(keepCapacity: false)//是否保持容量,如果为true,即便删除了容量依然存在，容量是2的倍数
print("arr20:",arr20)
print("arr20 的容量:",arr20.capacity)
//注意：如果数组是一个不可变数组,不能更新/插入和删除
//第一个版本的不可变数组是可以修改的

/*
Range
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr removeObjectsInRange:NSMakeRange(0, 2)];
NSLog(@"%@", arr);
*/

var arr21 = [1,2,3]
arr21.removeRange(Range(start: 1, end: 2))//1...2
print("arr21:",arr21)//[1,3]

var arr22 = [1,2,3]
arr22.removeRange(0...0)
print("arr22:",arr22)

//其实range就是半开半闭区间(包含左，不包含右)
var range = 0...4
print("range:",range)

var range1 : Range<Int> = Range(start: 0, end: 5)
var range2 : Range<Int> = 0..<5
//var range3 : Range<String>    //必须遵守ForwardIndexType协议
print("range1:",range1)
print("range2:",range2)



/*
数组的批量操作
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
NSRange range = NSMakeRange(0, 2);
// [arr replaceObjectsInRange:range withObjectsFromArray:@[@99, @88]];
[arr replaceObjectsInRange:range withObjectsFromArray:@[@99, @88, @77, @66]];
NSLog(@"%@", arr);
*/

//数组的批量操作
var arr23 = [1,2,3]
//arr[0...1] = [99, 88]
//arr[0...1] = [99, 88, 77, 66]
// 等价于上一行代码
//arr.replaceRange(Range(start: 0, end: 2), with: [99, 88, 77, 66])
arr23.replaceRange(0..<1, with: [99,88,77,66])
print("arr23:",arr23)

/*
4.遍历
OC:
NSArray *arr = @[@1, @2, @3];
for (int i = 0; i < arr.count; i++) {
NSLog(@"%@", arr[i]);
}

for (NSNumber *number in arr) {
NSLog(@"%@", number);
}
*/

//遍历
var arr24 = [1,2,3]
for var i = 0; i < arr24.count; i++ {
    print("遍历arr24:",arr24[i])
}

for number in arr24 {
     print("遍历arr24:",number)
}

for i in 0..<arr24.count {
     print("遍历arr24:",arr24[i])
}

//取出数组中某个区间范围的值
var arr25 = [1,2,3,7,8]
for number in arr25[0..<3] {
    print("arr25:",number)
}

//-------------------------字典--------------------------------------//
/*
字典定义: 键值对
OC:
NSDictionary *dict = [NSDictionary dictionaryWithObject:@"lnj" forKey:@"name"];
NSLog(@"%@", dict);

NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"name", @"lnj", @"age", @30, nil];
NSLog(@"%@", dict);

NSDictionary *dict = @{@"name":@"lnj", @"age":@30};
NSLog(@"%@", dict);
*/

//01字典定义:键值对
//key一定要求是可以hash的(String,Float,Int,Double,Bool),value值没有要求
var dict = ["name":"gaojun","age":24]
print("dict:",dict)

var dict1 : Dictionary = ["name":"gaojun","age":24]
print("dict1:",dict1)

var dict2 : Dictionary<String,Any> = ["name":"gaojun","age":24]
print("dict2:",dict2)

var dict3:[String:Any] = ["name":"gaojun","age":24]
print("dict3:",dict3)

var dict4:[String:Any] = Dictionary(dictionaryLiteral: ("name","gaojun"),("age",24))
print("dict4:",dict4)

//不可变字典
let dict5 = ["name":"gaojun","age":24]

//可变字典
var dict6 = ["name":"gaojun","age":24]

//02字典操作
/*
字典操作
OC:
1.获取
NSDictionary *dict = @{@"name":@"lnj", @"age":@30};
NSLog(@"%@", dict[@"name"]);

2.修改
NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name", @"lnj", @"age", @30, nil];
dict[@"name"] = @"iversion";
NSLog(@"%@", dict[@"name"]);

NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name", @"lnj", @"age", @30, nil];
[dict setObject:@"iversion" forKey:@"name"];
NSLog(@"%@", dict[@"name"]);
*/

//获取
var dict7 = ["name":"gaojun","age":24]
print(dict7["name"]!)

//修改
var dict8 = ["name":"gaojun","age":24]
dict8["name"] = "高军"
print(dict8["name"]!)

var dict9 = ["name":"gaojun","age":24]
dict9.updateValue(25, forKey: "age")
print(dict9["age"]!)

//更新
//updateValue返回一个可选类型,如果字典中不存在需要更新的key,那么返回nil,如果存在返回原始值
var dict10 = ["name":"gaojun","age":24]
if let original = dict10.updateValue("高军", forKey: "name") {//存在
    print(dict10["name"]!)//高军
    print(original)//gaojun
}

// updateValue返回一个可选类型, 如果字典中不存在需要更新的key, 那么返回nil并且会将新的键值对添加到字典中
var dict11 = ["name":"gaojun","age":24]
if let original = dict11.updateValue(25, forKey: "ages") {//不存在,下面两句不会执行
    print("***:",dict11["age"]!)//24
    print("***:",original)//nil
}
print("dict11:\(dict11)")


/*
4.添加
OC:
NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name", @"lnj", @"age", @30, nil];
dict[@"height"] = @175;
NSLog(@"%@", dict);


NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name", @"lnj", @"age", @30, nil];
[dict setObject:@175 forKey:@"height"];
NSLog(@"%@", dict);
*/
//添加
var dict12 = ["name":"gaojun","age":24]
dict12["height"] = 175
print("dict12:",dict12)

/*
5.删除
OC:
NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"lnj", @"name", @30, @"age", nil];
[dict removeObjectForKey:@"name"];
NSLog(@"%@", dict);

NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"lnj", @"name", @30, @"age", nil];
[dict removeAllObjects];
NSLog(@"%@", dict);
*/
//删除
var dict13 = ["name":"gaojun","age":24]
dict13.removeValueForKey("name")
print("dict13:",dict13)

// removeValueForKey返回一个可选类型, 如果字典中不存在需要删除的key, 那么返回nil并且不会执行任何操作, 如果存在则删除key对应的值, 并且返回被删除的值
var dict14 = ["name":"gaojun","age":24]
if let original = dict14.removeValueForKey("ages") {//nil
    print(dict14)
    print(original)
}
print("dict14:",dict14)

var dict15 = ["name":"gaojun","age":24]
dict15.removeAll(keepCapacity: false)
print("dict15:",dict15)


/*
遍历字典
OC:
NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"lnj", @"name", @30, @"age", nil];
[dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
NSLog(@"key = %@ value = %@", key, obj);
}];

NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"lnj", @"name", @30, @"age", nil];
NSArray *keys = [dict allKeys];
for (NSString *key in keys) {
NSLog(@"%@", key);
}

NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"lnj", @"name", @30, @"age", nil];
NSArray *values = [dict allValues];
for (NSString *value in values) {
NSLog(@"%@", value);
}
*/
//遍历字典
var dict16 = ["name":"gaojun","age":24]
for (key,value) in dict16 {
    print("key = \(key),value = \(value)")//key = age,value = 24
   // key = name,value = gaojun
}

for key in dict16.keys {
    print("key = \(key)")
}

for value in dict16.values {
    print("value = \(value)")
}

//-------------------------元祖--------------------------------------//
/*
元祖:在其他语言中很早就有元祖这个概念,但是对于OC程序员来说这是一个新的概念,将多个相同或者不同类型的值用一个小括号括起来就是一个元祖
*/
let student = ("高军",175,24)
print("student:\(student),student.0:\(student.0),student.1:\(student.1),student2:\(student.2)")

/*
元祖其实和结构体很像, 只是不需要提前定义类型. 那么如果不定义类型元祖是什么类型呢?
元祖其实是复合类型, 小括号中可以写任意类型
*/
let student1 : (String,Float,Int) = ("gaojun",175.6,24)

/*
元祖的其它定义方式:指明应用元祖元素的名称
*/
let student2 = (name:"gaojun",height:175,age:24)
print("student2.name:\(student2.name),student2.height:\(student2.height),student2.age:\(student2.age)")

/*
元祖的其它定义方式:
通过指定的名称提取元祖对应的值, 会将对应位置的值 赋值给对应位置的名称
*/
let (name,height,age) = ("gaojun",175,24)
print("name:\(name),height:\(height),age:\(age)")

/*
如果不关心元祖中的某个值可以利用_通配符来忽略提取
*/
let (name1,height1,_) = ("高军",175,24)
print("name1:\(name1),height1:\(height1)")

/*
在以前没有元祖之前C和OC语言是通过传入指针或者返回结构体的方式来返回多个值的,而有了元祖之后就可以实现让一个函数返回多个值
*/

//-------------------------枚举--------------------------------------//
/*
Swift枚举:
Swift中的枚举比OC中的枚举强大, 因为Swift中的枚举是一等类型, 它可以像类和结构体一样增加属性和方法
格式:
enum Method{
case 枚举值
}
*/
enum Method {
//    case Add
//    case Sub
//    case Mul
//    case Div
    case Add,Sub,Mul,Div    //可以连在一起写
}
//可以使用枚举类型变量或常量接收枚举值
var m : Method = .Add
print("m:\(m)")

//注意：如果变量或常量没有指定类型，那么前面必须加上该值属于那个枚举类型
let m1 = Method.Add
print("m1:",m1)

// 利用Switch匹配
// 注意: 如果case中包含了所有的值, 可以不写default. 如果case中没有包含枚举中所有的值, 必须写default
switch Method.Add {
    case Method.Add:
        print("加")
    case Method.Sub:
        print("减")
    case Method.Mul:
        print("乘")
    case Method.Div:
        print("除")
//    default:
//        print("非")//此处可以不用写啦！！！
}

/*
原始值:
OC中枚举的本质就是整数,所以OC中的枚举是有原始值的,默认是从0开始
而Swift中的枚举默认是没有原始值的, 但是可以在定义时告诉系统让枚举有原始值
enum Method: 枚举值原始值类型{
case 枚举值
}
*/
enum Method2 : Int {
    case add,sub,mul,div    //可以连在一起写
}
print("add:",Method2.add)

// 和OC中的枚举一样, 也可以指定原始值, 后面的值默认+1
enum Week : Int {
    case Monday = 1
    case Tuesday
    case Wednesday
    case Thurday
    case Friday
    case Saturday
    case Sunday         //这种情况不能连在一起写
}
print("Sunday:",Week.Sunday)

// Swift中的枚举除了可以指定整型以外还可以指定其它类型, 但是如果指定其它类型, 必须给所有枚举值赋值, 因为不能自动递增
enum Random : Float {
    case ran1 = 0.8,ran2 = 8.0,ran3 = 2.3   //可以连在一起写
}
print("ran3:",Random.ran3.hashValue)//hashValue对应的是索引，比如此处为2

//枚举值转化为原始值
// rawValue代表将枚举值转换为原始值, 注意老版本中转换为原始值的方法名叫toRaw
print("ran3的原始值:",Random.ran3.rawValue)//rawValue就是给枚举量赋的值

//原始值转化为枚举值(注意:枚举值可能为空)
let ran1 = Random(rawValue: 0.8)
if (ran1 != nil) {
   print("ran1枚举值:",ran1!)
}


enum Method4 : String {
    case Add = "add",Sub = "sub",Mul = "mul",Div = "div"
}
// 通过原始值创建枚举值
/*
注意:
1.原始值区分大小写
2.返回的是一个可选值,因为原始值对应的枚举值不一定存在
3.老版本中为fromRaw("add")
*/
func chooseMethod(op:String) {
    if let opE = Method4(rawValue:op) {
        switch opE {
            case .Add:
                print("加")
            case .Sub:
                print("减")
            case .Mul:
                print("乘")
            case .Div:
                print("除")
        }
    }
}
chooseMethod("add")

/*
枚举相关值：
可以让枚举值对应的原始值不是唯一的,而是一个变量
每一个枚举可以是在某种模式下的一些特定值
*/
enum LineSegmentDescriptor {
    case StartAndEndPattern(start:Double,end:Double)
    case StartAndLengthPattern(start:Double,length:Double)
}

var lsd = LineSegmentDescriptor.StartAndLengthPattern(start: 0.0, length: 50.0)
 lsd = LineSegmentDescriptor.StartAndEndPattern(start: 0.0, end: 156.8)
//利用switch提取枚举关联值
switch lsd {
    case .StartAndEndPattern(let s,let e):
        print("s=\(s),e=\(e)")
    case .StartAndLengthPattern(let s,let l):
        print("s=\(s),l=\(l)")
}

//提取关联值的优化写法
switch lsd {
    case let .StartAndEndPattern(s,e):
        print("start=\(s),end=\(e)")
    case .StartAndLengthPattern(let s,let l):
        print("start=\(s),length=\(l)")
}

//-------------------------结构体------------------------------------//
/*
结构体:
结构体是用于封装不同或相同类型的数据的, Swift中的结构体是一类类型, 可以定义属性和方法(甚至构造方法和析构方法等)
格式:
struct 结构体名称 {
结构体属性和方法
}
*/
struct Rect {
    var width : Float
    var height : Float
}
//如果结构体的属性没有默认值,必须使用逐一构造器(默认的构造器)实例化结构体
var rect = Rect(width: 34.0, height: 98)
print("rect:",rect)

struct Point {
    var x : Float = 4.5
    var y : Float = 13
}

struct Circle {
    //如果结构体的属性有默认值，可以直接使用()构造一个结构体
    var point : Point = Point()
    var radius : Float = 10.0
}
//如果结构体的属性有默认值，可以直接使用()构造一个结构体
var circle = Circle()
print("circle的原点坐标x=\(circle.point.x),y=\(circle.point.y)")


/*
结构体构造器
Swift中的结构体和类跟其它面向对象语言一样都有构造函数, 而OC是没有的
Swift要求实例化一个结构体或类的时候,所有的成员变量都必须有初始值, 构造函数的意义就是用于初始化所有成员变量的, 而不是分配内存, 分配内存是系统帮我们做的.
如果结构体中的所有属性都有默认值, 可以调用()构造一个结构体实例
如果结构体中的属性没有默认值, 可以自定义构造器, 并在构造器中给所有的属性赋值
其实结构体有一个默认的逐一构造器, 用于在初始化时给所有属性赋值
*/

struct User {
    var name : String
    var age : Float
    var height : Float = 175.4
}
//逐一构造器
var user = User(name: "高军", age: 24, height: 176)
//错误写法
//var user1 = User(name: "兵兵", age: 23)//缺少参数
//var user2 = User( age: 24, height: 176,name: "高军")//顺序不对
print("user.name:\(user.name),user.age:\(user.age),user.height:\(user.height)")


/*
结构体中定义成员方法
在C和OC中结构体只有属性, 而Swift中结构体中还可以定义方法
*/

struct Student {
    var number : String
    var name : String
    var score : Double
    
    // 给结构体定义一个方法, 该方法属于该结构体
    // 结构体中的成员方法必须使用某个实例调用
    // 成员方法可以访问成员属性
    
    //setter
    mutating func setNumber(number:String) -> Void {
        self.number = number
    }
    
    mutating func setName(name:String) -> Void {
        self.name = name
    }
    
    mutating func setScore(score:Double) -> Void {
        self.score = score
    }
    //getter
    func getNumber() -> String {
        return number
    }
    
    func getName() -> String {
        return name
    }
    
    func getScore() -> Double {
        return score
    }
}

var stu = Student(number: "20121514221", name: "高军", score: 98)
print("score:",stu.getScore())

stu.setScore(87)
print("score:",stu.getScore())

/*
结构体是值类型
*/
struct Person {
    var id : String
    var name : String
    var age : Int
    var address : String
    
    func show() -> Void {
        print("id:\(id),name:\(name),age:\(age),address:\(address)")
    }
}

var p1 = Person(id: "411481199204108450", name: "高军", age: 24, address: "河南省永城市酇城镇鞠庄村夏庙一组135号")
p1.show()

/*
赋值有两种情况
1.指向同一块存储空间
2.两个不同实例, 但内容相同（Swift中的结构体是这种情况）
*/

var p2 = p1
p2.show()//p1与p2的信息一样

p2.name = "小宝"
p1.show()
p2.show()//p1与p2的name不再一样
// 结构体是值类型, 结构体之间的赋值其实是将p1中的值完全拷贝一份到p2中, 所以他们是两个不同的实例

//-------------------------下标--------------------------------------//
/*
subscripts(下标): 访问对象中数据的快捷方式
所谓下标脚本语法就是能够通过, 实例[索引值]来访问实例中的数据
类似于以前我们访问数组和字典, 其实Swift中的数组和字典就是一个结构体

Array:      subscript (index: Int) -> T
Dictionary: subscript (key: Key) -> Value?
arr[0] == arr.subscript(0)
dict["key"] == dict.subscript("key")
*/

struct Student1 {
    var name : String
    var chinese : Double
    var math : Double
    var english : Double
    
    func score(course:String) -> Double? {
        switch course {
            case "chinese":
                return chinese
            case "math":
                return math
            case "english":
                return english
            default:
                return nil
        }
    }
    
    //要想实现下标访问,必须实现subscript方法
    //要想实现下标访问,必须实现get方法
    //要想通过下标赋值,必须实现set方法
    subscript(course:String) -> Double? {
        get {
            switch course {
                case "chinese":
                    return chinese
                case "math":
                    return math
                case "english":
                    return english
                default:
                    return nil
            }
        }
        
        set {
            switch course {
                case "chinese":
                    chinese = newValue!
                case "math":
                    math = newValue!
                case "english":
                    english = newValue!
                default:
                    print("Not Found")
            }
        }
    }
}

var stu1 = Student1(name: "gaojun", chinese: 121, math: 81, english: 115)
print("stu1.score:",stu1.score("math")!)

stu1["math"] = 145  //通过下标赋值
print(stu1["math"]!)    //通过下标访问


/*
Swift中是允许多索引的下标的
*/
struct Mul {
    subscript(a:Int,b:Int) -> Int {
        return a * b
    }
    
    var index : Double = 100
    subscript(c:Double) -> Double? {
        mutating get {
            index += c
            return index
        }
        
        set {
           index = newValue!
        }
    }
}

var mul = Mul()
print(mul[3,5])//15
print(mul[25]!)//125
mul[3] = 50
print(mul[3]!)//53

//-------------------------------泛型------------------------------------//
/*
Swift语言提供“泛型”特性来编写灵活和可重复使用功能类型。泛型是用来避免重复而提供的抽象。
*/
//泛型函数:类型参数
func exchange<T>(inout a : T,inout b : T) {
    let temp = a
    a = b
    b = temp
}
var num1 : Int = 100
var num2 : Int = 200
print("交换之前,num1=\(num1),num2=\(num2)")
exchange(&num1, b: &num2)
print("交换之后,num1=\(num1),num2=\(num2)")

var str1 : String = "gaojun"
var str2 : String = "xiaobao"
print("交换之前,str1=\(str1),str2=\(str2)")
exchange(&str1, b: &str2)
print("交换之前,str1=\(str1),str2=\(str2)")

//泛型类型
struct Tos<T> {
    var items = [T]()
    mutating func push(item : T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}
var tos = Tos<String>()
tos.push("swift")
print(tos.items)
tos.push("Objective - C")
print(tos.items)
tos.pop()
print(tos.items)

var tos1 = Tos<Int>()
tos1.push(1)
tos1.push(3)
tos1.push(4)
tos1.push(7)
print(tos1.items)
tos1.pop()
print(tos1.items)

//关于泛型，此处不再进行深入,项目中用到时再加深学习
