//
//  Construction_01.swift
//  练习
//
//  Created by hudun on 2017/8/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Construction_01: NSObject {
    //“构造过程是使用类、结构体或枚举类型的实例之前的准备过程。在新实例可用前必须执行这个过程，具体操作包括设置实例中每个存储型属性的初始值和执行其他必须的设置或初始化工作。”
    
    
    //MARK: - “存储属性的初始赋值”
    //“类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状态。
    
    //你可以在构造器中为存储型属性赋初值，也可以在定义属性时为其设置默认值。以下小节将详细介绍这两种方法。”
    
    //“注意
    //当你为存储型属性设置默认值或者在构造器中为其赋值时，它们的值是被直接设置的，不会触发任何属性观察者。”
    
    
    func run() -> () {
        
        let f = Fahrenheit()
        print("The default tamperature is \(f.temperature) Fahrenheit")
        
        //“这个结构体定义了一个不带参数的构造器init，并在里面将存储型属性temperature的值初始化为32.0（华氏温度下水的冰点）。”
        
        
        
        
        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        print(boilingPointOfWater)
        // boilingPointOfWater.temperatureInCelsius 是 100.0
        let freezingPointOfWater = Celsius(fromKelvin: 273.15)
        print(freezingPointOfWater)
        // freezingPointOfWater.temperatureInCelsius 是 0.0”
        
        
        let bodyTemperature = Celsius(37.0)
        print(bodyTemperature)
        // bodyTemperature.temperatureInCelsius 为 37.0”
        
        
        
        
        
        // MARK: - 可选属性类型
        
        //“如果你定制的类型包含一个逻辑上允许取值为空的存储型属性——无论是因为它无法在初始化时赋值，还是因为它在之后某个时间点可以赋值为空——你都需要将它定义为可选类型。可选类型的属性将自动初始化为nil，表示这个属性是有意在初始化时设置为空的。”
        let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
        cheeseQuestion.ask()
        // 打印 "Do you like cheese?"
        cheeseQuestion.response = "Yes, I do like cheese."
        
        
        
        
        
        
        
        // MARK: - “构造过程中常量属性的修改”
        //“你可以在构造过程中的任意时间点给常量属性指定一个值，只要在构造过程结束时是一个确定的值。一旦常量属性被赋值，它将永远不可更改”
        //“注意
        //对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。”
        
        
    }
}
//“定义了一个用来保存华氏温度的结构体Fahrenheit”

struct Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}

//“自定义构造过程”

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

class SurveyQuestion {
//    var text: String
    let text: String

    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
    
    
}
