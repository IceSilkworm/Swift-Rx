//
//  Protocol_04.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_04: NSObject {

    //构造器要求
    
    //“协议可以要求遵循协议的类型实现指定的构造器。你可以像编写普通构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体：”
    

    
    
    func run() -> Void {
        
        
    }
}

protocol Constructor_SomeProtocol {
    init(someParameter: Int)
}

//“你可以在遵循协议的类中实现构造器，无论是作为指定构造器，还是作为便利构造器。无论哪种情况，你都必须为构造器实现标上 required 修饰符：

class Constructor_SomeClass: Constructor_SomeProtocol {
    required init(someParameter: Int) {
        // 这里是构造器的实现部分
    }
}
//使用 required 修饰符可以确保所有子类也必须提供此构造器实现，从而也能符合协议。

//关于 required 构造器的更多内容，请参考必要构造器。

//注意
//如果类已经被标记为 final，那么不需要在协议构造器的实现中使用 required 修饰符，因为 final 类不能有子类。关于 final 修饰符的更多内容，请参见防止重写。”



//“如果一个子类重写了父类的指定构造器，并且该构造器满足了某个协议的要求，那么该构造器的实现需要同时标注 required 和 override 修饰符：”

protocol SomeProtocol_A {
    init()
}

class SomeSuperClass {
    init() {
        // 这里是构造器的实现部分”
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol_A {
    // 因为遵循协议，需要加上 required
    // 因为继承自父类，需要加上 override
    required override init() {
        // 这里是构造器的实现部分
    }
}

/*
“可失败构造器要求

协议还可以为遵循协议的类型定义可失败构造器要求，详见可失败构造器。

遵循协议的类型可以通过可失败构造器（init?）或非可失败构造器（init）来满足协议中定义的可失败构造器要求。协议中定义的非可失败构造器要求可以通过非可失败构造器（init）或隐式解包可失败构造器（init!）来满足。”

*/






