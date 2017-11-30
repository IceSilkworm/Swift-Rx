//
//  Protocol_07.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_07: NSObject {

    
    //MARK: -“通过扩展添加协议一致性”
    
    //“即便无法修改源代码，依然可以通过扩展令已有类型遵循并符合协议。扩展可以为已有类型添加属性、方法、下标以及构造器，因此可以符合协议中的相应要求。详情请在扩展章节中查看。
    
    //注意
    //通过扩展令已有类型遵循并符合协议时，该类型的所有实例也会随之获得协议中定义的各项功能。”
    
    func run() -> Void {
        
        //“现在所有 Dice 的实例都可以看做 TextRepresentable 类型：
        
        let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
        print(d12.textualDescription)
        // 打印 “A 12-sided dice”
        
        
        
        let tracker = DiceGameTracker()
        let game = SnakesAndLadders()
        game.delegate = tracker
        game.play()
        // Started a new game of Snakes and Ladders
        // The game is using a 6-sided dice
        // Rolled a 3
        // Rolled a 5
        // Rolled a 4
        // Rolled a 5
        // The game lasted for 4 turns
        
        print(game.textualDescription)
        // 打印 “A game of Snakes and Ladders with 25 squares”
        
        
        
        //“从现在起，Hamster 的实例可以作为 TextRepresentable 类型使用：
        
        let simonTheHamster = Hamster(name: "Simon")
        let somethingTextRepresentable: TextRepresentable = simonTheHamster
        print(somethingTextRepresentable.textualDescription)
        // 打印 “A hamster named Simon”
        //注意
        //即使满足了协议的所有要求，类型也不会自动遵循协议，必须显式地遵循协议。”
        
        
        
        
        
        //MARK: -“协议类型的集合”

        //“协议类型可以在数组或者字典这样的集合中使用，在协议类型提到了这样的用法。下面的例子创建了一个元素类型为 TextRepresentable 的数组：
        
        let things: [TextRepresentable] = [game, d12, simonTheHamster]
        //如下所示，可以遍历 things 数组，并打印每个元素的文本表示：
        
        for thing in things {
            print(thing.textualDescription)
        }
        // A game of Snakes and Ladders with 25 squares
        // A 12-sided dice
        // A hamster named Simon”
        
        
        //“thing 是 TextRepresentable 类型而不是 Dice，DiceGame，Hamster 等类型，即使实例在幕后确实是这些类型中的一种。由于 thing 是 TextRepresentable 类型，任何 TextRepresentable 的实例都有一个 textualDescription 属性，所以在每次循环中可以安全地访问 thing.textualDescription。”
        

    }
}


//“例如下面这个 TextRepresentable 协议，任何想要通过文本表示一些内容的类型都可以实现该协议。这些想要表示的内容可以是实例本身的描述，也可以是实例当前状态的文本描述：

protocol TextRepresentable {
    var textualDescription: String { get }
}
//可以通过扩展，令先前提到的 Dice 类遵循并符合 TextRepresentable 协议：

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}


//同样，SnakesAndLadders 类也可以通过扩展遵循并符合 TextRepresentable 协议：

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}


//MARK: - “通过扩展遵循协议”

//“当一个类型已经符合了某个协议中的所有要求，却还没有声明遵循该协议时，可以通过空扩展体的扩展来遵循该协议：”

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable {}

