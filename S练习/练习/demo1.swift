//
//  demo1.swift
//  练习
//
//  Created by hudun on 2017/8/9.
//  Copyright © 2017年 hudun. All rights reserved.
//

import Foundation
/// ModuleA:

// 这个类在ModuleA的范围外是不能被继承的，只能被访问
public class NonSubclassableParentClass {
    
    public func foo() {}
    
    // 这是错误的写法，因为class已经不能被继承，
    // 所以他的方法的访问权限不能大于类的访问权限
    open func bar() {}
    
    // final的含义保持不变
    public final func baz() {}
}

// 在ModuleA的范围外可以被继承
open class SubclassableParentClass {
    // 这个属性在ModuleA的范围外不能被override
    public var size : Int = 0
    
    // 这个方法在ModuleA的范围外不能被override
    public func foo() {}
    
    // 这个方法在任何地方都可以被override
    open func bar() {}
    
    ///final的含义保持不变
    public final func baz() {}
}

/// final的含义保持不变
public final class FinalClass { }

