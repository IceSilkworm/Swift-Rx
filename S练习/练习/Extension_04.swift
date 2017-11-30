//
//  Extension_04.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Extension_04: NSObject {

    //嵌套类型
    
    func run() -> Void {
        
        
        
        //“现在，这个嵌套枚举可以和任意 Int 值一起使用了：
        
        func printIntegerKinds(_ numbers: [Int]) {
            for number in numbers {
                switch number.kind {
                case .Negative:
                    print("- ", terminator: "")
                case .Zero:
                    print("0 ", terminator: "")
                case .Positive:
                    print("+ ", terminator: "")
                }
            }
            print("")
        }
        printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
        // 打印 “+ + - 0 - 0 + ”
        
        
        //“注意
        //由于已知 number.kind 是 Int.Kind 类型，因此在 switch 语句中，Int.Kind 中的所有成员值都可以使用简写形式，例如使用 . Negative 而不是 Int.Kind.Negative。
        
        
    }
}

//“扩展可以为已有的类、结构体和枚举添加新的嵌套类型：”

//“该例子为 Int 添加了嵌套枚举。这个名为 Kind 的枚举表示特定整数的类型。具体来说，就是表示整数是正数、零或者负数。这个例子还为 Int 添加了一个计算型实例属性，即 kind，用来根据整数返回适当的 Kind 枚举成员。”

extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

