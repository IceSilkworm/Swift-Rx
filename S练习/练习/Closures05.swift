//
//  Closures05.swift
//  练习
//
//  Created by hudun on 2017/8/11.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Closures05: NSObject {

    // MARK: - 自动闭包
    
    /*
     “自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。
     
     我们经常会调用采用自动闭包的函数，但是很少去实现这样的函数。举个例子来说，assert(condition:message:file:line:) 函数接受自动闭包作为它的 condition 参数和 message 参数；它的 condition 参数仅会在 debug 模式下被求值，它的 message 参数仅当 condition 参数为 false 时被计算求值。
     
     自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执”
     
     “行。延迟求值对于那些有副作用（Side Effect）和高计算成本的代码来说是很有益处的，因为它使得你能控制代码的执行时机。下面的代码展示了闭包如何延时求值。”
     
     */
    
    func run() {
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // 打印出 "5”
        
        let customerProvider = { () -> String in
            
            customersInLine.remove(at: 0)
        }
        print(customersInLine.count)
        // 打印出 "5”
        
        
        //“如果这个闭包永远不被调用，那么在闭包里面的表达式将永远不会执行，那意味着列表中的元素永远不会被移除。请注意，customerProvider 的类型不是 String，而是 () -> String，一个没有参数且返回值为 String 的函数”
        
        print("Now serving \(customerProvider())!")
        // Prints "Now serving Chris!"
        print(customersInLine.count)
        // 打印出 "4”
        
        
        //“将闭包作为参数传递给函数时，你能获得同样的延时求值行为。”
        // customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
        func serve(customer customerProvider: () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serve(customer: { customersInLine.remove(at: 0) } )
        // 打印出 "Now serving Alex!”
        
        
        //“上面的 serve(customer:) 函数接受一个返回顾客名字的显式的闭包。下面这个版本的 serve(customer:) 完成了相同的操作，不过它并没有接受一个显式的闭包，而是通过将参数标记为 @autoclosure 来接收一个自动闭包。现在你可以将该函数当作接受 String 类型参数（而非闭包）的函数来调用。customerProvider 参数将自动转化为一个闭包，因为该参数被标记了 @autoclosure 特性。”
        
        // customersInLine is ["Ewa", "Barry", "Daniella"]
        func serveAutoclosure(customer customerProvider: @autoclosure () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serveAutoclosure(customer: customersInLine.remove(at: 0))
        // 打印 "Now serving Ewa!”
        
        //“注意 过度使用 autoclosures 会让你的代码变得难以理解。上下文和函数名应该能够清晰地表明求值是被延迟执行的。”
        
        
        
        
        
        //“如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性。”
        
        // customersInLine is ["Barry", "Daniella"]
        var customerProviders: [() -> String] = []
        func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
            customerProviders.append(customerProvider)
        }
        collectCustomerProviders(customersInLine.remove(at: 0))
        collectCustomerProviders(customersInLine.remove(at: 0))
        
        print("Collected \(customerProviders.count) closures.")
        // 打印 "Collected 2 closures.”
        
        for customerProvider in customerProviders {
            print("Now serving \(customerProvider())!")
        }
        // 打印 "Now serving Barry!"
        // 打印 "Now serving Daniella!”
        
        //“在上面的代码中，collectCustomerProviders(_:) 函数并没有调用传入的 customerProvider 闭包，而是将闭包追加到了 customerProviders 数组中。这个数组定义在函数作用域范围外，这意味着数组内的闭包能够在函数返回之后被调用。因此，customerProvider 参数必须允许“逃逸”出函数作用域。”
        
    }
}
