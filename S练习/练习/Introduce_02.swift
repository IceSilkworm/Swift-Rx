//
//  Introduce_02.swift
//  练习
//
//  Created by hudun on 2017/8/14.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Introduce_02: NSObject {

    //MARK: - “结构体和枚举是值类型”
    
    //“值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
    
    /*
     
     “我们已经大量使用了值类型。实际上，在 Swift 中，所有的基本类型：整数（Integer）、浮点数（floating-point）、布尔值（Boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，并且在底层都是以结构体的形式所实现。
     
     在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。”
     
     */
    
    
    // MARK: - “类是引用类型”
    /*
     
     “与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝。”
     
     */
    
    func run() -> () {
        
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        
        //“在以上示例中，声明了一个名为hd的常量，其值为一个初始化为全高清视频分辨率（1920 像素宽，1080 像素高）的Resolution实例。
        
        //然后示例中又声明了一个名为cinema的变量，并将hd赋值给它。因为Resolution是一个结构体，所以cinema的值其实是hd的一个拷贝副本，而不是hd本身。尽管hd和cinema有着相同的宽（width）和高（height），但是在幕后它们是两个完全不同的实例。”
        
        //“下面，为了符合数码影院放映的需求（2048 像素宽，1080 像素高），cinema的width属性需要作如下修改：”
        
        cinema.width = 2048
        print("cinema is now  \(cinema.width) pixels wide")
        // 打印 "cinema is now 2048 pixels wide”
        
        print("hd is still \(hd.width) pixels wide")
        // 打印 "hd is still 1920 pixels wide”
        
        
        var currentDirection = CompassPoint.West
        let rememberedDirection = currentDirection
        currentDirection = .East
        if rememberedDirection == .West {
            print("The remembered direction is still .West")
        }
        // 打印 "The remembered direction is still .West"
        
        
        
        // 类 ，演示
        
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
        // 打印 "The frameRate property of theEighty is now 30.0"
        
        //“需要注意的是tenEighty和alsoTenEighty被声明为常量而不是变量。然而你依然可以改变tenEighty.frameRate和alsoTenEighty.frameRate，因为tenEighty和alsoTenEighty这两个常量的值并未改变。它们并不“存储”这个VideoMode实例，而仅仅是对VideoMode实例的引用。所以，改变的是被引用的VideoMode的frameRate属性，而不是引用VideoMode的常量的值。”
        
        
        // MARK: - 恒等运算符
        
        /*
         
         “因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）
         
         如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符：”
                  
         “等价于（===）
         不等价于（!==）”
         
         */
        
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
        }
        //打印 "tenEighty and alsoTenEighty refer to the same Resolution instance.”
        
        /*
         
         “请注意，“等价于”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同：
         
         “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
         “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
         当你在定义你的自定义类和结构体的时候，你有义务来决定判定两个实例“相等”的标准。”
         
         */
        
        
        
        // MARK: - 指针
        
        //“如果你有 C，C++ 或者 Objective-C 语言的经验，那么你也许会知道这些语言使用指针来引用内存中的地址。一个引用某个引用类型实例的 Swift 常量或者变量，与 C 语言中的指针类似，但是并不直接指向某个内存地址，也不要求你使用星号（*）来表明你在创建一个引用。Swift 中的这些引用与其它的常量或变量的定义方式相同。”
        
    }
}

//“枚举也遵循相同的行为准则：”
enum CompassPoint {
    case North, South, East, West
}

