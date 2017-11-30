//
//  Properties_03.swift
//  练习
//
//  Created by hudun on 2017/8/14.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Properties_03: NSObject {

    // MARK: - 属性观察器
    //“属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外。”
    
    /*
     
     “可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重写属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。你不必为非重写的计算属性添加属性观察器，因为可以通过它的 setter 直接监控和响应值的变化。 属性重写请参考重写。
     
     可以为属性添加如下的一个或全部观察器：
     
     willSet 在新的值被设置之前调用
     didSet 在新的值被设置之后立即调用
     
     willSet 观察器会将新的属性值作为常量参数传入，在 willSet 的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称 newValue 表示。
     
     同样，didSet 观察器会将旧的属性值作为参数传入，可以为该参数命名或者使用默认参数名 oldValue。如果在 didSet 方法中再次对该属性赋值，那么新值会覆盖旧的值。
     
     注意
     父类的属性在子类的构造器中被赋值时，它在父类中的 willSet 和 didSet 观察器会被调用，随后才会调用子类的观察器。在父类初始化方法调用之前，子类给属性赋值时，观察器不会被调用。 有关构造器代理的更多信息，请参考值类型的构造器代理和类的构造器代理规则。”
     
     */
    
    func run() {
        //“下面是一个 willSet 和 didSet 实际运用的例子，其中定义了一个名为 StepCounter 的类，用来统计一个人步行时的总步数。这个类可以跟计步器或其他日常锻炼的统计装置的输入数据配合使用。”
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        // About to set totalSteps to 200
        // Added 200 steps
        stepCounter.totalSteps = 360
        // About to set totalSteps to 360”
        // Added 160 steps
        stepCounter.totalSteps = 896
        // About to set totalSteps to 896
        // Added 536 steps”
        
        
        //“StepCounter 类定义了一个 Int 类型的属性 totalSteps，它是一个存储属性，包含 willSet 和 didSet 观察器。”
        
        //“注意
        
        //如果将属性通过 in-out 方式传入函数，willSet 和 didSet 也会调用。这是因为 in-out 参数采用了拷入拷出模式：即在函数内部使用的是参数的 copy，函数结束后，又对参数重新赋值。关于 in-out 参数详细的介绍
        
        
        
        
        // MARK: - “全局变量和局部变量”
        
        //“计算属性和属性观察器所描述的功能也可以用于全局变量和局部变量。全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量。”
        
        //“注意
        //全局的常量或变量都是延迟计算的，跟延迟存储属性相似，不同的地方在于，全局的常量或变量不需要标记lazy修饰符。
        //局部范围的常量或变量从不延迟计算。”
        
        
        // MARK: - 类型属性
        
        /*
         “实例属性属于一个特定类型的实例，每创建一个实例，实例都拥有属于自己的一套属性值，实例之间的属性相互独立。
         
         也可以为类型本身定义属性，无论创建了多少个该类型的实例，这些属性都只有唯一一份。这种属性就是类型属性。
         
         类型属性用于定义某个类型所有实例共享的数据，比如所有实例都能用的一个常量（就像 C 语言中的静态常量），或者所有实例都能访问的一个变量（就像 C 语言中的静态变量）。
         
         存储型类型属性可以是变量或常量，计算型类型属性跟实例的计算型属性一样只能定义成变量属性。”
         
         “注意
         跟实例的存储型属性不同，必须给存储型类型属性指定默认值，因为类型本身没有构造器，也就无法在初始化过程中使用构造器给类型属性赋值。
         存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符。”
         
         */
        
        
        // MARK: - 类型属性语法
        
        //“获取和设置类型属性的值”
        
        //“类型属性是通过类型本身来访问，而不是通过实例”
        
        print(SomeStructure.storedTypeProperty)
        // 打印 "Some value."
        SomeStructure.storedTypeProperty = "Another value."
        print(SomeStructure.storedTypeProperty)
        // 打印 "Another value.”
        print(SomeEnumeration.computedTypeProperty)
        // 打印 "6"
        print(SomeClass.computedTypeProperty)
        // 打印 "27”
        
        
        
        
        /*
         
         “下面的例子定义了一个结构体，使用两个  存储型类型属性  来表示两个声道的音量，每个声道具有 0 到 10 之间的整数音量。
         
         下图展示了如何把两个声道结合来模拟立体声的音量。当声道的音量是 0，没有一个灯会亮；当声道的音量是 10，所有灯点亮。本图中，左声道的音量是 9，右声道的音量是 7：”
         
         */
        
        var leftChannel = AudioChannel()
        var rightChannel = AudioChannel()
        
        leftChannel.currentLevel = 7
        print(leftChannel.currentLevel)
        //输出 ‘7’
        print(AudioChannel.maxInputLevelForAllChannels)
        //输出 ‘7’
        
        rightChannel.currentLevel = 11
        print(rightChannel.currentLevel)
        //输出 ‘10’
        print(AudioChannel.maxInputLevelForAllChannels)
        //输出 ‘10’
    }
}

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {  //不设置参数，默认 newValue
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

// MARK: - 类型属性语法
//“在 C 或 Objective-C 中，与某个类型关联的静态常量和静态变量，是作为全局（global）静态变量定义的。但是在 Swift 中，类型属性是作为类型定义的一部分写在类型最外层的花括号内，因此它的作用范围也就在类型支持的范围内。

//使用关键字 static 来定义类型属性。在为类定义计算型类型属性时，可以改用关键字 class 来支持子类对父类的实现进行重写。下面的例子演示了存储型和计算型类型属性的语法：”
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

//“注意
//例子中的计算型类型属性是只读的，但也可以定义可读可写的计算型类型属性，跟计算型实例属性的语法相同。”


///////
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将当前音量限制在阀值之内
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // 存储当前音量作为新的最大输入音量
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}


/*

 “结构 AudioChannel 定义了 2 个存储型类型属性来实现上述功能。第一个是 thresholdLevel，表示音量的最大上限阈值，它是一个值为 10 的常量，对所有实例都可见，如果音量高于 10，则取最大上限值 10（见后面描述）。
 
 第二个类型属性是变量存储型属性 maxInputLevelForAllChannels，它用来表示所有 AudioChannel 实例的最大音量，初始值是0。
 
 AudioChannel 也定义了一个名为 currentLevel 的存储型实例属性，表示当前声道现在的音量，取值为 0 到 10。
 
 属性 currentLevel 包含 didSet 属性观察器来检查每次设置后的属性值，它做如下两个检查：
 
    1.如果 currentLevel 的新值大于允许的阈值 thresholdLevel，属性观察器将 currentLevel 的值限定为阈值 thresholdLevel。
    2.如果修正后的 currentLevel 值大于静态类型属性 maxInputLevelForAllChannels 的值，属性观察器就将新值保存在 maxInputLevelForAllChannels 中。”
 
 
 “注意
 在第一个检查过程中，didSet 属性观察器将 currentLevel 设置成了不同的值，但这不会造成属性观察器被再次调用。”
 
 */
