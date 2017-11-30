//
//  Genericity.swift
//  练习
//
//  Created by hudun on 2017/8/14.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Genericity: NSObject {

    //在尖括号里写一个名字来创建一个泛型函数或者类型。
    func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
        var result = [Item]()
        for _ in 0..<numberOfTimes {
            result.append(item)
        }
        return result
    }
    
    // 重新实现 Swift 标准库中的可选类型 
    enum OptionalValue<Wrapped> {
    
        case None
        case Some(Wrapped)
    }
    
    
    //在类型名后面使用 where 来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者 限定某个类必须有一个特定的父类。
    func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
        where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
            for lhsItem in lhs {
                for rhsItem in rhs {
                    if lhsItem == rhsItem {
                        return true
                    } }
            }
            return false
    }

    //<T: Equatable> 和 <T> ... where T: Equatable>  是等价的。
    // 练习: 修改   函数来创建一个函数，返回一个数组，内容是两个序列的共有元素。
    
    func run() -> Void {
        let result = repeatItem(repeating: "knock", numberOfTimes:4)
        print(result)
        
        
        var possibleInteger: OptionalValue<Int> = .None
        possibleInteger = .Some(100)
        print(possibleInteger)
        
        
        
        let boo = anyCommonElements([1, 2, 3], [3])
        print(boo)
    }
}
