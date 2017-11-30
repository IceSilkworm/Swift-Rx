//
//  Protocol_03.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_03: NSObject {

    //Mutating 方法要求
    
    //“有时需要在方法中改变方法所属的实例。例如，在值类型（即结构体和枚举）的实例方法中，将 mutating 关键字作为方法的前缀，写在 func 关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值。这一过程在在实例方法中修改值类型章节中有详细描述。
    
    //如果你在协议中定义了一个实例方法，该方法会改变遵循该协议的类型的实例，那么在定义协议时需要在方法前加 mutating 关键字。这使得结构体和枚举能够遵循此协议并满足此方法要求。”
    
    //“注意
    //实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字。”
    

    func run() -> Void {
        
        
        var lightSwitch = OnOffSwitch.Off
        lightSwitch.toggle()
        // lightSwitch 现在的值为 .On”
        
        
    }
}



//“如下所示，Togglable 协议只要求实现一个名为 toggle 的实例方法。根据名称的暗示，toggle() 方法将改变实例属性，从而切换遵循该协议类型的实例的状态。

//toggle() 方法在定义的时候，使用 mutating 关键字标记，这表明当它被调用时，该方法将会改变遵循协议的类型的实例：

protocol Togglable {
    mutating func toggle()
}

//“当使用枚举或结构体来实现 Togglable 协议时，需要提供一个带有 “mutating 前缀的 toggle() 方法。”
enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}

class TypeClassType: Togglable {
    func toggle() {
        
    }
}
