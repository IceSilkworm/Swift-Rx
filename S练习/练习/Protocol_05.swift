//
//  Protocol_05.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_05: NSObject {

    
    //协议作为类型
    
    //“尽管协议本身并未实现任何功能，但是协议可以被当做一个成熟的类型来使用。
    
    //协议可以像其他普通类型一样使用，使用场景如下：
    
    //作为函数、方法或构造器中的参数类型或返回值类型
    //作为常量、变量或属性的类型
    //作为数组、字典或其他容器中的元素类型
    //注意
    //协议是一种类型，因此协议类型的名称应与其他类型（例如 Int，Double，String）的写法相同，使用大写字母开头的驼峰式写法，例如（FullyNamed 和 RandomNumberGenerator）。”
    

    func run() -> Void {
        
        //“下面的例子展示了如何使用 LinearCongruentialGenerator 的实例作为随机数生成器来创建一个六面骰子：”
        let d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
        for _ in 1...5 {
            print("Random dice roll is \(d6.roll())")
        }
        // Random dice roll is 3
        // Random dice roll is 5
        // Random dice roll is 4
        // Random dice roll is 5
        // Random dice roll is 4”
        
    }
}

//“下面是将协议作为类型使用的例子：

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}


/*
 “例子中定义了一个 Dice 类，用来代表桌游中拥有 N 个面的骰子。Dice 的实例含有 sides 和 generator 两个属性，前者是整型，用来表示骰子有几个面，后者为骰子提供一个随机数生成器，从而生成随机点数。
 
 generator 属性的类型为 RandomNumberGenerator，因此任何遵循了 RandomNumberGenerator 协议的类型的实例都可以赋值给 generator，除此之外并无其他要求。
 
 Dice 类还有一个构造器，用来设置初始状态。构造器有一个名为 generator，类型为 RandomNumberGenerator 的形参。在调用构造方”“法创建 Dice 的实例时，可以传入任何遵循 RandomNumberGenerator 协议的实例给 generator。
 
 Dice 类提供了一个名为 roll 的实例方法，用来模拟骰子的面值。它先调用 generator 的 random() 方法来生成一个 [0.0,1.0) 区间内的随机数，然后使用这个随机数生成正确的骰子面值。因为 generator 遵循了 RandomNumberGenerator 协议，可以确保它有个 random() 方法可供调用。”
 
 
 */
