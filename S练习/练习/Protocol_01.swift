//
//  Protocol_01.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_01: NSObject {

    //协议
    
    //“协议 定义了一个蓝图，规定了用来实现某一特定任务或者功能的方法、属性，以及其他需要的东西。类、结构体或枚举都可以遵循协议，并为协议定义的这些要求提供具体实现。某个类型能够满足某个协议的要求，就可以说该类型遵循这个协议。
    
    //除了遵循协议的类型必须实现的要求外，还可以对协议进行扩展，通过扩展来实现一部分要求或者实现一些附加功能，这样遵循协议的类型就能够使用这些功能。”
    
    
    
    func run() -> Void {
        
        let john = PersonProtocol(fullName: "John Appleseed")
        // john.fullName 为 "John Appleseed”
        print(john.fullName)
        
        
        
        //
        
        
        let ncc1701 = Starship(name: "Enterprise", prefix: "USS")
        // ncc1701.fullName 是 "USS Enterprise”
        
        print(ncc1701.fullName)
    }
}

//MARK: -属性要求
/*
“协议可以要求遵循协议的类型提供特定名称和类型的实例属性或类型属性。协议不指定属性是存储型属性还是计算型属性，它只指定属性的名称和类型。此外，协议还指定属性是可读的还是可读可写的。

如果协议要求属性是可读可写的，那么该属性不能是常量属性或只读的计算型属性。如果协议只要求属性是可读的，那么该属性不仅可以是可读的，如果代码需要的话，还可以是可写的。

协议总是用 var 关键字来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，可读属性则用 { get } 来表示：”
*/


protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

//“在协议中定义类型属性时，总是使用 static 关键字作为前缀。当类类型遵循协议时，除了 static 关键字，还可以使用 class 关键字来声明类型属性：”

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
//如下所示，这是一个只含有一个实例属性要求的协议：

protocol FullyNamed {
    var fullName: String { get }
}


//“FullyNamed 协议除了要求遵循协议的类型提供 fullName 属性外，并没有其他特别的要求。这个协议表示，任何遵循 FullyNamed 的类型，都必须有一个可读的 String 类型的实例属性 fullName。

//下面是一个遵循 FullyNamed 协议的简单结构体：
//“PersonProtocol 结构体的每一个实例都有一个 String 类型的存储型属性 fullName。这正好满足了 FullyNamed 协议的要求，也就意味着 PersonProtocol 结构体正确地符合了协议。（如果协议要求未被完全满足，在编译时会报错。）
struct PersonProtocol: FullyNamed {
    var fullName: String
}

//“下面是一个更为复杂的类，它适配并遵循了 FullyNamed 协议：

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

