//
//  Generics_01.swift
//  练习
//
//  Created by hudun on 2017/9/22.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Generics_01: NSObject {

    //“泛型代码让你能够根据自定义的需求，编写出适用于任意类型、灵活可重用的函数及类型。它能让你避免代码的重复，用一种清晰和抽象的方式来表达代码的意图。”
    
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    

    func run() -> Void {
        
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        // 打印 “someInt is now 107, and anotherInt is now 3”
        
        
        //“注意
        //在上面三个函数中，a 和 b 类型相同。如果 a 和 b 类型不同，那它们俩就不能互换值。Swift 是类型安全的语言，所以它不允许一个 String 类型的变量和一个 Double 类型的变量互换值。试图这样做将导致编译错误。”
        
        
        
        someInt = 3
        anotherInt = 107
        swapTwoValues(&someInt, &anotherInt)
        // someInt 现在 107, and anotherInt 现在 3
        
        var someString = "hello"
        var anotherString = "world"
        
        //swapTwoValues(&someString, &anotherString)
        
        // someString 现在 "world", and anotherString 现在 "hello”
        
        
        //“注意
        //上面定义的 swapTwoValues(_:_:) 函数是受 swap(_:_:) 函数启发而实现的。后者存在于 Swift 标准库，你可以在你的应用程序中使用它。如果你在代码中需要类似 swapTwoValues(_:_:) 函数的功能，你可以使用已存在的 swap(_:_:) 函数。”
        swap(&someString, &anotherString)
        print("someString is now \(someString), and anotherString is now \(anotherString)")

    }
    
    
    //“这个函数的泛型版本使用了占位类型名（在这里用字母 T 来表示）来代替实际类型名（例如 Int、String 或 Double）。占位类型名没有指明 T 必须是什么类型，但是它指明了 a 和 b 必须是同一类型 T，无论 T 代表什么类型。只有 swapTwoValues(_:_:) 函数在调用时，才能根据所传入的实际类型决定 T 所代表的类型。
    
    //另外一个不同之处在于这个泛型函数名（swapTwoValues(_:_:)）后面跟着占位类型名（T），并用尖括号括起来（<T>）。这个尖括号告诉 Swift 那个 T 是 swapTwoValues(_:_:) 函数定义内的一个占位类型名，因此 Swift 不会去查找名为 T 的实际类型”
    
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    //“类型参数指定并命名一个占位类型，并且紧随在函数名后面，使用一对尖括号括起来（例如 <T>）。”
    
    //“可提供多个类型参数，将它们都写在尖括号中，用逗号分开。”
    
    // <T, U, V>

}
