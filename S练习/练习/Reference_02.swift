//
//  Reference_02.swift
//  练习
//
//  Created by hudun on 2017/9/20.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Reference_02: NSObject {

    //MARK: - “闭包引起的循环强引用”
    
    //“循环强引用的产生，是因为闭包和类相似，都是引用类型”
    

    func run() -> () {
        
        
        let heading = HTMLElement(name: "h1")
        let defaultText = "some default text"
        heading.asHTML = {
            return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
        }
        print(heading.asHTML())
        // 打印 “<h1>some default text</h1>
        //注意
        //asHTML声明为lazy属性，因为只有当元素确实需要被处理为 HTML 输出的字符串时，才需要使用asHTML。也就是说，在默认的闭包中可以使用self，因为只有当初始化完成以及self确实存在后，才能访问lazy属性。”
        
        
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTML())
        // 打印 “<p>hello, world</p>”
        
        //“注意
        //上面的paragraph变量定义为可选类型的HTMLElement，因此我们可以赋值nil给它来演示循环强引用。”
        //“不幸的是，上面写的HTMLElement类产生了类实例和作为asHTML默认值的闭包之间的循环强引用。循环强引用如下图所示：”

        //“如果设置paragraph变量为nil，打破它持有的HTMLElement实例的强引用，HTMLElement实例和它的闭包都不会被销毁，也是因为循环强引用：
        
        paragraph = nil
        //注意，HTMLElement的析构函数中的消息并没有被打印，证明了HTMLElement实例并没有被销毁。”
        
        
        //“注意
        //Swift 有如下要求：只要在闭包内使用self的成员，就要用self.someProperty或者self.someMethod()（而不只是someProperty或someMethod()）。这提醒你可能会一不小心就捕获了self。
        
        
        
        //MARK: - “弱引用和无主引用”
        
        /*
        “在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用。
        
        相反的，在被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用。弱引用总是可选类型，并且当引用的实例被销毁后，弱引用的值会自动置为nil。这使我们可以在闭包体内检查它们是否存在。
        
        注意
        如果被捕获的引用绝对不会变为nil，应该用无主引用，而不是弱引用。”
        */
        
    }

}

class HTMLElement {
    
    let name: String
    let text: String?
    
    
    //“下面的HTMLElement实现和之前的实现一致，除了在asHTML闭包中多了一个捕获列表。这里，捕获列表是[unowned self]，表示“将self捕获为无主引用而不是强引用”。”
    //“这一次，闭包以无主引用的形式捕获self，并不会持有HTMLElement实例的强引用。如果将paragraph赋值为nil，HTMLElement实例将会被销毁，并能看到它的析构函数打印出的消息：”
    //“paragraph = nil
    // 打印 “p is being deinitialized”
    
    lazy var asHTML: (Void) -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    //“注意
    //虽然闭包多次使用了self，它只捕获HTMLElement实例的一个强引用。”
    
    /*
     “定义捕获列表
     
     捕获列表中的每一项都由一对元素组成，一个元素是weak或unowned关键字，另一个元素是类实例的引用（例如self）或初始化过的变量（如delegate = self.delegate!）。这些项在方括号中用逗号分开。”
     

     lazy var someClosure: (Int, String) -> String = {
        [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
        // 这里是闭包的函数体
    }
    */
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
