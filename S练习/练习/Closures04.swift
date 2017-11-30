//
//  Closures04.swift
//  练习
//
//  Created by hudun on 2017/8/11.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Closures04: NSObject {

    // MARK: - 逃逸闭包
    
    // MARK: - 重点
    
    /*
     在方法或函数声明中将此属性应用于参数的类型，以指示参数的值可以存储以备以后执行。这意味着该值被允许超过调用的生命周期。具有escapingtype属性的函数类型参数需要明确使用self.属性或方法。
     
     */
    
    //“当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被”“执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。”
    
    //var escapingClosure: (() -> ())?
    
    var completionHandlers: [(_ x: Int) -> Void] = []
    func someFunctionWithEscapingClosure(completionHandle: @escaping(_ x: Int) -> Void) -> () {
        
        
        completionHandlers.append(completionHandle)
    }
    
    func someFunctionWithNonescapingClosure(closure: ()-> Void) -> Void {
        
        closure()
    }
    
    var x = 10
    //“将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self。比如说，在下面的代码中，传递到 someFunctionWithEscapingClosure(_:) 中的闭包是一个逃逸闭包，这意味着它需要显式地引用 self。相对的，传递到 someFunctionWithNonescapingClosure(_:) 中的闭包是一个非逃逸闭包，这意味着它可以隐式引用 self。”
    func doSomething () {
        
        someFunctionWithEscapingClosure { (x) -> () in
            self.x = x
        }
        
        someFunctionWithNonescapingClosure { x = 200 }
    }
    
    
    func run() -> Void {
        
        
        self.doSomething()
        print(self.x)
        // 打印出 "200"
        
        guard let _ = completionHandlers.first else {
            
            print("Null")
            return
        }
        
        completionHandlers.first?(1300)
        print(self.x)
        // 打印出 "1300”
        
    }
}
