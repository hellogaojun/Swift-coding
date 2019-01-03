//:Swift概览
//:> 概览练习
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black

        view.addSubview(label)
        self.view = view



    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

///0.swift概览
print("hello swift")

//编译器会自动推断类型,当然也可以显示指定
let number: Float = 4
var abc = "abc"

//值绝对不会隐式地转换为其他类型。如果你需要将一个值转换为不同的类型，需要使用对应 的类型显示地声明
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
//error: binary operator '+' cannot be applied to operands of type 'String' and 'Int'
//let widthLabel1 = label + width

// \()
print("\(3.14125926)")
print("welcome \("jobs") to come")
let apples = 3
let oranges = 5;
print("I have \(apples + oranges) pieces of fruit")

///数组,字典
var arr:[Any] = [1,2,"3",4,6]
var dic:[String:Any] = ["name":"gaojun","age":99] as [String : Any]
//初始化语法声明字典或数组
var emptyArr = [String]()
var emptyDic = [String:Float]()
emptyArr.append("4")
emptyArr.insert("6", at: 1)
emptyDic["age"] = 88
emptyDic["weight"] = 199


///控制流
let individualScores = [75,56,190,76,32]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = "hello"
print(optionalString == nil)
var optionalName: String? //= "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {//对可选值的一种处理
    greeting = "Hello,\(name)"
} else {
    greeting = "Hello Swift"
}

//??提供可选值的默认值
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

//Switch 选择语句支持任意类型的数据和各种类型的比较操作——它不再限制于整型和测试相等上
let vegetable = "red pepper"
switch vegetable {
    case"celery":
        print("Add some raisins and make ants on a log." )
    case"cucumber","watercress":
        print("That would make a good tea sandwich." )
    case let x where x.hasSuffix("pepper")://let 可以用在模式里来指定匹配的值到一个常量当中
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
}

let interestingNumbers = ["Prime":[2,3,5,7,11,13],
                          "Fibonacci":[1,1,2,3,5,8],
                          "Square":[1,4,9,16,25]]
var largestNumber = 0
var largestKind = ""

for (kind,numbers) in interestingNumbers {
    print(kind,numbers)
    for number in numbers {
        if number > largestNumber {
            largestNumber = number
        }
    }
}
print(largestNumber)

//while
var n = 2
while n < 100 {
    n *= 2;
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100 //循环的条件在末尾,保证循环体至少执行一次
print(m)

var result = 0
var s = 1
repeat {
    result = result + s
    s += 1
} while s <= 100
print(s,result)

var total = 0
for i in 0 ..< 4 {//a ..< b 不包含最大值(b)
    total += i
}
print(total)

var sum = 0
for i in 0 ... 100 {//a ... b 包含最大值(b)与最小值(a)
    sum += i
}
print(sum)

///函数和闭包
//默认情况下，函数使用他们的形式参数名来作为实际参数标签
func greet(person: String,day: String) -> String {
    return "Hello \(person),today is \(day)"
}

greet(person: "Jobs", day: "Friday")

//在形式参数前可以写自定义的实际参数标签，或者使用 _ 来避免使用实际参数标签
func greet2(_ person: String,on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet2("Miachle", on: "Tuesday")

//通过元组来创建复合值(作为函数返回值)
func calculateStatistics(scores: [Int]) -> (min: Int,max: Int,sum: Int) {
    if scores.count == 0 {
        return (0,0,0)
    }
    var minScore = scores[0]
    var maxScore = scores[0]
    var sumScore = 0
    for score in scores {
        if score > maxScore {
            maxScore = score
        } else if score < minScore {
            minScore = score
        }
        
        sumScore += score
    }
    
    return (minScore,maxScore,sumScore)
}
let statistics = calculateStatistics(scores: [5,6,8,200,9])
//元组中的元素可以通过名字或者数字索引调用
print(statistics.min)
print(statistics.max)
print(statistics.2)

//接受多个参数的函数(参数类型相同的)
func sumOf(numbers: Int ...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf(numbers: 1,2,3,4,5,6)

func averageOf(numbers: Int ...) -> Float {
    var sum = 0
    var count = 0
    
    for number in numbers {
        sum += number
        count += 1
    }
    return Float(sum / count)
}
averageOf(numbers: 1,2,3,4,5,6)

//函数内嵌
//one.
func returnFifteen() -> Int {
    var y = 10;
    func add() {
        y += 5 //内嵌的函数可以访问外部函数里的变量
    }
    add()
    return y
}

//two.函数的返回值是函数
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return number + 1
    }
    return addOne
}

//three.函数的参数是函数
func hasAnyMatches(list: [Int],condition:(Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [1,1,2,4,18,90]
hasAnyMatches(list: numbers, condition: lessThanTen)

//函数其实就是闭包的一种特殊形式:一段可以被随后调用的代码块,使用花括号( {})括起一个没有名字的闭包。在闭包中使用 in来 分隔实际参数和返回类型

// {
//    (number: Int) -> Int in
//    let result = 3 * number
//    return result
//}

numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})


//func test(a: Int,closure:() -> Void) {
//    closure()
//}
//
//test(a: 6) {
//    print("hehehh")
//}


///对象和类
class Shape {
    var numberOfSides = 0
    let radiant = 360
    var name: String?
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
    init(numberOfSides: Int, name: String) {
        self.numberOfSides = numberOfSides
        self.name = name;
    }
    
    deinit {
        print("clean carbage....")
    }
    
}

var shape = Shape(numberOfSides: 4, name: "rectangle")
shape.simpleDescription()
shape.radiant

class Circle: Shape {
    var radius: Float = 0.0
    
    func area(radius: Float) -> Float {
        return radius * radius;
    }
    
    override func simpleDescription() -> String {
        return "A circle with radisu: \(radius)"
    }
    
    init(radius: Float,name: String) {
        super.init(numberOfSides: 1, name: name)
        
        self.radius = radius
    }
    
}

var circle = Circle(radius: 5, name: "Circle")
circle.simpleDescription()
circle.numberOfSides


class TestCase {
    var name: String?//存储属性
    var test1: String = ""
    
    //计算属性
    var test: String {
        get {
            return test1
        }
        set {
            test1 = newValue
        }
    }
 
    //可以直接为除计算属性和lazy属性之外的存储属性添加属性观察器
    //属性观察器
    var shape: Shape = Shape(numberOfSides: 0, name: "testcase") {
        willSet {
            print("willSet newValue:\(newValue)")
        }
        
        didSet {
           print("didSet oldValue:\(oldValue)")
        }
    }
    
    //懒加载属性

//    lazy var <#property name#>: <#type name#> = {
//        <#statements#>
//        return <#value#>
//    }()
    
    init(name: String) {
        self.name = name
    }

}
var tc = TestCase(name: "hehe")
tc.shape = Shape(numberOfSides: 6, name: "666")
tc.test
tc.test = "888"
tc.test


///枚举和结构体
enum Rank: Int {//枚举,指定原始值
    case ace = 1 //以此递增
    case two,three,four,five,six,seven,eight,nine,ten
    case jack,queen,king
    //枚举中可以有方法
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
//枚举成员的原始值
let aceRawValue = ace.rawValue
Rank.two
Rank.two.rawValue
var rank = Rank(rawValue: 6)

func rankTest(rank1: Rank,rank2: Rank) -> Bool {
//    switch rank {
//    case .ace:
//        print("ace")
//    case .jack:
//        print("jack")
//    default:
//        print("other")
//    }
    
    return rank1.rawValue >= rank2.rawValue
}

rankTest(rank1: .ace, rank2: .jack)
rankTest(rank1: .queen, rank2: .two)

enum Suit {//枚举,不指定原始值
    case spades,hearts,diamonds,clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades,.clubs:
            return "black"
        case .hearts,.diamonds:
            return "red"
        }
    }
}

let hearts = Suit.hearts
hearts.simpleDescription()
hearts.color()

//如果枚举拥有原始值，这些值在声明时确定，就是说每一个这个枚举的实例都将拥有相同的 原始值。另一个选择是让case与值关联——这些值在你初始化实例的时候确定，这样它们就 可以在每个实例中不同了
enum ServerResponse {
    case result(String,String)
    case failure(String)
    case unknown(String)
    
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese")
let unknown = ServerResponse.unknown("losed...")
//注意写法
switch success {
    case let .result(sunrise,sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .failure(message):
        print("Failure... \(message)")
    case let .unknown(message):
        print("unknown message:\(message)")
}

///结构体
//使用 struct来创建结构体。结构体提供很多类似与类的行为，包括方法和初始化器。其中最重要的一点区别就是结构体总是会在传递的时候拷贝其自身，而类则会传递引用
struct Card {
    var rank: Rank //扑克牌数字
    var suit: Suit //扑克牌色别
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    //创建一副
    func setupOnePieceCard() -> [(Rank,Suit)] {
        let suitList:[Suit] = [Suit.spades,Suit.hearts,Suit.diamonds,Suit.clubs]
        var result:[(Rank,Suit)] = []
        
        for rank in 1 ... 13 {
            for suit in suitList {
                result.append((Rank(rawValue: rank) ?? Rank.ace,suit))
            }
        }
        return result
    }
    
    init(rank: Rank,suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
}

let card1 = Card(rank: .three, suit: .spades)
card1.setupOnePieceCard()
let card = Card.init(rank: .ace, suit: .hearts)
//struct不可继承
//struct card2: Card {
//
//}

///协议和扩展
//定义协议
protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

//类兼容协议
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very Simple class"
    
    //在 SimpleClass中则需要这样声明，因为类里的方法总是可以修改其自身属性的
    func adjust() {
        simpleDescription += "Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
a.simpleDescription

//结构体兼容协议
struct SimpleStruct: ExampleProtocol {
    
    var simpleDescription: String = "A simple struct"
    
    //注意使用 mutating关键字来声明在 SimpleStruct中使方法可以修改结构体
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
    
}
var b = SimpleStruct()
b.adjust()
b.simpleDescription

//枚举兼容协议
enum SimpleEnum: ExampleProtocol {
    case one,two,three
    
    var simpleDescription: String {
        return "SimpleEnum"
        
    }

    mutating func adjust() {
        switch self {
        case .one:
            print("one")
        case .two:
            print("two")
        case .three:
            print("three")
        }
    }
}

var c = SimpleEnum.one
c.adjust()
c.simpleDescription

//扩展
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
    
}
print(7.simpleDescription)


///错误处理
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
//使用 throw 来抛出一个错误并且用 throws 来标记一个可以抛出错误的函数
func send(job: Int, toPrinter printerName: String) throws ->String {
    if printerName == "noToner" {
        throw PrinterError.noToner
    } else if printerName == "outOfPaper" {
        throw PrinterError.outOfPaper
    } else if printerName == "onFire" {
        throw PrinterError.onFire
    }
    
    return "Jobs sent"
}

// 1.使用do-catch处理错误:
//在 do 代码块里，你用 try 在能抛出错 误的函数前标记。在 catch 代码块，错误会自动赋予名字 error ，如果你不给定其他名字的 话。
//可以提供多个 catch 代码块来处理特定的错误。你可以在 catch 后写一个模式，用法和 switch 语句里的 case 一样。
do {
    let printerResponse = try send(job: 10086, toPrinter: "onFire")
    print(printerResponse)
} catch PrinterError.outOfPaper {
    print("broken: \(PrinterError.outOfPaper)")
} catch PrinterError.noToner {
    print("broken: \(PrinterError.noToner)")
} catch PrinterError.onFire {
    print("broken: \(PrinterError.onFire)")
} catch {
    print(error)
}

//2.使用try?处理错误,转换结果为可选项
//如果函数抛出了错误，那么错误被忽略并且结果为 nil 。否则，结果是一个包含了函数返回值的可选项
let printerSuccess = try? send(job: 10010, toPrinter: "hhh")
print(printerSuccess!)
let printFailure = try? send(job: 12306, toPrinter: "onFire")
print(printFailure ?? "nil")

//defer
var fridgeIsOpen = false
let fridgeContent = ["milk","eggs","bread"]

//使用 defer 来写在函数返回后也会被执行的代码块，无论是否错误被抛出。你甚至可 以在没有错误处理的时候使用 defer ，来简化需要在多处地方返回的函数
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    return fridgeContent.contains(food)
}

fridgeContains("orangle")
print(fridgeIsOpen)

///泛型
//应用范围:函数,方法,类,枚举,结构体
func makeArray<T>(repeating t: T,numberOfTimes: Int) -> [T] {
    var result = [T]()
    for _ in  0 ..< numberOfTimes {
        result.append(t)
    }
    
    return result
}

makeArray(repeating: "Knock", numberOfTimes: 8)

enum OptionalValue<T> {
    case none
    case some(T)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

//在类型名称后紧接 where来明确一些列的需求:such as 来要求类型实现一个协议，要求两个类型必须相同，或者要求类必须继承自特定的父类
//where T.Iterator.Element: Equatable,T.Iterator.Element == U.Iterator.Element
func anyCommonElements<T: Sequence,U:Sequence>(_ lhs: T,_ rhs: U) -> [T.Iterator.Element] where T.Iterator.Element: Equatable,T.Iterator.Element == U.Iterator.Element {
    var result: [T.Iterator.Element] = [T.Iterator.Element]()
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                result.append(lhsItem)
            }
        }
    }
    
    return result
}

anyCommonElements([1,2,3], [4])
anyCommonElements([1,2,3], [2])































