//
//  Enum_1.swift
//  练习
//
//  Created by hudun on 2017/8/11.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Enum_1: NSObject {

    //“枚举为一组相关的值定义了一个共同的类型，使你可以在你的代码中以类型安全的方式来使用这些值。”
    //“Swift 中的枚举更加灵活，不必给每一个枚举成员提供一个值。如果给枚举成员提供一个值（称为“原始”值），则该值的类型可以是字符串，字符，或是一个整型值或浮点数。
    //“此外，枚举成员可以指定任意类型的关联值存储到枚举成员中，就像其他语言中的联合体（unions）和变体（variants）。你可以在一个枚举中定义一组相关的枚举成员，每一个枚举成员都可以有适当类型的关联值。
    
    //在 Swift 中，枚举类型是一等（first-class）类型。它们采用了很多在传统上只被类（class）所支持的特性，例如计算属性（computed properties），用于提供枚举值的附加信息，实例方法（instance methods），用于提供和枚举值相关联的功能。枚举也可以定义构造函数（initializers）来提供一个初始值；可以在原始实现的基础上扩展它们的功能；还可以遵循协议（protocols）来提供标准的功能。”
    
    
    // MARK: - 枚举语法
    enum SomeEnumeration {
        
    }
    
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    //“注意
    //与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的CompassPoint例子中，north，south，east和west不会被隐式地赋值为0，1，2和3。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的CompassPoint类型”
    enum Planet {
        case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    //“每个枚举定义了一个全新的类型。像 Swift 中其他类型一样，它们的名字（例如CompassPoint和Planet）应该以一个大写字母开头。给枚举类型起一个单数名字而不是复数名字，以便于读起来更加容易理解：”
    
    
    // MARK: - 关联值
    
    //“你可以定义 Swift 枚举来存储任意类型的关联值，如果需要的话，每个枚举成员的关联值类型可以各不相同。枚举的这种特性跟其他语言中的可识别联合（discriminated unions），标签联合（tagged unions），或者变体（variants）相似。”
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    
    //“定义一个名为Barcode的枚举类型，它的一个成员值是具有(Int，Int，Int，Int)类型关联值的upc，另一个成员值是具有String类型关联值的qrCode。”
    
    
    
    func run() -> Void {
        
        var directionToHead = CompassPoint.west
        //“directionToHead的类型可以在它被CompassPoint的某个值初始化时推断出来。一旦directionToHead被声明为CompassPoint类型，你可以使用更简短的点语法将其设置为另一个CompassPoint的值”
        directionToHead = .east
        //“当directionToHead的类型已知时，再次为其赋值可以省略枚举类型名。在使用具有显式类型的枚举值时，这种写法让代码具有更好的可读性。”
        print(directionToHead)
        print(type(of: directionToHead)) //CompassPoint 类型
        
        
        // MARK: - 使用 Switch 语句匹配枚举值

        directionToHead = .south
        switch directionToHead {
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("Watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
            
        }
        
        let somePlanet = Planet.earth
        switch somePlanet {
        case .earth:
            print("Mostly harmless")
            
        default:
            print("Not a safe place for humans")
        }
        // 打印 "Mostly harmless”
        
        
        
        
        //“这个定义不提供任何Int或String类型的关联值，它只是定义了，当Barcode常量和变量等于Barcode.upc或Barcode.qrCode时，可以存储的关联值的类型。
        
        //然后可以使用任意一种条形码类型创建新的条形码，例如”
        
        var productbarcode = Barcode.upc(8, 85909, 51226, 3)
        //“上面的例子创建了一个名为productBarcode的变量，并将Barcode.upc赋值给它，关联的元组值为(8, 85909, 51226, 3)。”
        print(productbarcode)
        print(type(of: productbarcode))
        
        productbarcode = .qrCode("ABCDEFGHIJKLMNOP")
        //“Barcode类型的常量和变量可以存储一个.upc或者一个.qrCode（连同它们的关联值），但是在同一时间只能存储这两个值”“中的一个”
        
        switch productbarcode {
        case .upc(let numberSystem, let manufacturer, let product, let check):
            print("UPC: \(numberSystem),\(manufacturer),\(product),\(check)")
            
        case .qrCode(let productCode):
            print("QR code: \(productCode)")
            
        }
        
        // 打印 "QR code: ABCDEFGHIJKLMNOP.”
        
        
        //“如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个let或者var：”
        switch productbarcode {
        case let .upc(numberSystem, manufacturer, product, check):
            print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
        case let .qrCode(productCode):
            print("QR code: \(productCode).")
        }
        // 输出 "QR code: ABCDEFGHIJKLMNOP."
        
        
    }
}
