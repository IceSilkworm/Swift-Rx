//
//  Closures02.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Closures02: NSObject {

    
    
    func run()  {
        
        var reversedNames = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        /*“实际上还有一种更简短的方式来编写上面例子中的闭包表达式。Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受“两个 String 类型的参数并返回 Bool 类型的值。而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。因此，你可以简单地传递一个大于号，Swift 可以自动推断出你想使用大于号的字符串函数实现：”
         */
        
        //MARK: - 运算符方法

        reversedNames = reversedNames.sorted(by: >)
        print(reversedNames)
        
        //“如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
        
        reversedNames = reversedNames.sorted { $0 > $1 }
        
        run1()
    }
    
    
    func run1() -> () {
        //MARK: - 尾随闭包
        // 当函数最后一个参数是 闭包， 可以简化为 尾随闭包
        
        /*
         “如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时，你不用写出它的参数标签：”
         */
        
        func someFunctionThatTakesAClosure(closure: () -> Void) {
            // 函数体部分
        }
        
        // 以下是不使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure(closure: {
            // 闭包主体部分
            
        })
        
        // 以下是使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure() {
            // 闭包主体部分
        }
        
        /*
         “当闭包非常长以至于不能在一行中进行书写时，尾随闭包变得非常有用。举例来说，Swift 的 Array 类型有一个 map(_:) 方法，这个方法获取一个闭包表达式作为其唯一参数。该闭包函数会为数组中的每一个元素调用一次，并返回该元素所映射的值。具体的映射方式和返回值类型由闭包来指定。”
         
         */
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        
        let numbers = [16, 58, 510]
        
        let strings = numbers.map {  //map 后面() 可省
            (number) -> String in
            
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            
            return output
        }
        
        // strings 常量被推断为字符串类型数组，即 [String]
        // 其值为 ["OneSix", "FiveEight", "FiveOneZero"]”
        
        print(strings)
        
        //“map(_:) 为数组中每一个元素调用了一次闭包表达式。你不需要指定闭包的输入参数 number 的类型，因为可以通过要映射的数组类型进行推断。”
        
        //“在该例中，局部变量 number 的值由闭包中的 number 参数获得，因此可以在闭包函数体内对其进行修改，(闭包或者函数的参数总是常量)，闭包表达式指定了返回类型为 String，以表明存储映射值的新数组类型为 String。”
        
        //“注意：
        //字典 digitNames 下标后跟着一个叹号（!），因为字典下标返回一个可选值（optional value），表明该键不存在时会查找失败。在上例中，由于可以确定 number % 10 总是 digitNames 字典的有效下标，因此叹号可以用于强制解包 (force-unwrap) 存储在下标的可选类型的返回值中的”“String类型的值。”
        
        //闭包属性 默认 强引用
        weak var weakSelf = self
        
        loadData { (string) in
            print("数据" + string)
            
            //此处使用 self 引起循环引用
            
            //使用 ？ ，如果是 nil ， 就不会执行任何操作
            print(weakSelf!)
            print(weakSelf?.content as Any)
            
        }
        
        //swift 解除循环引用 方法 1  == __weak
        loadData { [weak self] (string) in
            print("数据" + string)
            print(self!)
        }

        // 方法 2   == __unsafe_unretained
        loadData { [unowned self] (string) in
            print("数据" + string)
            print(self)
        }
    }
    
    var content = String("sdfsfs")
    
    //闭包 设置optional
    var finishedCallBack:((_ data: String) -> ())?
    
    //没有参数， 返回值 的闭包
    func loadData(finished: @escaping (_ data: String) -> ()) -> Void {
        //记录闭包
        
        finishedCallBack = finished
        
        //主队列 (串行
        let mainQueue = DispatchQueue.main
        //全局队列 (并发
        let globalQueue = DispatchQueue.global()
        
        print("DispatchQueue.main.sync: befor", Thread.current)
        globalQueue.async { () -> Void in
            
            mainQueue.async { ()-> Void in
                
//                { () -> () in
//                    print("数据")
//                }()
                
                //等价
                //finished("")
                
                
                //闭包是外部传递过来的 须加 self 明确调用上下文，才能分清是那个对象传递过来的
                //才能使用属性和方法
                self.working()
            }
        }
        
    }
    
    func working() {
        finishedCallBack?(" ababaabbaba")
    }
    
    //析构函数
    deinit {
        print("VB")
    }
}
