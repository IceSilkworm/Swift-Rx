//
//  Construction_05.swift
//  练习
//
//  Created by hudun on 2017/8/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Construction_05: NSObject {

    //MARK: - “构造失败的传递”
    
    //“类，结构体，枚举的可失败构造器可以横向代理到类型中的其他可失败构造器。类似的，子类的可失败构造器也能向上代理到父类的可失败构造器。无论是向上代理还是横向代理，如果你代理到的其他可失败构造器触发构造失败，整个构造过程将立即终止，接下来的任何构造代码不会再被执行。”
    
    //“注意
    //可失败构造器也可以代理到其它的非可失败构造器。通过这种方式，你可以增加一个可能的失败状态到现有的构造过程中。”
    

    

    func run() -> () {
        
        
        
        if let twoSocks = CartItem(name: "sock", quantity: 2) {

            print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
        }
        // 打印 "Item: sock, quantity: 2”
    
        if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
        
            print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
        } else {
    
            print("Unable to initialize zero shirts")
        }
        // 打印 "Unable to initialize zero shirts”
    
        if let oneUnnamed = CartItem(name: "", quantity: 1) {
        
            print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
        } else {
    
            print("Unable to initialize one unnamed product")
        }
        // 打印 "Unable to initialize one unnamed product”
        
        
    }
}

//“下面这个例子，定义了一个名为CartItem的Product类的子类。这个类建立了一个在线购物车中的物品的模型，它有一个名为quantity的常量存储型属性，并确保该属性的值至少为1：”
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

//MARK: -“重写一个可失败构造器”

//“如同其它的构造器，你可以在子类中重写父类的可失败构造器。或者你也可以用子类的非可失败构造器重写一个父类的可失败构造器。这使你可以定义一个不会构造失败的子类，即使父类的构造器允许构造失败。

//注意，当你用子类的非可失败构造器重写父类的可失败构造器时，向上代理到父类的可失败构造器的唯一方式是对父类的可失败构造器的返回值进行强制解包。

//注意
//你可以用非可失败构造器重写可失败构造器，但反过来却不行。


//“下例定义了一个名为Document的类，name属性的值必须为一个非空字符串或nil，但不能是一个空字符串：”

class Document {
    var name: String?
    // 该构造器创建了一个 name 属性的值为 nil 的 document 实例
    init() {}
    // 该构造器创建了一个 name 属性的值为非空字符串的 document 实例
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}

//“这个子类重写了父类的两个指定构造器，确保了无论是使用init()构造器，还是使用init(name:)构造器并为参数传递空字符串，生成的实例中的name属性总有初始"[Untitled]"：”

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

//“AutomaticallyNamedDocument用一个非可失败构造器init(name:)重写了父类的可失败构造器init?(name:)。因为子类用另一种方式处理了空字符串的情况，所以不再需要一个可失败构造器，因此子类用一个非可失败构造器代替了父类的可失败构造器。”

//“你可以在子类的非可失败构造器中使用强制解包来调用父类的可失败构造器。比如，下面的UntitledDocument子类的name属性的值总是"[Untitled]"，它在构造过程中使用了父类的可失败构造器init?(name:)：”
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

//“在这个例子中，如果在调用父类的可失败构造器init?(name:)时传入的是空字符串，那么强制解包操作会引发运行时错误。不过，因为这里是通过非空的字符串常量来调用它，所以并不会发生运行时错误。”






//MARK: -“可失败构造器 init!

//通常来说我们通过在init关键字后添加问号的方式（init?）来定义一个可失败构造器，但你也可以通过在init后面添加惊叹号的方式来定义一个可失败构造器（init!），该可失败构造器将会构建一个对应类型的隐式解包可选类型的对象。

//你可以在init?中代理到init!，反之亦然。你也可以用init?重写init!，反之亦然。你还可以用init代理到init!，不过，一旦init!构造失败，则会触发一个断言。”



