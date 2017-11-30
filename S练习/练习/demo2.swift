//
//  demo2.swift
//  练习
//
//  Created by hudun on 2017/8/9.
//  Copyright © 2017年 hudun. All rights reserved.
//

import Foundation
// 这个写法是错误的，编译会失败
// 因为NonSubclassableParentClass类访问权限标记的是public，只能被访问不能被继承
class SubclassA : NonSubclassableParentClass { }

// 这样写法可以通过，因为SubclassableParentClass访问权限为 `open`.
class SubclassB : SubclassableParentClass {
    
    // 这样写也会编译失败
    // 因为这个方法在SubclassableParentClass 中的权限为public，不是`open'.
    override func foo() { }
    
    // 这个方法因为在SubclassableParentClass中标记为open，所以可以这样写
    // 这里不需要再声明为open，因为这个类是internal的
    override func bar() { }
}

open class SubclassC : SubclassableParentClass {
    // 这种写法会编译失败，因为这个类已经标记为open
    // 这个方法override是一个open的方法，则也需要表明访问权限
    
//    override func bar() { }
}

open class SubclassD : SubclassableParentClass {
    // 正确的写法，方法也需要标记为open
    open override func bar() { }
}

open class SubclassE : SubclassableParentClass {
    // 也可以显式的指出这个方法不能在被override
    public final override func bar() { }
}


// MARK: - A
class A {
    fileprivate var privateStr = "private"
    
    // MARK: 接口
    fileprivate func setup() {
        setupStyle()
        setupLayout()
        setupTableView()
    }
    
    // MARK: Implementation 实现
    private func setupStyle() {}
    
    private func setupLayout() {}
    
    private func setupTableView() {}

    
    open func testOpen() {}
}

extension A{
    
    // MARK: A
    
    var accessPrivate: String {
        return privateStr
    }
}

class B: A {
    
    override func testOpen() {
        
    }
    
    override func setup() {
        super.setup()
    }

    //错误
//    override func setupStyle() {
//        
//    }
}
