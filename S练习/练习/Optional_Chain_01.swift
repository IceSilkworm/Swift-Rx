//
//  Optional_Chain_01.swift
//  练习
//
//  Created by hudun on 2017/9/20.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Optional_Chain_01: NSObject {

    //MARK: - 可选链式调用
    
    //“可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功；如果可选值是nil，那么调用将返回nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil。”
    
    //“注意
    //Swift 的可选链式调用和 Objective-C 中向nil发送消息有些相像，但是 Swift 的可选链式调用可以应用于任意类型，并且能检查调用是否成功。”
    

    func run() -> () {
        
        //“通过在想调用的属性、方法、或下标的可选值后面放一个问号（?），可以定义一个可选链。这一点很像在可选值后面放一个叹号（!）来强制展开它的值。它们的主要区别在于当可选值为空时可选链式调用只会调用失败，然而强制展开将会触发运行时错误。”
        //“为了反映可选链式调用可以在空值（nil）上调用的事实，不论这个调用的属性、方法及下标返回的值是不是可选值，它的返回结果都是一个可选值。你可以利用这个返回值来判断你的可选链式调用是否调用成功，如果调用有返回值则说明调用成功，返回nil则说明调用失败。”
        
        let john = OptionalPerson()
        
        //let roomCount = john.residence!.numberOfRooms
        // 这会引发运行时错误”
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // 打印 “Unable to retrieve the number of rooms.”
        
        
        john.residence = OptionalResidence()
        
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // 打印 “John's residence has 1 room(s).”
        
        
        
        //MARK: - “为可选链式调用定义模型类”
        john.residence = nil
        
        let someAddress = OptionalAddress()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"
        john.residence?.address = someAddress
        
        
        john.residence = nil
        func createAddress() -> OptionalAddress {
            print("Function was called.")
            
            let someAddress = OptionalAddress()
            someAddress.buildingNumber = "29"
            someAddress.street = "Acacia Road"
            
            return someAddress
        }
        john.residence?.address = createAddress()
        
        
        //可选链， 调用方法
        if john.residence?.printNumberOfRooms() != nil {
            print("It was possible to print the number of rooms.")
        } else {
            print("It was not possible to print the number of rooms.")
        }
        // 打印 “It was not possible to print the number of rooms.”
        
        
        //“同样的，可以据此判断通过可选链式调用为属性赋值是否成功。在上面的通过可选链式调用访问属性的例子中，我们尝试给john.residence中的address属性赋值，即使residence为nil。通过可选链式调用给属性赋值会返回Void?，通过判断返回值是否为nil就可以知道赋值是否成功：”
        
        if (john.residence?.address = someAddress) != nil {
            print("It was possible to set the address.")
        } else {
            print("It was not possible to set the address.")
        }
        // 打印 “It was not possible to set the address.”
        
        
        
        //MARK: - “通过可选链式调用访问下标”
        
        //“通过可选链式调用，我们可以在一个可选值上访问下标，并且判断下标调用是否成功。
        
        //注意
        //通过可选链式调用访问可选值的下标时，应该将问号放在下标方括号的前面而不是后面。可选链式调用的问号一般直接跟在可选表达式的后面。”
        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
        // 打印 “Unable to retrieve the first room name.”
        
        john.residence?[0] = OptionalRoom(name: "Bathroom")
        //这次赋值同样会失败，因为residence目前是nil。”
        
        
        
        let johnsHouse = OptionalResidence()
        johnsHouse.rooms.append(OptionalRoom(name: "Living Room"))
        johnsHouse.rooms.append(OptionalRoom(name: "Kitchen"))
        john.residence = johnsHouse
        
        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
        // 打印 “The first room name is Living Room.”
        
        
        
        //MARK: - “访问可选类型的下标”
        
        //如“ Swift 中Dictionary类型的键的下标，可以在下标的结尾括号后面放一个问号来在其可选返回值上进行可选链式调用：”
        var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
        testScores["Dave"]?[0] = 91
        testScores["Bev"]?[0] += 1
        testScores["Brian"]?[0] = 72
        // "Dave" 数组现在是 [91, 82, 84]，"Bev" 数组现在是 [80, 94, 81]”
        
        
        //“上面的例子中定义了一个testScores数组，包含了两个键值对，把String类型的键映射到一个Int值的数组。这个例子用可选链式调用把"Dave"数组中第一个元素设为91，把"Bev"数组的第一个元素+1，然后尝试把"Brian"数组中的第一个元素设为72。前两个调用成功，因为testScores字典中包含"Dave"和"Bev"这两个键。但是testScores字典中没有"Brian"这个键，所以第三个调用失败。”
        
        
        //MARK: - “连接多层可选链式调用”
        /*
        “可以通过连接多个可选链式调用在更深的模型层级中访问属性、方法以及下标。然而，多层可选链式调用不会增加返回值的可选层级。
        
        也就是说：
        
        如果你访问的值不是可选的，可选链式调用将会返回可选值。
        如果你访问的值就是可选的，可选链式调用不会让可选返回值变得“更可选”。
        因此：
        
        通过可选链式调用访问一个Int值，将会返回Int?，无论使用了多少层可选链式调用。
        类似的，通过可选链式调用访问Int?值，依旧会返回Int?值，并不会返回Int??。
        下面的例子尝试访问john中的residence属性中的address属性中的street属性。这里使用了两层可选链式调用，residence以及address都是可选值：”
        */
        
        
        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
        // 打印 “Unable to retrieve the address.”
        
        
        let johnsAddress = OptionalAddress()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence?.address = johnsAddress
        
        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
        // 打印 “John's street name is Laurel Street.”
        
        
        
        
        
        //MARK: - “在方法的可选返回值上进行可选链式调用”
        
        //“在下面的例子中，通过可选链式调用来调用Address的buildingIdentifier()方法。这个方法返回String?类型的值。如上所述，通过可选链式调用来调用该方法，最终的返回值依旧会是String?类型：”
        
        if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
            print("John's building identifier is \(buildingIdentifier).")
        }
        // 打印 “John's building identifier is The Larches.”
        
        
        //“如果要在该方法的返回值上进行可选链式调用，在方法的圆括号后面加上问号即可”
        
        if let beginsWithThe =
            john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
            if beginsWithThe {
                print("John's building identifier begins with \"The\".")
            } else {
                print("John's building identifier does not begin with \"The\".")
            }
        }
        // 打印 “John's building identifier begins with "The".”
        
        //“注意
        //在上面的例子中，在方法的圆括号后面加上问号是因为你要在buildingIdentifier()方法的可选返回值上进行可选链式调用，而不是方法本身。”
        

    }
}

class OptionalPerson {
    var residence: OptionalResidence?
}

class OptionalResidence {
    var rooms = [OptionalRoom]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> OptionalRoom {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    //“这个方法没有返回值。然而，没有返回值的方法具有隐式的返回类型Void，如无返回值函数中所述。这意味着没有返回值的方法也会返回()，或者说空的元组。
    
    //如果在可选值上通过可选链式调用来调用这个方法，该方法的返回类型会是Void?，而不是Void，因为通过可选链式调用得到的返回值都是可选的。这样我们就可以使用if语句来判断能否成功调用printNumberOfRooms()方法，即使方法本身没有定义返回值。通过判断返回值是否为nil可以判断调用是否成功：”
    
    
    var address: OptionalAddress?
    
}

class OptionalRoom {
    let name: String
    init(name: String) { self.name = name }
}

class OptionalAddress {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber!) \(street!)"
        } else {
            return nil
        }
    }
}
