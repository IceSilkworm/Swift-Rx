//
//  ReferenceCount_01.swift
//  练习
//
//  Created by hudun on 2017/9/20.
//  Copyright © 2017年 hudun. All rights reserved.
//

import Foundation

class ReferenceCount_01: NSObject {
    
    /*
     自动引用计数的工作机制
     
     当你每次创建一个类的新的实例的时候，ARC 会分配一块内存来储存该实例信息。内存中会包含实例的类型信息，以及这个实例所有相关的存储型属性的值。
     
     此外，当实例不再被使用时，ARC 释放实例所占用的内存，并让释放的内存能挪作他用。这确保了不再被使用的实例，不会一直占用内存空间。
     
     然而，当 ARC 收回和释放了正在被使用中的实例，该实例的属性和方法将不能再被访问和调用。实际上，如果你试图访问这个实例，你的应用程序很可能会崩溃。
     
     为了确保使用中的实例不会被销毁，ARC 会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。哪怕实例的引用数为1，ARC都不会销毁这个实例。
     
     为了使上述成为可能，无论你将实例赋值给属性、常量或变量，它们都会创建此实例的强引用。之所以称之为“强”引用，是因为它会将实例牢牢地保持住，只要强引用还在，实例是不允许被销毁的。”
     
     */
    
    
    //MARK: -“解决实例之间的循环强引用”
    /*
     “Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：弱引用（weak reference）和无主引用（unowned reference）。
     
     弱引用和无主引用允许循环引用中的一个实例引用而另外一个实例不保持强引用。这样实例能够互相引用而不产生循环强引用。
     
     当其他的实例有更短的生命周期时，使用弱引用，也就是说，当其他实例析构在先时。在上面公寓的例子中，很显然一个公寓在它的生命周期内会在某个时间段没有它的主人，所以一个弱引用就加在公寓类里面，避免循环引用。相比之下，当其他实例有相同的或者更长生命周期时，请使用无主引用。”
     

     
     “弱引用
     
     弱引用不会对其引用的实例保持强引用，因而不会阻止 ARC 销毁被引用的实例。这个特性阻止了引用变为循环强引用。声明属性或者变量时，在前面加上weak关键字表明这是一个弱引用。
     
     因为弱引用不会保持所引用的实例，即使引用存在，实例也有可能被销毁。因此，ARC 会在引用的实例被销毁后自动将其赋值为nil。并且因为弱引用可以允许它们的值在运行时被赋值为nil，所以它们会被定义为可选类型变量，而不是常量。
     
     你可以像其他可选值一样，检查弱引用的值是否存在，你将永远不会访问已销毁的实例的引用。”
     
     
     
     ///////////////////////////////////////////////////
     ///////////////////////////////////////////////////

     “注意
     当 ARC 设置弱引用为nil时，属性观察不会被触发。”
     
     */
    
    
    
    
    /*
     “无主引用
     
     和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用在其他实例有相同或者更长的生命周期时使用。你可以在声明属性或者变量时，在前面加上关键字unowned表示这是一个无主引用。
     
     无主引用通常都被期望拥有值。不过 ARC 无法在实例被销毁后将无主引用设为nil，因为非可选类型的变量不允许被赋值为nil。”
     
     
     ** 重要
     
     “使用无主引用，你必须确保引用始终指向一个未销毁的实例。
     如果你试图在实例被销毁后，访问该实例的无主引用，会触发运行时错误。”
     
     */
    func run() {
        
        var john: Reference_Person?
        var unit4A: Reference_Apartment?
        
        john = Reference_Person(name: "John Appleseed")
        unit4A = Reference_Apartment(unit: "4A")
        
        john!.apartment = unit4A
        unit4A!.tenant = john
        
        
        /*
         “注意
         在使用垃圾收集的系统里，弱指针有时用来实现简单的缓冲机制，因为没有强引用的对象只会在内存压力触发垃圾收集时才被销毁。但是在 ARC 中，一旦值的最后一个强引用被移除，就会被立即销毁，这导致弱引用并不适合上面的用途。”
         
         */
        
        var john1: Reference_Customer?
        john1 = Reference_Customer(name: "John Appleseed")
        john1!.card = Reference_CreditCard(number: 1234_5678_9012_3456, customer: john1!)
        
        john = nil
        // 打印 “John Appleseed is being deinitialized”
        // 打印 ”Card #1234567890123456 is being deinitialized”
        
        
        /*
         “注意
         上面的例子展示了如何使用安全的无主引用。对于需要禁用运行时的安全”
         
         “检查的情况（例如，出于性能方面的原因），Swift还提供了不安全的无主引用。与所有不安全的操作一样，你需要负责检查代码以确保其安全性。 你可以通过unowned(unsafe)来声明不安全无主引用。如果你试图在实例被销毁后，访问该实例的不安全无主引用，你的程序会尝试访问该实例之前所在的内存地址，这是一个不安全的操作。”
         
         */
        
        
        /*
         
         //MARK: - “无主引用以及隐式解析可选属性”
         

         “上面弱引用和无主引用的例子涵盖了两种常用的需要打破循环强引用的场景。
         
         Person和Apartment的例子展示了两个属性的值都允许为nil，并会潜在的产生循环强引用。这种场景最适合用弱引用来解决。
         
         Customer和CreditCard的例子展示了一个属性的值允许为nil，而另一个属性的值不允许为nil，这也可能会产生循环强引用。这种场景最适合通过无主引用来解决。
         
         然而，存在着第三种场景，在这种场景中，两个属性都必须有值，并且初始化完成后永远不会为nil。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解析可选属性。
         
         这使两个属性在初始化完成后能被直接访问（不需要可选展开），同时避免了循环引用。这一节将为你展示如何建立这种关系。
         
         “下面的例子定义了两个类，Country和City，每个类将另外一个类的实例保存为属性。在这个模型中，每个国家必须有首都，每个城市必须属于一个国家。为了实现这种关系，Country类拥有一个capitalCity属性，而City类有一个country属性：”
         
         
         */
        
        let country = Reference_Country(name: "Canada", capitalName: "Ottawa")
        print("\(country.name)'s capital city is called \(country.capitalCity.name)")
        // 打印 “Canada's capital city is called Ottawa”
        
        
        //在上面的例子中，使用隐式解析可选值意味着满足了类的构造函数的两个构造阶段的要求。capitalCity属性在初始化完成后，能像非可选值一样使用和存取，同时还避免了循环强引用。”
        
    }
}


class Reference_Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Reference_Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Reference_Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Reference_Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}



//“下面的例子定义了两个类，Customer和CreditCard，模拟了银行客户和客户的信用卡。这两个类中，每一个都将另外一个类的实例作为自身的属性。这种关系可能会造成循环强引用。”
//“由于信用卡总是关联着一个客户，因此将customer属性定义为无主引用，用以避免循环强引用：”

class Reference_Customer {
    let name: String
    var card: Reference_CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class Reference_CreditCard {
    let number: UInt64
    
    //“注意
    //CreditCard类的number属性被定义为UInt64类型而不是Int类型，以确保number属性的存储量在 32 位和 64 位系统上都能足够容纳 16 位的卡号。”
    

    unowned let customer: Reference_Customer
    init(number: UInt64, customer: Reference_Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}


/*
 “为了建立两个类的依赖关系，City的构造函数接受一个Country实例作为参数，并且将实例保存到country属性。
 
 Country的构造函数调用了City的构造函数。然而，只有Country的实例完全初始化后，Country的构造函数才能把self传给City的构造函数。在两段式构造过程中有具体描述。
 
 为了满足这种需求，通过在类型结尾处加上感叹号（City!）的方式，将Country的capitalCity属性声明为隐式解析可选类型的属性。这意味着像其他可选类型一样，capitalCity属性的默认值为nil，但是不需要展开它的值就能访问它。在隐式解析可选类型中有描述。
 
 “由于capitalCity默认值为nil，一旦Country的实例在构造函数中给name属性赋值后，整个初始化过程就完成了。这意味着一旦name属性被赋值后，Country的构造函数就能引用并传递隐式的self。Country的构造函” 数在赋值capitalCity时，就能将self作为参数传递给City的构造函数。
 
 以上的意义在于你可以通过一条语句同时创建Country和City的实例，而不产生循环强引用，并且capitalCity的属性能被直接访问，而不需要通过感叹号来展开它的可选值：”
 
 */
class Reference_Country {
    let name: String
    
    var capitalCity: Reference_City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = Reference_City(name: capitalName, country: self)
    }
}

class Reference_City {
    let name: String
    unowned let country: Reference_Country
    init(name: String, country: Reference_Country) {
        self.name = name
        self.country = country
    }
}

