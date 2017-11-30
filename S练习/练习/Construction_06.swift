//
//  Construction_06.swift
//  练习
//
//  Created by hudun on 2017/8/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Construction_06: NSObject {

    
    //MARK: -必要构造器
    
    //“在类的构造器前添加required修饰符表明所有该类的子类都必须实现该构造器：”
    /*
    “class SomeClass {
        required init() {
            // 构造器的实现代码
        }
    }
     在子类重写父类的必要构造器时，必须在子类的构造器前也添加required”“修饰符，表明该构造器要求也应用于继承链后面的子类。在重写父类中必要的指定构造器时，不需要添加override修饰符：”
     
     
     class SomeSubclass: SomeClass {
         required init() {
         // 构造器的实现代码
     
        }
     }
     
     
    
     “注意
     如果子类继承的构造器能满足必要构造器的要求，则无须在子类中显式提供必要构造器的实现。”
     
     
     
*/
    
    
    //MARK: -“通过闭包或函数设置属性的默认值”
    
    //“如果某个存储型属性的默认值需要一些定制或设置，你可以使用闭包或全局函数为其提供定制的默认值。每当某个属性所在类型的新实例被创建时，对应的闭包或函数会被调用，而它们的返回值会当做默认值赋值给这个属性。
    
    //这种类型的闭包或函数通常会创建一个跟属性类型相同的临时变量，然后修改它的值以满足预期的初始状态，最后返回这个临时变量，作为属性的默认值。”
    
    
    
    
/*
    “class SomeClass {
        let someProperty: SomeType = {
            // 在这个闭包中给 someProperty 创建一个默认值
            // someValue 必须和 SomeType 类型相同
            return someValue
        }()
    }
    注意闭包结尾的大括号后面接了一对空的小括号。这用来告诉 Swift 立即执行此闭包。如果你忽略了这对括号，相当于将闭包本身作为值赋值给了属性，而不是将闭包的返回值赋值给属性。”
    
     
     “注意
     如果你使用闭包来初始化属性，请记住在闭包执行时，实例的其它部分都还没有初始化。这意味着你不能在闭包里访问其它属性，即使这些属性有默认值。同样，你也不能使用隐式的self属性，或者调用任何实例方法。
     
     ”
*/
    
    func run() {
        
        //“每当一个新的Checkerboard实例被创建时，赋值闭包会被执行，boardColors的默认值会被计算出来并返回。上面例子中描述的闭包将计算出棋盘中每个格子对应的颜色，并将这些值保存到一个临时数组temporaryBoard中，最后在构建完成时将此数组作为闭包返回值返回。这个返回的数组会保存到boardColors中，并可以通过工具函数squareIsBlackAtRow来查询：”
        
        let board = Checkerboard()
        print(board.squareIsBlackAtRow(row: 0, column: 1))
        
        //打印 ‘true’
        
        print(board.squareIsBlackAtRow(row: 7, column: 7))
        
        //打印 ‘false’
    }
}



//西洋跳棋棋盘

//“西洋跳棋游戏在一副黑白格交替的10x10的棋盘中进行。为了呈现这副游戏棋盘，Checkerboard结构体定义了一个属性boardColors，它是一个包含100个Bool值的数组。在数组中，值为true的元素表示一个黑格，值为false的元素表示一个白格。数组中第一个元素代表棋盘上左上角的格子，最后一个元素代表棋盘上右下角的格子。

//boardColor数组是通过一个闭包来初始化并设置颜色值的：”

struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

