//
//  Function03.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Function03: NSObject {

    // MARK: - 函数类型
    //“每个函数都有种特定的函数类型，函数的类型由函数的参数类型和返回类型组成”
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    
    // MARK: - “函数类型作为参数类型”
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) -> () {
        
        print("Result: \(mathFunction(a, b))")
    }
    
    // MARK: - “函数类型作为返回类型”
    //“你可以用函数类型作为另一个函数的返回类型。你需要做的是在返回箭头（->）后写一个完整的函数类型。”
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    
    func chooseStepFunction(backward: Bool) -> (Int)->Int {
        return backward ? stepBackward : stepForward
    }

    
    // MARK: - 嵌套函数
    /*
     “到目前为止本章中你所见到的所有函数都叫全局函数（global functions），它们定义在全局域中。你也可以把函数定义在别的函数体中，称作 嵌套函数（nested functions）。
     
     默认情况下，嵌套函数是对外界不可见的，但是可以被它们的外围函数（enclosing function）调用。一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用。
     
     你可以用返回嵌套函数的方式重写 chooseStepFunction(backward:) 函数：”
     */
    
    func nestedFunction(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return backward ? stepBackward : stepForward
    }
    
    func run() -> Void {
        
        // MARK: - 使用函数类型
        //“在 Swift 中，使用函数类型就像使用其他类型一样。例如，你可以定义一个”“类型为函数的常量或变量，并将适当的函数赋值给它：”
        var mathFunction:(Int, Int) -> Int = addTwoInts(_:_:)
        //“定义一个叫做 mathFunction 的变量，类型是‘一个有两个 Int 型的参数并返回一个 Int 型的值的函数’，并让这个新变量指向 addTwoInts 函数”。”
        print(mathFunction(1, 3))  // 4
        
        //“有相同匹配类型的不同函数可以被赋值给同一个变量，就像非函数类型的变量一样：”
        
        mathFunction = multiplyTwoInts(_:_:)
        print(mathFunction(2, 3))  // 6
        
        printMathResult(addTwoInts(_:_:), 3, 5)
        printMathResult(addTwoInts, 3, 5)
        // 打印 "Result: 8”
        
        var currentValue = 3
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        // moveNearerToZero 现在指向 stepBackward() 函数。”
        
        
        //一个指向返回的函数的引用保存在了 moveNearerToZero 常量中。现在，moveNearerToZero指向了正确的函数，它可以被用来数到零：”
        
        print("Counting to zero:")
        // Counting to zero:
        while currentValue != 0 {
            print("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        }
        print("zero!")
        // 3...
        // 2...
        // 1...
        // zero!”
        
        var nestedcurrentValue = -4
        let nestedmoveNearerToZero = nestedFunction(backward: nestedcurrentValue > 0)
        // moveNearerToZero now refers to the nested stepForward() function
        while nestedcurrentValue != 0 {
            print("\(nestedcurrentValue)... ")
            nestedcurrentValue = nestedmoveNearerToZero(nestedcurrentValue)
        }
        print("zero!")
        // -4...
        // -3...
        // -2...
        // -1...
        // zero!”
    }
}
