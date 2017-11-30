//
//  Enum_02.swift
//  练习
//
//  Created by hudun on 2017/8/11.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Enum_02: NSObject {

    
    //MARK: - 原始值
    
    //“作为关联值的替代选择，枚举成员可以被默认值（称为原始值）预填充，这些原始值的类型必须相同。”
    
    //“这是一个使用 ASCII 码作为原始值的枚举：
    
    enum ASCIIControlCharacter: Character {
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }
    //“原始值可以是字符串，字符，或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。”
    
    //“注意
    //原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值，像上述三个 ASCII 码。对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。
    
    // MARK: - “原始值的隐式赋值”
    //“当使用整数作为原始值时，隐式赋值的值依次递增1。如果第一个枚举成员没有设置原始值，其原始值将为0。”
    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    
    enum CompassPoint: String {
        case north, south, east, west
    }
    //“上面例子中，CompassPoint.south拥有隐式原始值south，依次类推。”
    
    
    func run() {
        
        let earthsOrder = Planet.earth.rawValue
        print(earthsOrder)
        // 值为 3
        let sunsetDirection = CompassPoint.west.rawValue
        print(sunsetDirection)
        //sunsetDirection 值为 "west”
        
        //“使用原始值初始化枚举实例”
        //“如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做rawValue的参数，参数类型即为原始值类型，返回值则是枚举成员或nil。你可以使用这个初始化方法来创建一个新的枚举实例。
        
        //这个例子利用原始值7创建了枚举成员uranus：”
        let possiblePlanet = Planet(rawValue: 7)
        //“// possiblePlanet 类型为 Planet? 值为 Planet.uranus”
        print(possiblePlanet as Any)
        
        //“然而，并非所有Int值都可以找到一个匹配的行星。因此，原始值构造器总是返回一个可选的枚举成员。在上面的例子中，possiblePlanet是Planet?类型，或者说“可选的Planet”。”
        
        //“注意
        //原始值构造器是一个可失败构造器，因为并不是每一个原始值都有与之对应的枚举成员。”
        
        
        //“如果你试图寻找一个位置为11的行星，通过原始值构造器返回的可选Planet值将是nil：”
        let positionToFind = 11
        if let somePlanet = Planet(rawValue: positionToFind) {
            switch somePlanet {
            case .earth:
                print("Mostly harmless")
            default:
                print("Not a safe place for humans")
            }
        } else {
            print("There isn't a planet at position \(positionToFind)")
        }
        
        //“// 输出 "There isn't a planet at position 11”
        
        //“这个例子使用了可选绑定（optional binding），试图通过原始值11来访问一个行星。if let somePlanet = Planet(rawValue: 11)语句创建了一个可选Planet，如果可选Planet的值存在，就会赋值给somePlanet。在这个例子中，无法检索到位置为11的行星，所以else分支被执行。”
        
    }
}
