//
//  Generics_02.swift
//  练习
//
//  Created by hudun on 2017/9/30.
//  Copyright © 2017年 hudun. All rights reserved.
//

import Foundation

class Generics_02: NSObject {
    
    //MARK: - 泛型类型
    
    //“除了泛型函数，Swift 还允许你定义泛型类型。这些自定义类、结构体和枚举可以适用于任何类型，类似于 Array 和 Dictionary。
    
    //这部分内容将向你展示如何编写一个名为 Stack （栈）的泛型集合类型。栈是一系列值的有序集合，和 Array 类似，但它相比 Swift 的 Array 类型有更多的操作限制。数组允许在数组的任意位置插入新元素或是删除其中任意位置的元素。而栈只允许在集合的末端添加新的元素（称之为入栈）。类似的，栈也只能从末端移除元素（称之为出栈）。”
    

    //“注意
    //栈的概念已被 UINavigationController 类用来构造视图控制器的导航结构。你通过调用 UINavigationController 的 pushViewController(_:animated:) 方法来添加新的视图控制器到导航栈，通过 popViewControllerAnimated(_:) 方法来从导航栈中移除视图控制器。每当你需要一个严格的“后进先出”方式来管理集合，栈都是最实用的模型。”
    
    
    func run() -> Void {
        
        
        //“要创建一个 String 类型的栈，可以写成 Stack<String>()：
        
        var stackOfStrings = Stack<String>()
        stackOfStrings.push(item: "uno")
        stackOfStrings.push(item: "dos")
        stackOfStrings.push(item: "tres")
        stackOfStrings.push(item: "cuatro")
        // 栈中现在有 4 个字符串”
        
        
        //“计算型属性 topItem 现在可以用来访问任意 Stack 实例的顶端元素且不移除它：
        
        if let topItem = stackOfStrings.topItem {
            print("The top item on the stack is \(topItem).")
        }
        // 打印 “The top item on the stack is tres.”
        

        
        
        
        //类型约束
        
        let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
        if let foundIndex = findIndex(ofString: "llama", in: strings) {
            print("The index of llama is \(foundIndex)")
        }
        // 打印 “The index of llama is 2”
        

        let doubleIndex = findIndex(array: [3.14159, 0.1, 0.25], 9.3)//findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
        // doubleIndex 类型为 Int?，其值为 nil，因为 9.3 不在数组中
        let stringIndex = findIndex(array: ["Mike", "Malcolm", "Andrea"], "Andrea")
        // stringIndex 类型为 Int?，其值为 2”
        
        print(doubleIndex)
        print(stringIndex)
    }
}

//“下面展示了如何编写一个非泛型版本的栈，以 Int 型的栈为例：”

struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}


struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    //“Element 在如下三个地方被用作占位符：”
    
    //创建 items 属性，使用 Element 类型的空数组对其进行初始化。
    //指定 push(_:) 方法的唯一参数 item 的类型必须是 Element 类型。
    //指定 pop() 方法的返回值类型必须是 Element 类型。


}


//MARK: - “扩展一个泛型类型”

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}



//MARK: - 类型约束

//“当你创建自定义泛型类型时，你可以定义你自己的类型约束，这些约束将提供更为强大的泛型编程能力。抽象概念，例如可哈希的，描述的是类型在概念上的特征，而不是它们的显式类型。


//类型约束语法

//你可以在一个类型参数名后面放置一个类名或者协议名，并用冒号进行分隔，来定义类型约束，它们将成为类型参数列表的一部分。对泛型函数添加类型约束的基本语法如下所示（作用于泛型类型时的语法与之相同）：

func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // 这里是泛型函数的函数体部分
}

//“上面这个函数有两个类型参数。第一个类型参数 T，有一个要求 T 必须是 SomeClass 子类的类型约束；第二个类型参数 U，有一个要求 U 必须符合 SomeProtocol 协议的类型约束。”








//MARK:  - 类型约束实践

//“这里有个名为 findIndex(ofString:in:) 的非泛型函数，该函数的功能是在一个 String 数组中查找给定 String 值的索引。若查找到匹配的字符串，findIndex(ofString:in:) 函数返回该字符串在数组中的索引值，否则返回nil”

func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


//“请注意这个函数返回值的类型仍然是 Int?，这是因为函数返回的是一个可选的索引数，而不是从数组中得到的一个可选值。”
/*
func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            
            return index
        }
    }
    return nil
}

 */


/*
 
 “上面所写的函数无法通过编译。问题出在相等性检查上，即 "if value == valueToFind"。不是所有的 Swift 类型都可以用等式符（==）进行比较。比如说，如果你创建一个自定义的类或结构体来表示一个复杂的数据模型，那么 Swift 无法猜到对于这个类或结构体而言“相等”意味着什么。正因如此，这部分代码无法保证适用于每个可能的类型 T，当你试图编译这部分代码时会出现相应的错误。
 
 “不过，所有的这些并不会让我们无从下手。Swift 标准库中定义了一个 Equatable 协议，该协议要求任何遵循该协议的类型必须实现等式符（==）及不等符(!=)，从而能对该类型的任意两个值进行比较。所有的 Swift 标准类型自动支持 Equatable 协议。”
 
 “任何 Equatable 类型都可以安全地使用在 findIndex(of:in:) 函数中，因为其保证支持等式操作符。为了说明这个事实，当你定义一个函数时，你可以定义一个 Equatable 类型约束作为类型参数定义的一部分：”
 
 */

func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

//“findIndex(of:in:) 唯一的类型参数写做 T: Equatable，也就意味着“任何符合 Equatable 协议的类型 T ”。


