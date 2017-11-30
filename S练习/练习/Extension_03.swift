//
//  Extension_03.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Extension_03: NSObject {

    //方法
    
    
    func run() -> Void {
        
        3.repetitions(task: {
            
        })
        
        //尾随闭包
        3.repetitions {
            print("we\n")
        }
        
        
        var someInt = 3  //此处使用var， 而不是let
        someInt.square()
        print(someInt)
        // someInt 的值现在是 9”
        
        
        
        _ = 746381295[0]
        // 返回 5
        _ = 746381295[1]
        // 返回 9
        _ = 746381295[2]
        // 返回 2
        _ = 746381295[8]
        // 返回 7
        //如果该 Int 值没有足够的位数，即下标越界，那么上述下标实现会返回 0，犹如在数字左边自动补 0：
        
        _ = 746381295[9]
        // 返回 0，即等同于：
        _ = 0746381295[9]
        
    }
}

//“扩展可以为已有类型添加新的实例方法和类型方法。下面的例子为 Int 类型添加了一个名为 repetitions 的实例方法：”
extension Int {
    //“这个 repetitions(task:) 方法接受一个 () -> Void 类型的单参数，表示没有参数且没有返回值的函数。”
    
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    
    //可变实例方法
    
    //“通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改 self 或其属性的方法必须将该实例方法标注为 mutating，正如来自原始实现的可变方法一样。
    
    //下面的例子为 Swift 的 Int 类型添加了一个名为 square 的可变方法，用于计算原始值的平方值：”
    
    mutating func square() {
        self = self * self
    }
}


//下标

//“扩展可以为已有类型添加新下标。这个例子为 Swift 内建类型 Int 添加了一个整型下标。该下标 [n] 返回十进制数字从右向左数的第 n 个数字：

//123456789[0] 返回 9
//123456789[1] 返回 8”

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

