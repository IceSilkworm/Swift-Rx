//
//  Protocol_11.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_11: NSObject {

    
    
    
    
    func run() -> Void {
        
        
        //“通过协议扩展，所有遵循协议的类型，都能自动获得这个扩展所增加的方法实现，无需任何额外修改：
        
        let generator = LinearCongruentialGenerator()
        print("Here's a random number: \(generator.random())")
        // 打印 “Here's a random number: 0.37464991998171”
        print("And here's a random Boolean: \(generator.randomBool())")
        // 打印 “And here's a random Boolean: true”
        
        
        
        
        
        
        
        //“现在我们来看看先前的 Hamster 结构体，它符合 TextRepresentable 协议，同时这里还有个装有 Hamster 的实例的数组：
        
        let murrayTheHamster = Hamster(name: "Murray")
        let morganTheHamster = Hamster(name: "Morgan")
        let mauriceTheHamster = Hamster(name: "Maurice")
        let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
        
        
        
        //“因为 Array 符合 CollectionType 协议，而数组中的元素又符合 TextRepresentable 协议，所以数组可以使用 textualDescription 属性得到数组内容的文本表示：
        
        print(hamsters.textualDescription)
        // 打印 “[A hamster named Murray, A hamster named Morgan, A hamster named Maurice]”
        
        //“注意
        //如果多个协议扩展都为同一个协议要求提供了默认实现，而遵循协议的类型又同时满足这些协议扩展的限制条件，那么将会使用限制条件最多的那个协议扩展提供的默认实现。
        
        //”
        

    }
}


//MARK: -协议扩展

//“协议可以通过扩展来为遵循协议的类型提供属性、方法以及下标的实现。通过这种方式，你可以基于协议本身来实现这些功能，而无需在每个遵循协议的类型中都重复同样的实现，也无需使用全局函数”

//“例如，可以扩展 RandomNumberGenerator 协议来提供 randomBool() 方法。该方法使用协议中定义的 random() 方法来返回一个随机的 Bool 值：

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}



//“提供默认实现
/*
可以通过协议扩展来为协议要求的属性、方法以及下标提供默认的实现。如果遵循协议的类型为这些要求提供了自己的实现，那么这些自定义实现将会替代扩展中的默认实现被使用。

注意
通过协议扩展为协议要求提供的默认实现和可选的协议要求不同。虽然在这两种情况下，遵循协议的类型都无需自己实现这些要求，但是通过扩展提供的默认实现可以直接调用，而无需使用可选链式调用。

例如，PrettyTextRepresentable 协议继承自 TextRepresentable 协议，可以为其提供一个默认的 prettyTextualDescription 属性，只是简单地返回 textualDescription 属性的值：”

*/


extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

//“为协议扩展添加限制条件”

//“在扩展协议的时候，可以指定一些限制条件，只有遵循协议的类型满足这些限制条件时，才能获得协议扩展提供的默认实现。这些限制条件写在协议名之后，使用 where 子句来描述，正如Where子句中所描述的。

//例如，你可以扩展 CollectionType（Collection） 协议，但是只适用于集合中的元素遵循了 TextRepresentable 协议的情况：”
extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

//“textualDescription 属性返回整个集合的文本描述，它将集合中的每个元素的文本描述以逗号分隔的方式连接起来，包在一对方括号中。”









