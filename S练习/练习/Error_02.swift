//
//  Error_02.swift
//  练习
//
//  Created by hudun on 2017/9/20.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Error_02: NSObject {

    /*
    “在 Swift 中，错误用符合Error协议的类型的值来表示。这个空协议表明该类型可以用于错误处理。
    
    Swift 的枚举类型尤为适合构建一组相关的错误状态，枚举的关联值还可以提供错误状态的额外信息。例如，你可以这样表示在一个游戏中操作自动贩卖机时可能会出现的错误状态：”
    */

    
    enum VendingMachineError_demo: Error {
        case invalidSelection                     //选择无效
        case insufficientFunds(coinsNeeded: Int) //金额不足
        case outOfStock                             //缺货
    }
    

    //MARK: - 处理错误
    //“某个错误被抛出时，附近的某部分代码必须负责处理这个错误，例如纠正这个问题、尝试另外一种方式、或是向用户报告错误。
    
    //Swift 中有4种处理错误的方式。你可以把函数抛出的错误传递给调用此函数的代码、用do-catch语句处理错误、将错误作为可选类型处理、或者断言此错误根本不会发生。每种方式在下面的小节中都有描述”
    
    //“当一个函数抛出一个错误时，你的程序流程会发生改变，所以重要的是你能迅速识别代码中会抛出错误的地方。为了标识出这些地方，在调用一个能抛出错误的函数、方法或者构造器之前，加上try关键字，或者try?或try!这种变体。这些关键字在下面的小节中有具体讲解。”
    
    
    //“注意
    //Swift 中的错误处理和其他语言中用try，catch和throw进行异常处理很像。和其他语言中（包括 Objective-C ）的异常处理不同的是，Swift 中的错误处理并不涉及解除调用栈，这是一个计算代价高昂的过程。就此而言，throw语句的性能特性是可以和return语句相媲美的。”
    

    
    func run() -> () {
        
        //throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
        
        
        //“用 throwing 函数传递错误”
        
        //为了表示一个函数、方法或构造器可以抛出错误，在函数声明的参数列表之后加上throws关键字。一个标有throws关键字的函数被称作throwing 函数。如果这个函数指明了返回值类型，throws关键词需要写在箭头（->）的前面。
        
        func canThrowErrors() throws -> String {
            return ""
        }
        func cannotThrowErrors() -> String {
            return ""
        }
        //一个 throwing 函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域。
        
        //注意
        //只有 throwing 函数可以传递错误。任何在某个非 throwing 函数内部抛出的错误只能在函数内部处理。”
        
    }
}


enum VendingMachineError: Error {
    case invalidSelection                     //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock                             //缺货
}
    
