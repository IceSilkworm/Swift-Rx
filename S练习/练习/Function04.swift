//
//  Function04.swift
//  练习
//
//  Created by hudun on 2017/8/14.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Function04: NSObject {
    
    //函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
    //函数也可以当做参数传入另一个函数。
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            } }
        return false
    }
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    
    //函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包所建作用域中能得到的变 量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数例子中所看到。你可以使用 {} 来创建 一个匿名闭包。使用 in 将参数和返回值类型声明与闭包函数体进行分离。
    
    
    
    func run() -> () {
        let numbers = [20, 19, 7, 12]
        let _ = hasAnyMatches(list: numbers, condition: lessThanTen)
        
        
        let _ = numbers.map({
            (number: Int) -> Int in
            let result = 3 * number
            return result
        })
        
        
        //有很多种创建更简洁的闭包的方法。如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型
        //和返回值。单个语句闭包会把它语句的值当做结果返回。
        let mappedNumbers = numbers.map({ number in 3 * number })
        print(mappedNumbers)
        
        //你可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。当一个闭包作为最后
        //一个参数传给一个函数的时候，它可以直接跟在括号后面。当一个闭包是传给函数的唯一参数，你可以完全忽略括号。
        
        let sortedNumbers = numbers.sorted { $0 > $1 }
        print(sortedNumbers)
    }
}
