//
//  Introduce_01.swift
//  练习
//
//  Created by hudun on 2017/8/14.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Introduce_01: NSObject {

    //“类和结构体对比”
    
    //“类和结构体是人们构建代码所用的一种通用且灵活的构造体。我们可以使用完全相同的语法规则来为类和结构体定义属性（常量、变量）和添加方法，从而扩展类和结构体的功能。
    
    //与其他编程语言所不同的是，Swift 并不要求你为自定义类和结构去创建独立的接口和实现文件。你所要做的是在一个单一文件中定义一个类或者结构体，系统将会自动生成面向其它代码的外部接口。”
    
    //“注意
    //通常一个类的实例被称为对象。然而在 Swift 中，类和结构体的关系要比”“在其他语言中更加的密切，本章中所讨论的大部分功能都可以用在类和结构体上。因此，我们会主要使用实例。”
    
    
    /*
     
     “Swift 中类和结构体有很多共同点。共同处在于：
     
     定义属性用于存储值
     定义方法用于提供功能
     定义下标操作使得可以通过下标语法来访问实例所包含的值
     定义构造器用于生成初始化值
     通过扩展以增加默认实现的功能
     实现协议以提供某种标准功能
     ”
     
     
     “与结构体相比，类还有如下的附加功能：
     
     继承允许一个类继承另一个类的特征
     类型转换允许在运行时检查和解释一个类实例的类型
     析构器允许一个类实例释放任何其所被分配的资源
     引用计数允许对一个类的多次引用
     ”
     
     */
    
    class SomeClass {
        // 在这里定义类
    }
    struct SomeStructure {
        // 在这里定义结构体
    }
    //“注意
    //在你每次定义一个新类或者结构体的时候，实际上你是定义了一个新的 Swift 类型。因此请使用UpperCamelCase这种方式来命名（如SomeClass和SomeStructure等），以便符合标准 Swift 类型的大写命名风格（如String，Int和Bool）。相反的，请使用lowerCamelCase这种方式为属性和方法命名（如framerate和incrementCount），以便和类型名区分。”
    
    
    func run() -> () {
        
        let video = VideoMode()
        print(video.resolution)
        
        // MARK: -  “类和结构体实例”
        
        //“生成结构体和类实例的语法非常相似：
        
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        print("The width of someResolution is \(someResolution.width)")
        // 打印 "The width of someResolution is 0”
        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
        // 打印 "The width of someVideoMode is 0”
        
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
        // 打印 "The width of someVideoMode is now 1280”
        
        
        /*
         
         “注意
         与 Objective-C 语言不同的是，Swift 允许直接设置结构体属性的子属性。上面的最后一个例子，就是直接设置了someVideoMode中resolution属性的width这个子属性，以上操作并不需要重新为整个resolution属性设置新值。”
         
         */
        
        // MARK: - “结构体类型的成员逐一构造器”
        
        //“所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性的名称传递到”“成员逐一构造器之中：”
        
        let _ = Resolution(width: 640, height: 960)
        //“与结构体不同，类实例没有默认的成员逐一构造器。”
    }
}

//“以下是定义结构体和定义类的示例：”

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

