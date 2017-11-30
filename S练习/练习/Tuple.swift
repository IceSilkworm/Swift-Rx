//
//  Tuple.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Tuple: NSObject {

    func run() -> Void {
        
        /*
         “(404, "Not Found") 元组把一个 Int 值和一个 String 值组合起来表示 HTTP 状态码的两个部分：一个数字和一个人类可读的描述。这个元组可以被描述为“一个类型为 (Int, String) 的元组”。
         
         你可以把任意顺序的类型组合成一个元组，这个元组可以包含所有类型。只要你想，你可以创建一个类型为 (Int, Int, Int) 或者 (String, Bool) 或者其他任何你想要的组合的元组。”
         */
        let catCharacters: [Character] = ["C","a","t","!"]
        let carstring = String(catCharacters)
        print(carstring)
        
        //“你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了：”
        let http404Error = (404, "Not Found")
        let (statusCode, statusMessage) = http404Error
        print(statusCode)
        print(statusMessage)
        
        //“如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：”
        let (jsutTheStatusCode, _) = http404Error
        print(jsutTheStatusCode)
        
        //“此外，你还可以通过下标来访问元组中的单个元素，下标从零开始：”
        
        print(http404Error.1)
        
        //“你可以在定义元组的时候给单个元素命名：”
        
        let http200Status = (statusCode: 200, description: "OK")
        
        print("The status code is \(http200Status.statusCode)")
        // 输出 "The status code is 200"
        print("The status message is \(http200Status.description)")
        // 输出 "The status message is OK”
        
    }
}
