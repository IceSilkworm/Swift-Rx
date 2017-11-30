
//
//  Extension_01.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Extension_01: NSObject {

    //“扩展 就是为一个已有的类、结构体、枚举类型或者协议类型添加新功能。这包括在没有权限获取原始源代码的情况下扩展类型的能力（即 逆向建模 ）。扩展和 Objective-C 中的分类类似。（与 Objective-C 不同的是，Swift 的扩展没有名字。）”
    

    //“Swift 中的扩展可以：
    
    //添加计算型属性和计算型类型属性”
    //“定义实例方法和类型方法
    //提供新的构造器
    //定义下标
    //定义和使用新的嵌套类型
    //使一个已有类型符合某个协议”
    
    
    //“在 Swift 中，你甚至可以对协议进行扩展，提供协议要求的实现，或者添加额外的功能，从而可以让符合协议的类型拥有这些功能。你可以从协议扩展获取更多的细节。
    
    //注意
    //扩展可以为一个类型添加新的功能，但是不能重写已有的功能。”
    
    //“注意
    //如果你通过扩展为一个已有类型添加新功能，那么新功能对该类型的所有已有实例都是可用的，即使它们是在这个扩展定义之前创建的。”
    

    func run() -> Void {
        
        let oneInch = 25.4.mm
        print("One inch is \(oneInch) meters")
        // 打印 “One inch is 0.0254 meters”
        let threeFeet = 3.ft
        print("Three feet is \(threeFeet) meters")
        // 打印 “Three feet is 0.914399970739201 meters”
        
        
        let aMarathon = 42.km + 195.m
        print("A marathon is \(aMarathon) meters long")
        // 打印 “A marathon is 42195.0 meters long”
        
        
        //“注意
        //扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。”
        
    }
}


extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

//“其它单位则需要一些单位换算。一千米等于 1,000 米，所以计算型属性 km 要把值乘以 1_000.00 来实现千米到米的单位换算。类似地，一米有 3.28024 英尺，所以计算型属性 ft 要把对应的 Double 值除以 3.28024 来实现英尺到米的单位换算。”


