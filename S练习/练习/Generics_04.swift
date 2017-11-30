//
//  Generics_04.swift
//  练习
//
//  Created by apple on 2017/10/25.
//  Copyright © 2017年 hudun. All rights reserved.
//

import Foundation

class Generics_04 {
    
    
    //MARK: “泛型 Where 语句”
    
    /*
     “类型约束让你能够为泛型函数或泛型类型的类型参数定义一些强制要求。
     
     为关联类型定义约束也是非常有用的。你可以在参数列表中通过 where 子句为关联类型定义约束。你能通过 where 子句要求一个关联类型遵从某个特定的协议，以及某个特定的类型参数和关联类型必须类型相同。你可以通过将 where 关键字紧跟在类型参数列表后面来定义 where 子句，where 子句后跟一个或者多个针对关联类型的约束，以及一个或多个类型参数和关联类型间的相等关系。你可以在函数体或者类型的大括号之前添加 where 子句。”
     
     */
    func run() -> Void {
        
        var stackOfStrings = Stack<String>()
        stackOfStrings.push(item: "uno")
        stackOfStrings.push(item: "dos")
        stackOfStrings.push(item: "tres")
        
        let arrayOfStrings = ["uno", "dos", "tres"]
        
        if allItemsMatch(stackOfStrings, arrayOfStrings) {
            print("All items match.")
        } else {
            print("Not all items match.")
        }
        // 打印 “All items match.”
        
    }
    
    
    //“下面的例子定义了一个名为 allItemsMatch 的泛型函数，用来检查两个 Container 实例是否包含相同顺序的相同元素。如果所有的元素能够匹配，那么返回 true，否则返回 false。
    
    //被检查的两个 Container 可以不是相同类型的容器（虽然它们可以相同），但它们必须拥有相同类型的元素。这个要求通过一个类型约束以及一个 where 子句来表示：”
    
    func allItemsMatch<C1: Container, C2: Container>
        (_ someContainer: C1, _ anotherContainer: C2) -> Bool
        where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
            
            // 检查两个容器含有相同数量的元素
            if someContainer.count != anotherContainer.count {
                return false
            }
        
            // 检查每一对元素是否相等
            for i in 0..<someContainer.count {
                if someContainer[i] != anotherContainer[i] {
                    return false
                }
            }
            
            // 所有元素都匹配，返回 true
            return true
    }
    
}

extension Stack: Container {
 
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item: item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }

}

