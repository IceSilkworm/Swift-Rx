//
//  Closures01.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Closures01: NSObject {
    
    //闭包
    //“闭包是自包含的函数代码块”
    //“闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。 Swift 会为你管理在捕获过程中涉及到的所有内存操作。”
    
    /*
     “在函数章节中介绍的全局和嵌套函数实际上也是特殊的闭包，闭包采取如下三种形式之一：
     
     全局函数是一个有名字但不会捕获任何值的闭包
     嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
     闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
     Swift 的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：
     
     利用上下文推断参数和返回值类型
     隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
     参数名称缩写
     尾随闭包语法”
     
     */
    
    // MARK: - 闭包表达式
    //sorted 方法
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    
    
    // MARK: - 闭包表达式语法
    /*闭包表达式语法有如下的一般形式：
    
    { (parameters) -> returnType in
       statements
    }
 */
    
    
    
    
    func run() -> () {
        
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        var reversedNames = names.sorted(by: backward)
        // reversedNames 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]”
        print(reversedNames)
        /*“如果第一个字符串（s1）大于第二个字符串（s2），backward(_:_:) 函”
        “数会返回 true，表示在新的数组中 s1 应该出现在 s2 前。对于字符串中的字符来说，“大于”表示“按照字母顺序较晚出现”。这意味着字母 "B" 大于字母 "A" ，字符串 "Tom" 大于字符串 "Tim"。该闭包将进行字母逆序排序，"Barry" 将会排在 "Alex" 之前。
        
        然而，以这种方式来编写一个实际上很简单的表达式（a > b)，确实太过繁琐了。对于这个例子来说，利用闭包表达式语法可以更好地构造一个内联排序闭包。”
        
*/
        //“元组也可以作为参数和返回值。”
        //“闭包的函数体部分由关键字in引入。该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。”
        
        reversedNames = names.sorted(by: {(s1: String, s2: String) ->Bool in
            return s1 > s2
        })
        
        //“该例中 sorted(by:) 方法的整体调用保持不变，一对圆括号仍然包裹住了方法的整个参数。然而，参数现在变成了内联闭包”
        reversedNames = names.sorted(by: {(s1: String, s2: String) ->Bool in return s1 > s2
        })
        
        
        // MARK: - “根据上下文推断类型”
        /*
         “因为排序闭包函数是作为 sorted(by:) 方法的参数传入的，Swift 可以推断其参数和返回值的类型。sorted(by:) 方法被一个字符串数组调用，因此其参数必须是 (String, String) -> Bool 类型的函数。这意味着 (String, String) 和 Bool 类型并不需要作为闭包表达式定义的一部分。因为所有的类型都可以被正确推断，返回箭头（->）和围绕在参数周围的括号也可以被省略：”
         */
        
        reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
        
        /*“
         
         实际上，通过内联闭包表达式构造的闭包作为参数传递给函数或方法时
         
         ，总是能够推断出闭包的参数和返回值类型。这意味着闭包作为函数或者方法的参数时，你几乎不需要利用完整格式构造内联闭包。
         
         尽管如此，你仍然可以明确写出有着完整格式的闭包。如果完整格式的闭包能够提高代码的可读性，则我们更鼓励采用完整格式的闭包”
         
         */
        
        //MARK: - “单表达式闭包隐式返回”
        
        //“单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果，如上版本的例子可以改写为：
        
        reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
        reversedNames = names.sorted(by: { s1, s2 in
            s1 < s2
        } )
        //“在这个例子中，sorted(by:) 方法的参数类型明确了闭包必须返回一个 Bool 类型值。因为闭包函数体只包含了一个单一表达式（s1 > s2），该表达式返回 Bool 类型值，因此这里没有歧义，return 关键字可以省略。”
        
        
        
        // MARK: - 参数名称缩写
        /*
         “Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
         
         如果你在闭包表达式中使用参数名称缩写，你可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断。in关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成：”
         */
        reversedNames = names.sorted(by: { $0 > $1 } )
        print(reversedNames)
        reversedNames = names.sorted(by: { $0 < $1 } )
        print(reversedNames)
        
        //“在这个例子中，$0和$1表示闭包中第一个和第二个 String 类型的参数。”
        
    }
}
