//
//  Game.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import Foundation

class Game: NSObject {
    /*
     “下面的例子来玩一个叫做蛇和梯子（也叫做滑道和梯子）的小游戏”
     
    “游戏的规则如下：
    
    游戏盘面包括 25 个方格，游戏目标是达到或者超过第 25 个方格；
    每一轮，你通过掷一个六面体骰子来确定你移动方块的步数，移动的路线由上图中横向的虚线所示；
    如果在某轮结束，你移动到了梯子的底部，可以顺着梯子爬上去；
    如果在某轮结束，你移动到了蛇的头部，你会顺着蛇的身体滑下去。
    游戏盘面可以使用一个Int数组来表达。数组的长度由一个finalSquare常量储存，用来初始化数组和检测最终胜利条件。游戏盘面由 26 个 Int 0 值初始化，而不是 25 个（由0到25，一共 26 个）：”
    
*/
    //while
    func demo() -> Void {
        let finalSquare = 25
        var board = [Int](repeating:0, count: finalSquare + 1)
        /*
         “一些方格被设置成特定的值来表示有蛇或者梯子。梯子底部的方格是一个正值，使你可以向上移动，蛇头处的方格是一个负值，会让你向下移动：”
         */
        board[03] = +08
        board[06] = +11
        board[09] = +09
        board[10] = +02
        board[14] = -10
        board[19] = -11
        board[22] = -02
        board[24] = -08
        /*
         “3 号方格是梯子的底部，会让你向上移动到 11 号方格，我们使用board[03]等于+08（来表示11和3之间的差值）。使用一元正运算符（+i）是为了和一元负运算符（-i）对称，为了让盘面代码整齐，小于 10 的数字都使用 0 补齐（这些风格上的调整都不是必须的，只是为了让代码看起来更加整洁）。
         
         玩家由左下角空白处编号为 0 的方格开始游戏。玩家第一次掷骰子后才会进入游戏盘面：”
         */
        
        var square = 0
        var diceRoll = 0
        while square < finalSquare {
            //掷骰子
            diceRoll += 1
            if diceRoll == 7 {
                diceRoll = 1
            }
            //根据点数移动
            square += diceRoll
            if square < board.count {
                //“ // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去”
                square += board[square]
            }
        }
        
        print("game over!")
        
        /*“本例中使用了最简单的方法来模拟掷骰子。 diceRoll的值并不是一个随机数，而是以0为初始值，之后每一次while循环，diceRoll的值增加 1 ，然后检测是否超出了最大值。当diceRoll的值等于 7 时，就超过了骰子的最大值，会被重置为1。所以diceRoll的取值顺序会一直是 1 ，2，3，4，5，6，1，2 等。
         
         掷完骰子后，玩家向前移动diceRoll个方格，如果玩家移动超过了第 25 个方格，这个时候游戏将会结束，为了应对这种情况，代码会首先判断square的值是否小于board的count属性，只有小于才会在board[square]上增加square，来向前或向后移动（遇到了梯子或者蛇）。
         
         ”
         
         “注意：
         如果没有这个检测（square < board.count），board[square]可能会越界访问board数组，导致错误。如果square等于26， 代码会去尝试访问board[26]，超过数组的长度。
         
         当本轮while循环运行完毕，会再检测循环条件是否需要再运行一次循环。如果玩家移动到或者超过第 25 个方格，循环条件结果为false，此时游戏结束。
         
         while 循环比较适合本例中的这种情况，因为在 while 循环开始时，我们并不知道游戏要跑多久，只有在达成指定条件时循环才会结束。”
         
        */
    }
    
    //蛇和梯子的 游戏 repeat
    func game() -> Void {
        let finalSquare = 25
        var board = [Int](repeating:0, count: finalSquare + 1)
        /*
         “一些方格被设置成特定的值来表示有蛇或者梯子。梯子底部的方格是一个正值，使你可以向上移动，蛇头处的方格是一个负值，会让你向下移动：”
         */
        board[03] = +08
        board[06] = +11
        board[09] = +09
        board[10] = +02
        board[14] = -10
        board[19] = -11
        board[22] = -02
        board[24] = -08
        /*
         “3 号方格是梯子的底部，会让你向上移动到 11 号方格，我们使用board[03]等于+08（来表示11和3之间的差值）。使用一元正运算符（+i）是为了和一元负运算符（-i）对称，为了让盘面代码整齐，小于 10 的数字都使用 0 补齐（这些风格上的调整都不是必须的，只是为了让代码看起来更加整洁）。
         
         玩家由左下角空白处编号为 0 的方格开始游戏。玩家第一次掷骰子后才会进入游戏盘面：”
         */
        
        var square = 0
        var diceRoll = 0
        
        /*“repeat-while的循环版本，循环中第一步就需要去检测是否在梯子或者蛇的方块上。没有梯子会让玩家直接上到第 25 个方格，所以玩家不会通过梯子直接赢得游戏。这样在循环开始时先检测是否踩在梯子或者蛇上是安全的。
         
         游戏开始时，玩家在第 0 个方格上，board[0]一直等于 0， 不会有什么影响：”
         
         */
        
        repeat {
            // 顺着梯子爬上去或者顺着蛇滑下去
            square += board[square]
            // 掷骰子
            diceRoll += 1
        
            if diceRoll == 7 { diceRoll = 1 }
            // 根据点数移动
            square += diceRoll
        } while square < finalSquare
        print("Game over!")
        
        /*
         “检测完玩家是否踩在梯子或者蛇上之后，开始掷骰子，然后玩家向前移动diceRoll个方格，本轮循环结束。
         
         循环条件（while square < finalSquare）和while方式相同，但是只会在循环结束后进行计算。在这个游戏中，repeat-while表现得比while循环更好。repeat-while方式会在条件判断square没有超出后直接运行square += board[square]，这种方式可以去掉while版本中的数组越界判断。”
         
         */
    }
    
}
