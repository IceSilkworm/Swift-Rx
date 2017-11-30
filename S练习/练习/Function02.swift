//
//  Function02.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Function02: NSObject {

    /*
     “一个可变参数（variadic parameter）可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数可以被传入不确定数量的输入值。通过在变量类型名后面加入（...）的方式来定义可变参数。
     
     可变参数的传入值在函数体中变为此类型的一个数组。例如，一个叫做 numbers 的 Double... 型可变参数，在函数体内可以当做一个叫 numbers 的 [Double] 型的数组常量。
     
     ”
     */
    // MARK: - 可变参数
    func arithmeticMean(_ numbers: Double ...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        
        return total / Double(numbers.count)
    }
    
    
    /*
     “函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误(compile-time error)。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。
     
     定义一个输入输出参数时，在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。”
     
     “你只能传递变量给输入输出参数。你不能传入常量或者字面量，因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改。”
     */
    //MARK: - 输入输出参数
    func swapTwoInts(_ a: inout Int, _ b: inout Int) -> () {
        let temppoparyA = a
        a = b
        b = temppoparyA
        /*
         “swapTwoInts(_:_:) 函数简单地交换 a 与 b 的值。该函数先将 a 的值存到一个临时常量 temporaryA 中，然后将 b 的值赋给 a，最后将 temporaryA 赋值给 b。
         
         你可以用两个 Int 型的变量来调用 swapTwoInts(_:_:)。需要注意的是，someInt 和 anotherInt 在传入 swapTwoInts(_:_:) 函数前，都加了 & 的前缀：”
         */
    }
    
    
    func run() -> Void {
        var avg = arithmeticMean(1,2,3,4,5)
        // 返回 3.0, 是这 5 个数的平均数”
        avg = arithmeticMean(3, 8.25, 18.75)
        // 返回 10.0, 是这 3 个数的平均数。”
        
        avg = arithmeticMean()  // NaN
        
        print(avg)
        
        //
        var someInt = 3, anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        // 打印 "someInt is now 107, and anotherInt is now 3”
        //“从上面这个例子中，我们可以看到 someInt 和 anotherInt 的原始值在 swapTwoInts(_:_:) 函数中被修改，尽管它们的定义在函数体外。”
        //“注意：
        //输入输出参数和返回值是不一样的。上面的 swapTwoInts 函数并没有定义任何返回值，但仍然修改了 someInt 和 anotherInt 的值。输入输出参数是函数对函数体外产生影响的另一种方式。”
        
    }
}
