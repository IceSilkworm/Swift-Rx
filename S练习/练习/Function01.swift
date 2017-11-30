//
//  Function01.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Function01: NSObject {
    
    
    //
    func greet(person: String) -> String {
        let greeting = "Hello, " + person + "!"
        return greeting
    }
    
    func greetAgain(person: String) -> String {
        return "Hello again, " + person + "!"
    }
    
    func greet(person: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return greetAgain(person: person)
        } else {
            return greet(person: person)
        }
    }
    
    // 打印 "Hello again, Tim!”
    
    // MARK: - “多重返回值函数”
    
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            }
            else if value > currentMax {
                currentMax = value
            }
        }
        
        return (currentMin, currentMax)
    }
    
    // MARK: - “可选元组返回类型”
    func minMaxOptional(array: [Int]) -> (min: Int, max: Int)? {
        
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            }
            else if value > currentMax {
                currentMax = value
            }
        }
        
        return (currentMin, currentMax)
    }
    
    
    // MARK: - “函数参数标签和参数名称”
    
    func someFunction(firstParameter: Int, secondParameter: Int) -> () {
        
        print(firstParameter + secondParameter)
    }
    
    // MARK: - 指定参数标签
    func someFuction(argumentLabel parameterName: Int) -> () {
        
    }
    
    func greet(person: String, from hometown: String) -> String {
        return "Hello \(person)!  Glad you could visit from \(hometown)."
    }
    
    // MARK: - 忽略参数标签
    func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
        // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
    }
    
    // MARK: - 默认参数值
    
    func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
        // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
    }
    
    func run() -> Void {
        print(greet(person: "Tim", alreadyGreeted: true))

        if let bounds = minMaxOptional(array: [8, -6, 2, 109, 3, 71]) {
            print("min is \(bounds.min) and max is \(bounds.max)")
        }
        // 打印 "min is -6 and max is 109”
        
        someFunction(firstParameter: 1, secondParameter: 2)
        someFuction(argumentLabel: 3)
        
        print(greet(person: "Bill", from: "Cupertino"))
        // 打印 "Hello Bill!  Glad you could visit from Cupertino.”
        
        someFunction(30, secondParameterName: 22)
        
        //
        someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
        // parameterWithDefault = 6
        someFunction(parameterWithoutDefault: 4)
        // parameterWithDefault = 12
    }
    
}
