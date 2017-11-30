//
//  Protocol_08.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_08: NSObject {

    //MARK: -协议的继承
    
    
    
    func run() -> Void {
        
        // 任意 SankesAndLadders 的实例都可以使用 prettyTextualDescription 属性来打印一个漂亮的文本描述：”

        let tracker = DiceGameTracker()
        let game = SnakesAndLadders()
        game.delegate = tracker
//        game.play()

        print(game.prettyTextualDescription)
        // A game of Snakes and Ladders with 25 squares:
        // ○ ○ ▲ ○ ○ ▲ ○ ○ ▲ ▲ ○ ○ ○ ▼ ○ ○ ○ ○ ▼ ○ ○ ▼ ○ ▼ ○”
        
        
    }
}

//“协议能够继承一个或多个其他协议，可以在继承的协议的基础上增加新的要求。协议的继承语法与类的继承相似，多个被继承的协议间用逗号分隔：

protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // 这里是协议的定义部分
}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}
//例子中定义了一个新的协议 PrettyTextRepresentable，它继承自 TextRepresentable 协议。任何遵循 PrettyTextRepresentable 协议的类型在满足该协议的要求时，也必须满足 TextRepresentable 协议的要求。在这个例子中，PrettyTextRepresentable 协议额外要求遵循协议的类型提供一个返回值为 String 类型的 prettyTextualDescription 属性。”


//“如下所示，扩展 SnakesAndLadders，使其遵循并符合 PrettyTextRepresentable 协议：”

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}


/*
 “上述扩展令 SnakesAndLadders 遵循了 PrettyTextRepresentable 协议，并提供了协议要求的 prettyTextualDescription 属性。每个 PrettyTextRepresentable 类型同时也是 TextRepresentable 类型，所以在 prettyTextualDescription 的实现中，可以访问 textualDescription 属性。然后，拼接上了冒号和换行符。接着，遍历数组中的元素，拼接一个几何图形来表示每个棋盘方格的内容：
 
 当从数组中取出的元素的值大于 0 时，用 ▲ 表示。
 当从数组中取出的元素的值小于 0 时，用 ▼ 表示。
 当从数组中取出的元素的值等于 0 时，用 ○ 表示。
 
 */



protocol SomeInheritedProtocol {
    
}




//MARK: -“类类型专属协议”

//“你可以在协议的继承列表中，通过添加 class 关键字来限制协议只能被类类型遵循，而结构体或枚举不能遵循该协议。class 关键字必须第一个出现在协议的继承列表中，在其他继承的协议之前：

protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
    // 这里是类类型专属协议的定义部分
}
//在以上例子中，协议 SomeClassOnlyProtocol 只能被类类型遵循。如果尝试让结构体或枚举类型遵循该协议，则会导致编译错误。

//注意
//当协议定义的要求需要遵循协议的类型必须是引用语义而非值语义时，应该采用类类型专属协议。关于引用语义和值语义的更多内容，请查看结构体和枚举是值类型和类是引用类型。”

