//
//  Properties_02.swift
//  练习
//
//  Created by hudun on 2017/8/14.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Properties_02: NSObject {

    //MARK: - “延迟存储属性
    
    //延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储属性。”
    
    //“注意
    //必须将延迟存储属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。”
    
    //“延迟属性很有用，当属性的值依赖于在实例的构造过程结束后才会知道影响值的外部因素时，或者当获得属性的初始值需要复杂或大量计算时，可以只在需要的时候计算它。”
    
    
    
    
    
    
    //“存储属性和实例变量
    
    //如果您有过 Objective-C 经验，应该知道 Objective-C 为类实例存储值和引用提供两种方法。除了属性之外，还可以使用实例变量作为属性值的后端存储。
    
    //Swift 编程语言中把这些理论统一用属性来实现。Swift 中的属性没有对应的实例变量，属性的后端存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。”
    
    
    
    
    // MARK: - 计算属性
    
    //“除存储属性外，类、结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属”“性或变量的值。”
    
    
    
    
    func run() -> Void {
        
        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some more data")
        // DataImporter 实例的 importer 属性还没有被创建”
        
        
        //“由于使用了 lazy ，importer 属性只有在第一次被访问的时候才被创建。比如访问它的属性 fileName 时：”
        
        print(manager.importer.fileName)
        // DataImporter 实例的 importer 属性现在被创建了
        // 输出 "data.txt”
        
        
        //“注意
        //如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。”
        
        
        
        
        
        var square = Rect(origin: Point(x: 0.0, y: 0.0),
                             size: Size(width: 10.0, height: 10.0))
        let initialSquareCenter = square.center
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        // 打印 "square.origin is now at (10.0, 10.0)”
        
        print(initialSquareCenter)
        
        
        /*
         “Rect也提供了一个名为center 的计算属性。一个矩形的中心点可以从原点（origin）和大小（size）算出，所以不需要将它以显式声明的 Point 来保存。Rect 的计算属性 center 提供了自定义的 getter 和 setter 来获取和设置矩形的中心点，就像它有一个存储属性一样。
         
         上述例子中创建了一个名为 square 的 Rect 实例，初始值原点是 (0, 0)，宽度高度都是 10。如下图中蓝色正方形所示。
         
         square 的 center 属性可以通过点运算符（square.center）来访问，这会调用该属性的 getter 来获取它的值。跟直接返回已经存在的值不同，getter 实际上通过计算然后返回一个新的 Point 来表示 square 的中心点。如代码所示，它正确返回[…]”
         
         */
        
        
        // MARK: - “简化 setter 声明”
        
        
        //MARK: - “只读计算属性”
        
        //“只有 getter 没有 setter 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。”
        
        //“注意
        //必须使用 var 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let 关键字只用来声明常量属性，表示初始化后再也无法修改的值”
        
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        
        //MARK: - 错误
//        fourByFiveByTwo.volume = 10
        print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
        // 打印 "the volume of fourByFiveByTwo is 40.0”
        
        //“这个例子定义了一个名为 Cuboid 的结构体，表示三维空间的立方体，包含 width、height 和 depth 属性。结构体还有一个名为 volume 的只读计算属性用来返回立方体的体积。为 volume 提供 setter 毫无意义，因为无法确定如何修改 width、height 和 depth 三者的值来匹配新的 volume。然而，Cuboid 提供一个只读计算属性来让外部用户直接获取体积是很有用的。”
        
    }
}


class DataImporter {
    /*
     DataImporter 是一个负责将外部文件中的数据导入的类。
     这个类的初始化会消耗不少时间。
     */
    var fileName = "data.txt"
    // 这里会提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // 这里会提供数据管理功能
}


// MARK: - “简化 setter 声明”

//“如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue。下面是使用了简化 setter 声明的 Rect 结构体代码：”

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


//“只读计算属性”
//“只读计算属性的声明可以去掉 get 关键字和花括号：”

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

