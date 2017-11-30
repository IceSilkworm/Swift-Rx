//
//  ArrayDemo.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class ArrayDemo: NSObject {

    func demo() -> Void {
        
        var someInts = [Int]()
        print("someInts is of type [Int] with \(someInts.count) items.")
        // 打印 "someInts is of type [Int] with 0 items.”
        someInts.append(3)
        someInts = []
        // someInts 现在是空数组，但是仍然是 [Int] 类型的。”
        
        let threeDoubles = Array(repeating: 0.0, count: 3)
        // threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]”
        let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
        // anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]”
        let sixDoubles = threeDoubles + anotherThreeDoubles
        // sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]”
        
        print(sixDoubles)
        
        //“用数组字面量构造数组”
        let shoppingList: [String] = ["Eggs", "Milk"]
        // shoppingList 已经被构造并且拥有两个初始项。”
        //“由于 Swift 的类型推断机制，当我们用字面量构造只拥有相同类型值数组的时候，我们不必把数组的类型定义清楚。 shoppingList的构造也可以这样写：”
        
        var shoppingList1 = ["Eggs", "Milk"]
        shoppingList1.append("Milk")
        print(shoppingList.count)
        
        if shoppingList1.isEmpty {
            
        }else{
            
        }
        
        shoppingList1.append("Flour")
        
        shoppingList1 += ["Baking Poeder"]
        shoppingList1 += ["Chocolate Spread", "Cheese", "Butter"]
        
        //有8项
        let firstItem = shoppingList[0]
        // 第一项是 "Eggs”
        print(firstItem)
        shoppingList1[0] = "Six eggs"
        // 其中的第一项现在是 "Six eggs" 而不是 "Eggs”
        
        /*
         “还可以利用下标来一次改变一系列数据值，即使新数据和原有数据的数量是不一样的。下面的例子把"Chocolate Spread"，"Cheese"，和"Butter"替换为"Bananas"和 "Apples"：”
         */
        
        shoppingList1[5...7] = ["Bananas","Apples"]
        //有7项
        
        shoppingList1.insert("Maple Syrup", at: 0)
        let mapleSyrup = shoppingList1.remove(at: 0)
        //打印 Maple Syrup
        print(mapleSyrup)
        
        
        let apples = shoppingList1.removeLast()
        // 数组的最后一项被移除了
        // shoppingList 现在只有5项，不包括 Apples
        // apples 常量的值现在等于 "Apples" 字符串”
        print(apples)
        
        for item in shoppingList1 {
            print(item)
        }
        
        /*
         “如果我们同时需要每个数据项的值和索引值，可以使用enumerated()方法来进行数组遍历。enumerated()返回一个由每一个数据项索引值和数据值组成的元组。我们可以把这个元组分解成临时常量或者变量来进行遍历：”
         
         */
        
        for (index, value) in shoppingList1.enumerated() {
            print("Item \(String(index + 1)): \(value)")
        }
        
        shoppingList1.removeAll()
        
        
        //
        let inputsArray = ["1","2","3"]
        _ = inputsArray.contains { //(element) -> Bool in
            
            if $0 == "1" {
                return true
            }else {
                return false
            }
        }
    }
}
