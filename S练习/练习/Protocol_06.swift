//
//  Protocol_06.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Protocol_06: NSObject {

    //委托代理
    
    
    func run() -> Void {
        
        //“DiceGameTracker 实现了 DiceGameDelegate 协议要求的三个方法，用来记录游戏已经进行的轮数。当游戏开始时，numberOfTurns 属性被赋值为 0，然后在每新一轮中递增，游戏结束后，打印游戏的总轮数。
        
        //gameDidStart(_:) 方法从 game 参数获取游戏信息并打印。game 参数是 DiceGame 类型而不是 SnakeAndLadders 类型，所以在gameDidStart(_:) 方法中只能访问 DiceGame 协议中的内容。当然了，SnakeAndLadders 的方法也可以在类型转换之后调用。在上例代码中，通过 is 操作符检查 game 是否为 SnakesAndLadders 类型的实例，如果是，则打印出相应的消息。
        
        //“无论当前进行的是何种游戏，由于 game 符合 DiceGame 协议，可以确保 game 含有 dice 属性。因此在 gameDidStart(_:) 方法中可以通过传入的 game 参数来访问 dice 属性，进而打印出 dice 的 sides 属性的值。
        
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
        
        
    }
}

//“下面的例子定义了两个基于骰子游戏的协议：

protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}
//DiceGame 协议可以被任意涉及骰子的游戏遵循。DiceGameDelegate 协议可以被任意类型遵循，用来追踪 DiceGame 的游戏过程。

//如下所示，SnakesAndLadders 是 控制流 章节引入的蛇梯棋游戏的新版本。新版本使用 Dice 实例作为骰子，并且实现了 DiceGame 和 DiceGameDelegate 协议，后者用来记录游戏的过程：”

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](repeatElement(0, count: finalSquare + 1))//[Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}


/*
 “关于这个蛇梯棋游戏的详细描述请参阅 控制流 章节中的 Break 部分。
 
 这个版本的游戏封装到了 SnakesAndLadders 类中，该类遵循了 DiceGame 协议，并且提供了相应的可读的 dice 属性和 play() 方法。（ dice 属性在构造之后就不再改变，且协议只要求 dice 为可读的，因此将 dice 声明为常量属性。）
 
 游戏使用 SnakesAndLadders 类的 init() 构造器来初始化游戏。所有的游”
 
 “戏逻辑被转移到了协议中的 play() 方法，play() 方法使用协议要求的 dice 属性提供骰子摇出的值。
 
 注意，delegate 并不是游戏的必备条件，因此 delegate 被定义为 DiceGameDelegate 类型的可选属性。因为 delegate 是可选值，因此会被自动赋予初始值 nil。随后，可以在游戏中为 delegate 设置适当的值。
 
 DicegameDelegate 协议提供了三个方法用来追踪游戏过程。这三个方法被放置于游戏的逻辑中，即 play() 方法内。分别在游戏开始时，新一轮开始时，以及游戏结束时被调用。
 
 “因为 delegate 是一个 DiceGameDelegate 类型的可选属性，因此在 play() 方法中通过可选链式调用来调用它的方法。若 delegate 属性为 nil，则调用方法会优雅地失败，并不会产生错误。若 delegate 不为 nil，则方法能够被调用，并传递 SnakesAndLadders 实例作为参数。
 
 如下示例定义了 DiceGameTracker 类，它遵循了 DiceGameDelegate 协议：”
 
 */

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }

    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
    
    deinit {
        print("dealloc")
    }
}

