//
//  Construction_04.swift
//  练习
//
//  Created by hudun on 2017/8/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Construction_04: NSObject {

    
    //MARK: - 可失败构造器
    
    //“如果一个类、结构体或枚举类型的对象，在构造过程中有可能失败，则为其定义一个可失败构造器。这里所指的“失败”是指，如给构造器传入无效的参数值，或缺少某种所需的外部资源，又或是不满足某种必要的条件等。
    
    //为了妥善处理这种构造过程中可能会失败的情况。你可以在一个类，结构体或是枚举类型的定义中，添加一个或多个可失败构造器。其语法为在init关键字后面添加问号(init?)。”
    

    //“注意
    //可失败构造器的参数名和参数类型，不能与其它非可失败构造器的参数名，及其参数类型相同。”
    

    //“可失败构造器会创建一个类型为自身类型的可选类型的对象。你通过return nil语句来表明可失败构造器在何种情况下应该“失败”。”
    

    //“注意
    //严格来说，构造器都不支持返回值。因为构造器本身的作用，只是为了确保对象能被正确构造。因此你只是用 return nil 表明可失败构造器构造失败，而不要用关键字return来表明构造成功。”
    

    func run() {
        
        
        //“你可以通过该可失败构造器来构建一个Animal的实例，并检查构造过程是否成功：”
        
        let someCreature = Animal(species: "Giraffe")
        // someCreature 的类型是 Animal? 而不是 Animal
        
        if let giraffe = someCreature {
            print("An animal was initialized with a species of \(giraffe.species)")
        }
        // 打印 "An animal was initialized with a species of Giraffe”
        
        
        //“如果你给该可失败构造器传入一个空字符串作为其参数，则会导致构造失败”
        
        let anonymousCreature = Animal(species: "")
        // anonymousCreature 的类型是 Animal?, 而不是 Animal
        
        if anonymousCreature == nil {
            print("The anonymous creature could not be initialized")
        }
        // 打印 "The anonymous creature could not be initialized”
        
        
        //“注意
        //空字符串（如""，而不是"Giraffe"）和一个值为nil的可选类型的字符串是两个完全不同的概念。上例中的空字符串（""）其实是一个有效的，非可选类型的字符串。这里我们之所以让Animal的可失败构造器构造失败，只是因为对于Animal这个类的species属性来说，它更适合有一个具体的值，而不是空字符串。”
        
        
        
        let fahrenheitUnit = TemperatureUnit(symbol: "F")
        if fahrenheitUnit != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        
        let unknownUnit = TemperatureUnit(symbol: "X")
        if unknownUnit == nil {
            print("This is not a defined temperature unit, so initialization failed.")
        }
        
        
        let fahrenheitUnitTest = TemperatureUnitTest(rawValue: "F")
        if fahrenheitUnitTest != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        // 打印 "This is a defined temperature unit, so initialization succeeded."
        
        let unknownUnitTest = TemperatureUnitTest(rawValue: "X")
        if unknownUnitTest == nil {
            print("This is not a defined temperature unit, so initialization failed.")
        }
        // 打印 "This is not a defined temperature unit, so initialization failed.”
        
    }
}


struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}


//MARK: - “枚举类型的可失败构造器”

//“你可以通过一个带一个或多个参数的可失败构造器来获取枚举类型中特定的枚举成员。如果提供的参数无法匹配任何枚举成员，则构造失败。”

//“下例中，定义了一个名为TemperatureUnit的枚举类型。其中包含了三个可能的枚举成员(Kelvin，Celsius，和Fahrenheit)，以及一个根据Character值找出所对应的枚举成员的可失败构造器：”

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

//“带原始值的枚举类型的可失败构造器”

//“带原始值的枚举类型会自带一个可失败构造器init?(rawValue:)，该可失败构造器有一个名为rawValue的参数，其类型和枚举类型的原始值类型一致，如果该参数的值能够和某个枚举成员的原始值匹配，则该构造器会构造相应的枚举成员，否则构造失败。

//因此上面的TemperatureUnit的例子可以重写为：”

enum TemperatureUnitTest: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}
