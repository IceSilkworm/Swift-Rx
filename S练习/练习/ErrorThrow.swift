//
//  ErrorThrow.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class ErrorThrow: NSObject {

    func demo() -> Void {
        
        /*
         “你可以使用 错误处理（error handling） 来应对程序执行中可能会遇到的错误条件。
         
         相对于可选中运用值的存在与缺失来表达函数的成功与失败，错误处理可以推断失败的原因，并传播至程序的其他部分。
         
         当一个函数遇到错误条件，它能报错。调用函数的地方能抛出错误消息并合理处理。
         
         func canThrowAnError() throws {
         // 这个函数有可能抛出错误
         }
         一个函数可以通过在声明中添加throws关键词来抛出错误消息。当你的函数能抛出错误消息时, 你应该在表达式中前置try关键词。
         
         do {
             try canThrowAnError()
             // 没有错误消息抛出
         } catch {
             // 有一个错误消息抛出
         }
         一个do语句创建了一个新的包含作用域,使得错误能被传播到一个或多个catch从句。”
         
         */
        
        /*
         “在此例中，makeASandwich()（做一个三明治）函数会抛出一个错误消息如果没有干净的盘子或者某个原料缺失。因为 makeASandwich() 抛出错误，函数调用被包裹在 try 表达式中。将函数包裹在一个 do 语句中，任何被抛出的错误会被传播到提供的 catch 从句中。
         
         如果没有错误被抛出，eatASandwich() 函数会被调用。如果一个匹配 SandwichError.outOfCleanDishes 的错误被抛出，washDishes() 函数会被调用。如果一个匹配 SandwichError.missingIngredients 的错误被抛”
         
         “出，buyGroceries(_:) 函数会被调用，并且使用 catch 所捕捉到的关联值 [String] 作为参数”
         
         */
        func makeASandwich() throws {
            // ...
        }
        do {
            try makeASandwich()
//            eatASandwich()
        }catch {
            
        }
//        catch SandwichError.outOfCleanDishes {
//            washDishes()
//        }
//        catch SandwichError.missingIngredients(let ingredients) {
//            buyGroceries(ingredients)
//        }
        
        let age = -3
        assert(age >= 0, "A person's age cannot be less than zero")
        // 因为 age < 0，所以断言会触发”
        
    }
}
