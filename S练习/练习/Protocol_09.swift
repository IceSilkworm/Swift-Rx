//
//  Protocol_09.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_09: NSObject {

    
    func run() -> Void {
        
        
        let birthdayPerson = Person_A(name: "Malcolm", age: 21)
        wishHappyBirthday(to: birthdayPerson)
        // 打印 “Happy birthday Malcolm - you're 21!”
        
        
        //Named 协议包含 String 类型的 name 属性。Aged 协议包含 Int 类型的 age 属性。Person 结构体遵循了这两个协议。
        
        //wishHappyBirthday(to:) 函数的参数 celebrator 的类型为 Named & Aged。这意味着它不关心参数的具体类型，只要参数符合这两个协议即可。
        
        //上面的例子创建了一个名为 birthdayPerson 的 Person_A 的实例，作为参数传递给了 wishHappyBirthday(to:) 函数。因为 Person_A 同时符合这两个协议，所以这个参数合法，函数将打印生日问候语。”
        

        //“注意
        //协议合成并不会生成新的、永久的协议类型，而是将多个协议中的要求合成到一个只在局部作用域有效的临时协议中。”
        
        
        
        
        //“如下所示，objects 数组可以被迭代，并对迭代出的每一个元素进行检查，看它是否符合 HasArea 协议：
        
        for object in objects {
            if let objectWithArea = object as? HasArea {
                print("Area is \(objectWithArea.area)")
            } else {
                print("Something that doesn't have an area")
            }
        }
        // Area is 12.5663708
        // Area is 243610.0
        // Something that doesn't have an area”
        
        //“当迭代出的元素符合 HasArea 协议时，将 as? 操作符返回的可选值通过可选绑定，绑定到 objectWithArea 常量上。objectWithArea 是 HasArea 协议类型的实例，因此 area 属性可以被访问和打印。
        
        //objects 数组中的元素的类型并不会因为强转而丢失类型信息，它们仍然是 Circle，Country，Animal 类型。然而，当它们被赋值给 objectWithArea 常量时，只被视为 HasArea 类型，因此只有 area 属性能够被访问。”
        

    }
}


//MARK: -协议合成

//“有时候需要同时遵循多个协议，你可以将多个协议采用 SomeProtocol & AnotherProtocol 这样的格式进行组合，称为 协议合成（protocol composition）。你可以罗列任意多个你想要遵循的协议，以与符号(&)分隔。”

//“下面的例子中，将 Named 和 Aged 两个协议按照上述语法组合成一个协议，作为函数参数的类型：

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person_A: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}



//MARK: -检查协议一致性



/*
 “你可以使用类型转换中描述的 is 和 as 操作符来检查协议一致性，即是否符合某协议，并且可以转换到指定的协议类型。检查和转换到某个协议类型在语法上和类型的检查和转换完全相同：
 
 is 用来检查实例是否符合某个协议，若符合则返回 true，否则返回 false。
 as? 返回一个可选值，当实例符合某个协议时，返回类型为协议类型的可选值，否则返回 nil。
 as! 将实例强制向下转换到某个协议类型，如果强转失败，会引发运行时错误。
 下面的例子定义了一个 HasArea 协议，该协议定义了一个 Double 类型的可读属性 area：”
 
 */

protocol HasArea {
    var area: Double { get }
}
//如下所示，Circle 类和 Country 类都遵循了 HasArea 协议：

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}


//“如下所示，Animal 是一个未遵循 HasArea 协议的类：

class Animal_A {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}
//Circle，Country，Animal 并没有一个共同的基类，尽管如此，它们都是类，它们的实例都可以作为 AnyObject 类型的值，存储在同一个数组中：

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal_A(legs: 4)
]

//“objects 数组使用字面量初始化，数组包含一个 radius 为 2 的 Circle 的实例，一个保存了英国国土面积的 Country 实例和一个 legs 为 4 的 Animal 实例。”



