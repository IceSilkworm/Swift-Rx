//
//  Construction_02.swift
//  练习
//
//  Created by hudun on 2017/8/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Construction_02: NSObject {

    //“值类型的构造器代理”
    //“构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复。
    
    //构造器代理的实现规则和形式在值类型和类类型中有所不同。值类型（结构体和枚举类型）不支持继承，所以构造器代理的过程相对简单，因为它们只能代理给自己的其它构造器。类则不同，它可以继承自其它类（请参考继承），这意味着类有责任保证其所有继承的存储型属性在构造时也能正确的初始化。”
    
    //“对于值类型，你可以使用self.init在自定义的构造器中引用相同类型中的其它构造器。并且你只能在构造器内部调用self.init。
    
    //如果你为某个 " 值类型 " 定义了一个自定义的构造器，你将无法访问到默认构造器（如果是结构体，还将无法访问逐一成员构造器）。这种限制可以防止你为值类型增加了一个额外的且十分复杂的构造器之后,仍然有人错误的使用自动生成的构造器”
    
    
    //“注意
    //假如你希望默认构造器、逐一成员构造器以及你自己的自定义构造器都能用来创建实例，可以将自定义的构造器写到扩展（extension）中，而不是写在值类型的原始定义中。想查看更多内容，请查看扩展章节。”
    

    func run() {
        
        let _ = Rect()
        // basicRect 的 origin 是 (0.0, 0.0)，size 是 (0.0, 0.0)
        
        let _ = Rect(origin: Point(x: 2.0, y: 2.0),
                                 size: Size(width: 5.0, height: 5.0))
        // originRect 的 origin 是 (2.0, 2.0)，size 是 (5.0, 5.0)”
        
        let _ = Rect(center: Point(x: 4.0, y: 4.0),
                                 size: Size(width: 3.0, height: 3.0))
        // centerRect 的 origin 是 (2.5, 2.5)，size 是 (3.0, 3.0)”
        
        
        //“注意
        //如果你想用另外一种不需要自己定义init()和init(origin:size:)的方式来实现这个例子，请参考扩展。”
        
    }
}



struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
    
    
    
    
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
    
}
