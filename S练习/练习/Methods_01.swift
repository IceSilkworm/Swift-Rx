//
//  Methods_01.swift
//  练习
//
//  Created by hudun on 2017/8/17.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Methods_01: NSObject {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    //“方法是与某些特定类型相关联的函数。类、结构体、枚举都可以定义实例方法；实例方法为给定类型的实例封装了具体的任务与功能。类、结构体、枚举也可以定义类型方法；类型方法与类型本身相关联。类型方法与 Objective-C 中的类方法（class methods）相似。”
    
    //“Swift 中，你不仅能选择是否要定义一个类/结构体/枚举，还能灵活地在你创建的类型（类/结构体/枚举）上定义方法。”
    
    //实例方法
    func run() -> Void {
        
        let counter = Counter()
        // 初始计数值是0
        counter.increment()
        // 计数值现在是1
        counter.increment(by: 5)
        // 计数值现在是6
        counter.reset()
        // 计数值现在是0”
        
        
        //“函数参数可以同时有一个局部名称（在函数体内部使用）和一个外部名称（在调用函数时使用），详情参见指定外部参数名。方法参数也一样，因为方法就是函数，只是这个函数与某个类型相关联了。”
        
        // MARK: - 省略self
        
        //“使用这条规则的主要场景是实例方法的某个参数名称与实例的某个属性名”“称相同的时候。在这种情况下，参数名称享有优先权，并且在引用属性时必须使用一种更严格的方式。这时你可以使用self属性来区分参数名称和属性名称。”
        
        
        
        //MARK: - “在实例方法中修改值类型”
        
        //“结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
        
        //但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择可变(mutating)行为，然后就可以从其方法内部改变它的属性；并且这个方法做的任何改变都会在方法执行结束时写回到原始结构中。方法还可以给它隐含的self属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例。
        
        //要使用可变方法，将关键字mutating 放到方法的func关键字之前就可以了：”
        
        
        var somePoint = TestPoint(x: 1.0, y: 1.0)
        somePoint.moveByX(deltaX: 2.0, y: 3.0)
        print("The point is now at (\(somePoint.x), \(somePoint.y))")
        // 打印 "The point is now at (3.0, 4.0)”
        
        //“注意，不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性”
        
//        let fixedPoint = Point(x: 3.0, y: 3.0)
 //       fixedPoint.moveByX(2.0, y: 3.0)
        // 这里将会报告一个错误”
        
        
        //MARK: - “在可变方法中给 self 赋值”
        //“可变方法能够赋给隐含属性self一个全新的实例。”
        
        //如 TestPoint1
        
        
        
        
        
        
        
        var ovenLight = TriStateSwitch.Low
        ovenLight.next()
        // ovenLight 现在等于 .High
        ovenLight.next()
        // ovenLight 现在等于 .Off
        //上面的例子中定义了一个三态开关的枚举。每次调用next()方法时，开关在不同的电源状态（Off，Low，High）之间循环切换。”
        
        print(ovenLight)
    }
}

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

struct TestPoint {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}


//“新版的可变方法moveBy(x:y:)创建了一个新的结构体实例，它的 x 和 y 的值都被设定为目标值。调用这个版本的方法和调用上个版本的最终结果是一样的。”

struct TestPoint1 {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        self = TestPoint1(x: x + deltaX, y: y + deltaY)
    }
}

//“枚举的可变方法可以把self设置为同一枚举类型中不同的成员：”

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}

