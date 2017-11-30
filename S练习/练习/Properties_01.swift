//
//  Properties_01.swift
//  练习
//
//  Created by hudun on 2017/8/14.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Properties_01: NSObject {

    //MARK: - 介绍
    /*
     
     “属性将值跟特定的类、结构或枚举关联。存储属性存储常量或变量作为实例的一部分，而计算属性计算（不是存储）一个值。计算属性可以用于类、结构体和枚举，存储属性只能用于类和结构体。
     
     存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接作用于类型本身，这种属性称为类型属性。
     
     另外，还可以定义属性观察器来监控属性值的变化，以此来触发一个自定义的操作。属性观察器可以添加到自己定义的存储属性上，也可以添加到从父类继承的属性上”
     
     */
    
    
    //MARK: - 存储属性
    //“一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。存储属性可以是变量存储属性（用关键字 var 定义），也可以是常量存储属性（用关键字 let 定义）”
    
    
    
    func run() -> () {
        
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        // 该区间表示整数0，1，2
        rangeOfThreeItems.firstValue = 6
        // 该区间现在表示整数6，7，8”
        
        //“length 在创建实例的时候被初始化，因为它是一个常量存储属性，所以之后无法修改它的值。”
        
        
        // MARK: - “常量结构体的存储属性”
        //“如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行：
        
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        // 该区间表示整数0，1，2，3
        
   //     rangeOfFourItems.firstValue = 6
        
        // 尽管 firstValue 是个变量属性，这里还是会报错
        
        
        //因为 rangeOfFourItems 被声明成了常量（用 let 关键字），即使 firstValue 是一个变量属性，也无法再修改它了。
        
        //这种行为是由于结构体（struct）属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。
        
        //属于引用类型的类（class）则不一样。把一个引用类型的实例赋给一个常量后，仍然可以修改该实例的变量属性。”
        
    }
}

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
