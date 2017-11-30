//
//  Error_03.swift
//  练习
//
//  Created by hudun on 2017/9/20.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Error_03: NSObject {

    
    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels",
        ]
    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingMachine.vend(itemNamed: snackName)
    }
    
    //“上例中，buyFavoriteSnack(person:vendingMachine:)函数会查找某人最喜欢的零食，并通过调用vend(itemNamed:)方法来尝试为他们购买。因为vend(itemNamed:)方法能抛出错误，所以在调用的它时候在它前面加了try关键字。
    

    func run() {
        
        //“用 Do-Catch 处理错误”
        /*
        do {
            try expression
            statements
            
        } catch pattern 1 {
            statements
        } catch pattern 2 where condition {
            statements
        }
*/
        
        let vendingMachine = VendingMachine()
        vendingMachine.coinsDeposited = 8
        do {
            try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
            
            print("Alice run here")
            
        } catch VendingMachineError.invalidSelection {
            print("Invalid Selection.")
        } catch VendingMachineError.outOfStock {
            print("Out of Stock.")
        } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
            print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
        } catch {
            print(error.localizedDescription)
        }
        // 打印 “Insufficient funds. Please insert an additional 2 coins.”
        
        
        //“上面的例子中，buyFavoriteSnack(person:vendingMachine:)函数在一个try表达式中调用，因为它能抛出错误。如果错误被抛出，相应的执行会马上转移到catch子句中，并判断这个错误是否要被继续传递下去。如果没有错误抛出，do子句中余下的语句就会被执行。”
        
        
        
        //MARK: “将错误转换成可选值”
        
        
        //“可以使用try?通过将错误转换成一个可选值来处理错误。如果在评估try?表达式时一个错误被抛出，那么表达式的值就是nil。例如,在下面的代码中,x和y有着相同的数值和等价的含义：”
        

        func someThrowingFunction() throws -> Int {
            // ...
            
            return 1
        }
        
        let x = try? someThrowingFunction()
        
        let y: Int?
        do {
            y = try someThrowingFunction()
        } catch {
            y = nil
        }
        
        print(x, y)
        //“如果someThrowingFunction()抛出一个错误，x和y的值是nil。否则x和y的值就是该函数的返回值。注意，无论someThrowingFunction()的返回值类型是什么类型，x和y都是这个类型的可选类型。例子中此函数返回一个整型，所以x和y是可选整型。”
        
        
        //“如果你想对所有的错误都采用同样的方式来处理，用try?就可以让你写出简洁的错误处理代码。例如，下面的代码用几种方式来获取数据，如果所有方式都失败了则返回nil：
        /*
        func fetchData() -> Data? {
            if let data = try? fetchDataFromDisk() { return data }
            if let data = try? fetchDataFromServer() { return data }
            return nil
        }
    
         
         
         “禁用错误传递
         
         有时你知道某个throwing函数实际上在运行时是不会抛出错误的，在这种情况下，你可以在表达式前面写try!来禁用错误传递，这会把调用包装在一个不会有错误抛出的运行时断言中。如果真的抛出了错误，你会得到一个运行时错误。
         
         例如，下面的代码使用了loadImage(atPath:)函数，该函数从给定的路径加载图片资源，如果图片无法载入则抛出一个错误。在这种情况下，因为图片是和应用绑定的，运行时不会有错误抛出，所以适合禁用错误传递：
         
         let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")”
         

         */
        
        
        
        //MARK: - 指定清理操作
        
        //“可以使用defer语句在即将离开当前代码块时执行一系列语句。该语句让你能执行一些必要的清理工作，不管是以何种方式离开当前代码块的——无论是由于抛出错误而离开，还是由于诸如return或者break的语句。例如，你可以用defer语句来确保文件描述符得以关闭，以及手动分配的内存得以释放。”
        
        //“defer语句将代码的执行延迟到当前的作用域退出之前。该语句由defer关键字和要被延迟执行的语句组成。延迟执行的语句不能包含任何控制转移语句，例如break或是return语句，或是抛出一个错误。延迟执行的操作会按照它们被指定时的顺序的相反顺序执行——也就是说，第一条defer语句中的代码会在第二条defer语句中的代码被执行之后才执行，以此类推。”
        
        func processFile(filename: String) throws {
            /*
            FileManager.default.fileExists(atPath: <#T##String#>)
            if exists(filename) {
                let file = open(filename)
                defer {
                    close(file)
                }
                while let line = try file.readline() {
                    // 处理文件。
                }
                // close(file) 会在这里被调用，即作用域的最后。
            }
 */
        }
        
        //“上面的代码使用一条defer语句来确保open(_:)函数有一个相应的对close(_:)函数的调用。
        
        //注意
        //即使没有涉及到错误处理，你也可以使用defer语句。”
        
    }
}


//throwing构造器能像throwing函数一样传递错误.例如下面代码中的PurchasedSnack构造器在构造过程中调用了throwing函数,并且通过传递到它的调用者来处理这些错误。”

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

//“下面的例子中，VendingMechine类有一个vend(itemNamed:)方法，如果请求的物品不存在、缺货或者投入金额小于物品价格，该方法就会抛出一个相应的VendingMachineError：”

struct ErrorItem {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": ErrorItem(price: 12, count: 7),
        "Chips": ErrorItem(price: 10, count: 4),
        "Pretzels": ErrorItem(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    
    //“在vend(itemNamed:)方法的实现中使用了guard语句来提前退出方法，确保在购买某个物品所需的条件中，有任一条件不满足时，能提前退出方法并抛出相应的错误。由于throw语句会立即退出方法，所以物品只有在所有条件都满足时才会被售出。
    
    //因为vend(itemNamed:)方法会传递出它抛出的任何错误，在你的代码中调用此方法的地方，必须要么直接处理这些错误——使用do-catch语句，try?或try!；要么继续将这些错误传递下去。例如下面例子中，buyFavoriteSnack(_:vendingMachine:)同样是一个 throwing 函数，任何由vend(itemNamed:)方法抛出的错误会一直被传递到buyFavoriteSnack(person:vendingMachine:)函数被调用的地方。”
    

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}
