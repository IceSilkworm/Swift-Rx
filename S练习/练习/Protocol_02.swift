//
//  Protocol_02.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_02: NSObject {

    
    //方法
    
    //“协议可以要求遵循协议的类型实现某些指定的实例方法或类方法。这些方法作为协议的一部分，像普通方法一样放在协议的定义中，但是不需要大括号和方法体。可以在协议中定义具有可变参数的方法，和普通方法的定义方式相同。但是，不支持为协议中的方法的参数提供默认值。
    
    //正如属性要求中所述，在协议中定义类方法的时候，总是使用 static 关键字作为前缀。当类类型遵循协议时，除了 static 关键字，还可以使用 class 关键字作为前缀：
    
    
    func run() -> Void {
        
        
        
        let generator = LinearCongruentialGenerator()
        print("Here's a random number: \(generator.random())")
        // 打印 “Here's a random number: 0.37464991998171”
        print("And another one: \(generator.random())")
        // 打印 “And another one: 0.729023776863283”
        
    }
}


protocol RandomNumberGenerator {
    static func someTypeMethod()
    func random() -> Double
}


//“RandomNumberGenerator 协议并不关心每一个随机数是怎样生成的，它只要求必须提供一个随机数生成器。”
//“如下所示，下边是一个遵循并符合 RandomNumberGenerator 协议的类。该类实现了一个叫做 线性同余生成器（linear congruential generator） 的伪随机数算法。”

class LinearCongruentialGenerator: RandomNumberGenerator {
    static func someTypeMethod() {
        
    }

    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

