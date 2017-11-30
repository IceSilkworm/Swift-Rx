//
//  Closures03.swift
//  练习
//
//  Created by hudun on 2017/8/11.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Closures03: NSObject {
    
    // MARK: - 举个例子
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
        
        //“incrementer() 函数并没有任何参数，但是在函数体内访问了”“runningTotal 和 amount 变量。这是因为它从外围函数捕获了 runningTotal 和 amount 变量的引用。捕获引用保证了 runningTotal 和 amount 变量在调用完 makeIncrementer 后不会消失，并且保证了在下一次执行 incrementer 函数时，runningTotal 依旧存在。”
        
        //“注意 为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift 可能会改为捕获并保存一份对值的拷贝。 Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。”
        
    }

    // MARK: - 值捕获
    func run() -> () {
        
        //“闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。”
        
        //“Swift 中，可以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。”
        
        let incrementByTen = makeIncrementer(forIncrement: 10)
        //“该例子定义了一个叫做 incrementByTen 的常量，该常量指向一个每次调用会将其 runningTotal 变量增加 10 的 incrementor 函数。调用这个函数多次可以得到以下结果：”
        let _ = incrementByTen()
        // 返回的值为10
        let _ = incrementByTen()
        // 返回的值为20
        let _ = incrementByTen()
        // 返回的值为30
        
        //“如果你创建了另一个 incrementor，它会有属于自己的引用，指向一个全新、独立的 runningTotal 变量”
        let incrementBySeven = makeIncrementer(forIncrement: 7)
        //
        let _ = incrementBySeven()
        //返回值为7
        
        let _ = incrementByTen()
        // 返回的值为40”
        
        //“注意：
        //如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，你将在闭包和该实例间创建一个循环强引用。Swift 使用捕获列表来打破这种循环强引用。”
        
        
        // MARK: - “闭包是引用类型”
        
        //“上面的例子中，incrementBySeven 和 incrementByTen 都是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量的值。这是因为函数和闭包都是引用类型。”
        //“无论你将函数或闭包赋值给一个常量还是变量，你实际上都是将常量或变量的值设置为对应函数或闭包的引用。上面的例子中，指向闭包的引用 incrementByTen 是一个常量，而并非闭包内容本身。
        
        //这也意味着如果你将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包：
        
        let alsoIncrementByTen = incrementByTen
        let _ = alsoIncrementByTen()
        // 返回的值为50”
        
    }
}
