//
//  Error_01.swift
//  练习
//
//  Created by hudun on 2017/8/14.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Error_01: NSObject {
    
    // MARK: -  使用采用 Error 协议的类型来表示错误。
    enum PrinterError: Error {
        case OutOfPaper
        case NoToner
        case OnFire
    }
    
    //使用 throw 来抛出一个错误并使用 throws 来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函 数会立刻返回并且调用该函数的代码会进行错误处理。
    func send(job: Int, toPrinter printerName: String) throws -> String {
        if printerName == "Never Has Toner" {
            throw PrinterError.NoToner
        }
        return "Job sent"
    }
    
    
    //使用 defer 代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执 行。使用 defer ，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执 行时机截然不同。
    var fridgeIsOpen = false
    let fridgeContent = ["milk", "eggs", "leftovers"]
    func fridgeContains(_ food: String) -> Bool {
        fridgeIsOpen = true
        defer {
            fridgeIsOpen = false
        }
        let result = fridgeContent.contains(food)
        return result
    }
    
    func run () -> () {
        
        //有多种方式可以用来进行错误处理。一种方式是使用 do-catch 。在 do 代码块中，使用 try 来标记可以抛出错误 的代码。在 catch 代码块中，除非你另外命名，否则错误会自动命名为 error 。
        do {
            let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
            print(printerResponse)
            
        } catch {
            print(error)
        }
        //可以使用多个 catch 块来处理特定的错误。参照 switch 中的 case 风格来写 catch 。
        do {
            let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
            print(printerResponse)
        } catch PrinterError.OnFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch let printerError as PrinterError {
            print("Printer error: \(printerError).")
        } catch {
            print(error)
        }
        
        //另一种处理错误的方式使用 try? 将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为 nil 。否则的话，结果会是一个包含函数返回值的可选值。
        let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
        let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
        
        print(printerSuccess!, printerFailure ?? "Error")
        
        
        let _ = fridgeContains("banana")
        print(fridgeIsOpen)
    }
}
