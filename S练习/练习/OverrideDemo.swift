//
//  OverrideDemo.swift
//  练习
//
//  Created by hudun on 2017/8/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class OverrideDemo: NSObject {

    // MARK: - 重写

    //“重写属性
    
    //你可以重写继承来的实例属性或类型属性，提供自己定制的 getter 和 setter，或添加属性观察器使重写的属性可以观察属性值什么时候发生改变。
    
    //重写属性的 Getters 和 Setters
    //你可以提供定制的 getter（或 setter）来重写任意继承来的属性，无论继承来的属性是存储型的还是计算型的属性。子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。你在重写一个属性时，必需将它的名字和类型都写出来。这样才能使编译器去检查你重写的属性是与超类中同名同类型的属性相匹配的。你可以将一个继承来的只读属性重写为一个读写属性，只需要在重写版本的属性里提供 getter 和 setter 即可。但是，你不可以将一个继承来的读写属性重写为一个只读属性。”
    
    
    
    func run() -> () {
        
        
        
        /*
         
         “在合适的地方，你可以通过使用super前缀来访问超类版本的方法，属性或下标：
         
         
         在方法someMethod()的重写实现中，可以通过super.someMethod()来调用超类版本的someMethod()方法。
         
         在属性someProperty的 getter 或 setter 的重写实现中，可以通过super.someProperty来访问超类版本的someProperty属性。
         
         在下标的重写实现中，可以通过super[someIndex]来访问超类版本中的相同下标。
         ”
         
         
         
         
         “注意
         如果你在重写属性中提供了 setter，那么你也一定要提供 getter。如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过super.someProperty来返回继承来的值，其中someProperty是你要重写的属性的名字。”
         
         摘录来自: 极客学院. “The Swift Programming Language 中文版”。 iBooks.
         
         */
        
        let car = CarTest()
        car.currentSpeed = 25.0
        car.gear = 3
        print("Car: \(car.description)")
        // 打印 "Car: traveling at 25.0 miles per hour in gear 3”
        
        
        //“重写属性观察器
        //你可以通过重写属性为一个继承来的属性添加属性观察器。这样一来，当继承来的属性值发生改变时，你就会被通知到，无论那个属性原本是如何实现的。关于属性观察器的更多内容，请看属性观察器。”
        
        //“注意
        //你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的，所以，为它们提供willSet或didSet实现是不恰当。
        //此外还要注意，你不可以同时提供重写的 setter 和重写的属性观察器。如果你想观察属性值的变化，并且你已经为那个属性提供了定制的 setter，那么你在 setter 中就可以观察到任何值变化了。”
        
        
        let automatic = AutomaticCar()
        automatic.currentSpeed = 35.0
        print("AutomaticCar: \(automatic.description)")
        // 打印 "AutomaticCar: traveling at 35.0 miles per hour in gear 4”
        
        
        //“防止重写
        
        //你可以通过把方法，属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可（例如：final var，final func，final class func，以及final subscript）。
        
        //如果你重写了带有final标记的方法，属性或下标，在编译时会报错。在类扩展中的方法，属性或下标也可以在扩展的定义里标记为 final 的。
        
        //你可以通过在关键字class前添加final修饰符（final class）来将整个类标记为 final 的。这样的类是不可被继承的，试图继承这样的类会导致编译报错。”
        
    }
}


class VehicleTest {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}


class CarTest: VehicleTest {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}



class AutomaticCar: CarTest {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}




