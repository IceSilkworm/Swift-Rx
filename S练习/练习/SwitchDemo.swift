//
//  SwitchDemo.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class SwitchDemo: NSObject {

    func demo() -> Void {
        //可作 区间匹配， 元组匹配 , 值绑定 ， Where， 复合匹配 , 控制转移语句
        //“控制转移语句改变你代码的执行顺序，通过它可以实现代码的跳转。Swift 有五种控制转移语句”
        //5种
        //continue,break, fallthrough, return, throw
        
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            print("(0, 0) is at the origin")
        case (_, 0):
            print("(\(somePoint.0), 0) is on the x-axis")
        case (0, _):
            print("(0, \(somePoint.1)) is on the y-axis")
        case (-2...2, -2...2):
            print("(\(somePoint.0), \(somePoint.1)) is inside the box")
        default:
            print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
        }
        
        // MARK: - 元组匹配
        // 输出 "(1, 1) is inside the box”
        let anotherPoint = (2, 0)
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        // 输出 "on the x-axis with an x value of 2”
        
        // MARK: - 值绑定
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        // 输出 "(1, -1) is on the line x == -y”
        
        let someCharacter: Character = "e"
        switch someCharacter {
        case "a", "e", "i", "o", "u":
            print("\(someCharacter) is a vowel")
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            print("\(someCharacter) is a consonant")
        default:
            print("\(someCharacter) is not a vowel or a consonant")
        }
        // 输出 "e is a vowel”
        
        // MARK: - 控制转移语句
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        for character in puzzleInput.characters {
            switch character {
            case "a", "e", "i", "o", "u", " ":
                continue
            default:
                puzzleOutput.append(character)
            }
        }
        print(puzzleOutput)
        // 输出 "grtmndsthnklk”
        
        //贯穿
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        print(description)
        // 输出 "The number 5 is a prime number, and also an integer.”
        
        
        
        // MARK: - 带标签的语句
        /*
         “这个例子定义了一个String类型的变量description并且给它设置了一个初始值。函数使用switch逻辑来判断integerToDescribe变量的值。当integerToDescribe的值属于列表中的质数之一时，该函数在description后添加一段文字，来表明这个数字是一个质数。然后它使用fallthrough关键字来“贯穿”到default分支中。default分支在description的最后添加一段额外的文字，至此switch代码块执行完了。”
         
         */
        
        /*
         “带标签的语句
         
         在 Swift 中，你可以在循环体和条件语句中嵌套循环体和条件语句来创造复杂的控制流结构。并且，循环体和条件语句都可以使用break语句来提前结束整个代码块。因此，显式地指明break语句想要终止的是哪个循环体或者条件语句，会很有用。类似地，如果你有许多嵌套的循环体，显式指明continue语句想要影响哪一个循环体也会非常有用。
         
         为了实现这个目的，你可以使用标签（statement label）来标记一个循环体或者条件语句，对于一个条件语句，你可以使用break加标签的方式，来结束这个被标记的语句。对于一个循环语句，你可以使用break或者continue加标签，来结束或者继续这条被标记语句的执行。
         
         “声明一个带标签的语句是通过在该语句的关键词的同一行前面放置一个标签，作为这个语句的前导关键字(introducor keyword)，并且该标签后面跟随一个冒号。下面是一个针对while循环体的标签语法，同样的规则适用于所有的循环体和条件语句。
         
         label name: while condition {  statements }
         
         下面的例子是前面章节中蛇和梯子的适配版本，在此版本中，我们将使用一个带有标签的while循环体中调用break和continue语句。这次，游戏增加了一条额外的规则：
         
         为了获胜，你必须刚好落在第 25 个方块中。
         如果某次掷骰子使你的移动超出第 25 个方块，你必须重新掷骰子，直到你掷出的骰子数刚好使你能落在第 25 个方块中。”
         
         */
        
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        
        /*“这个版本的游戏使用while循环和switch语句来实现游戏的逻辑。while循环有一个标签名gameLoop，来表明它是游戏的主循环。
         
         该while循环体的条件判断语句是while square != finalSquare，这表明你必须刚好落在方格25中。”
         
          */
        
        gameLoop: while square != finalSquare {
            diceRoll += 1
            if diceRoll == 7 { diceRoll = 1 }
            switch square + diceRoll {
            case finalSquare:
                // 骰子数刚好使玩家移动到最终的方格里，游戏结束。
                break gameLoop
                //值绑定
            case let newSquare where newSquare > finalSquare:
                // 骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
                continue gameLoop
            default:
                // 合法移动，做正常的处理
                square += diceRoll
                square += board[square]
            }
        }
        print("Game over!")
        
        /*“每次循环迭代开始时掷骰子。与之前玩家掷完骰子就立即移动不同，这里使用了switch语句来考虑每次移动可能产生的结果，从而决定玩家本次是否能够移动。
         
         如果骰子数刚好使玩家移动到最终的方格里，游戏结束。break gameLoop语句跳转控制去执行while循环体后的第一行代码，意味着游戏结束。
         如果骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子。continue gameLoop语句结束本次while循环，开始下一次循环。
         在剩余的所有情况中，骰子数产生的都是合法的移动。玩家向前移动 diceRoll 个方格，然后游戏逻辑再处理玩家当前是否处于蛇头或者梯子的底部。接着本次循环结束，控制跳转到while循环体的 条件判断语句处，再决定是否需要继续执行下次循环。”
         
          */
    }
}
