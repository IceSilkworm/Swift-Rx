//
//  Enum_03.swift
//  练习
//
//  Created by hudun on 2017/8/11.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Enum_03: NSObject {

    // MARK: - 递归枚举
    
    //“递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上indirect来表示该成员可递归。
    
    //例如，下面的例子中，枚举类型存储了简单的算术表达式：”
    
    enum ArithmeticExpression {
        case number(Int)
        indirect case addition(ArithmeticExpression, ArithmeticExpression)
        indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    
    //“你也可以在枚举类型开头加上indirect关键字来表明它的所有成员都是可递归的：
    
    indirect enum ArithmeticExpression_01 {
        case number(Int)
        case addition(ArithmeticExpression_01, ArithmeticExpression_01)
        case multiplication(ArithmeticExpression_01, ArithmeticExpression_01)
    }
    
    //“要操作具有递归性质的数据结构，使用递归函数是一种直截了当的方式。例如，下面是一个对算术表达式求值的函数：”
    func evaluate(_ expression: ArithmeticExpression_01) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
        }
    }

    func run() -> () {
        //“上面定义的枚举类型可以存储三种算术表达式：纯数字、两个表达式相加、两个表达式相乘。枚举成员addition和multiplication的关联值也是算术表达式——这些关联值使得嵌套表达式成为可能。例如，表达式(5 + 4) * 2，乘号右边是一个数字，左边则是另一个表达式。因为数据是嵌套的，因而用来存储数据的枚举类型也需要支持这种嵌套——这意味着枚举类型需要支持递归。下面的代码展示了使用ArithmeticExpression这个递归枚举创建表达式(5 + 4) * 2”
        
        let five = ArithmeticExpression_01.number(5)
        let four = ArithmeticExpression_01.number(4)
        let sum = ArithmeticExpression_01.addition(five, four)
        let product = ArithmeticExpression_01.multiplication(sum, ArithmeticExpression_01.number(2))
        
        print(product)
        
        
        
        print(evaluate(product))
        // 打印 "18”
        //“该函数如果遇到纯数字，就直接返回该数字的值。如果遇到的是加法或乘法运算，则分别计算左边表达式和右边表达式的值，然后相加或相乘。”
        
    }
}
