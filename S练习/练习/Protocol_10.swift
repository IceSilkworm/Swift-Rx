//
//  Protocol_10.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_10: NSObject {

    //MARK: -“可选的协议要求”
    
    //“协议可以定义可选要求，遵循协议的类型可以选择是否实现这些要求。在协议中使用 optional 关键字作为前缀来定义可选要求。可选要求用在你需要和 Objective-C 打交道的代码中。协议和可选要求都必须带上@objc属性。标记 @objc 特性的协议只能被继承自 Objective-C 类的类或者 @objc 类遵循，其他类以及结构体和枚举均不能遵循这种协议。”
    

    //“使用可选要求时（例如，可选的方法或者属性），它们的类型会自动变成可选的。比如，一个类型为 (Int) -> String 的方法会变成 ((Int) -> String)?。需要注意的是整个函数类型是可选的，而不是函数的返回值。
    
    //协议中的可选要求可通过可选链式调用来使用，因为遵循协议的类型可能没有实现这些可选要求。类似 someOptionalMethod?(someArgument) 这样，你可以在可选方法名称后加上 ? 来调用可选方法。详细内容可在可选链式调用章节中查看。”
    

    
    func run() -> Void {
        
        
        //“可以使用 ThreeSource 的实例作为 Counter 实例的数据源：
        
        let counter = Counter_er()
        counter.dataSource = ThreeSource()
        for _ in 1...4 {
            counter.increment()
            print(counter.count)
        }
        // 3
        // 6
        // 9
        // 12”
        
        
        
        
        //“你可以使用 TowardsZeroSource 实例将 Counter 实例来从 -4 增加到 0。一旦增加到 0，数值便不会再有变动：
        
        counter.count = -4
        counter.dataSource = TowardsZeroSource()
        for _ in 1...5 {
            counter.increment()
            print(counter.count)
        }
        // -3
        // -2
        // -1
        // 0
        // 0”
        
    }
}


//“下面的例子定义了一个名为 Counter 的用于整数计数的类，它使用外部的数据源来提供每次的增量。数据源由 CounterDataSource 协议定义，包含两个可选要求：

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
//CounterDataSource 协议定义了一个可选方法 increment(forCount:) 和一个可选属性 fiexdIncrement，它们使用了不同的方法来从数据源中获取适当的增量值。

//注意
//严格来讲，CounterDataSource 协议中的方法和属性都是可选的，因此遵循协议的类可以不实现这些要求，尽管技术上允许这样做，不过最好不要这样写。

//Counter 类含有 CounterDataSource? 类型的可选属性 dataSource，如下所示：”
class Counter_er {
    var count = 0
    
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

/*
 “在调用 increment(forCount:) 方法后，Int? 型的返回值通过可选绑定解包并赋值给常量 amount。如果可选值确实包含一个数值，也就是说，数据源和方法都存在，数据源方法返回了一个有效值。之后便将解包后的 amount 加到 count 上，增量操作完成。
 
 如果没有从 increment(forCount:) 方法获取到值，可能由于 dataSource 为 nil，或者它并没有实现 increment(forCount:) 方法，那么 increment() 方法将试图从数据源的 fixedIncrement 属性中获取增量。fixedIncrement 是一个可选属性，因此属性值是一个 Int? 值，即使该属性在 CounterDataSource 协议中的类型是非可选的 Int。”
 
 */

//“下面的例子展示了 CounterDataSource 的简单实现。ThreeSource 类遵循了 CounterDataSource 协议，它实现了可选属性 fixedIncrement，每次会返回 3：

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}




//“下面是一个更为复杂的数据源 TowardsZeroSource，它将使得最后的值变为 0：

@objc class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}



//“TowardsZeroSource 实现了 CounterDataSource 协议中的 increment(forCount:) 方法，以 count 参数为依据，计算出每次的增量。如果 count 已经为 0，此方法返回 0，以此表明之后不应再有增量操作发生。”



