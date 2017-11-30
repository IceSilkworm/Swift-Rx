//
//  SetDemo.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class SetDemo: NSObject {

    func demo() -> Void {
        /*
         “集合(Set)用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。”
         
         集合类型的哈希值
         一个类型为了存储在集合中，该类型必须是可哈希化的--也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是Int类型的，相等的对象哈希值必须相同，比如a==b,因此必须a.hashValue == b.hashValue。
         
         Swift 的所有基本类型(比如String,Int,Double和Bool)默认都是可哈希化的，可以作为集合的值的类型或者字典的键的类型。没有关联值的枚举成员值(在枚举有讲述)默认也是可哈希化的。”
         */
        
        /*
         “注意：
         你可以使用你自定义的类型作为集合的值的类型或者是字典的键的类型，但你需要使你的自定义类型符合 Swift 标准库中的Hashable协议。符合Hashable协议的类型需要提供一个类型为Int的可读属性hashValue。由类型的hashValue属性返回的值不需要在同一程序的不同执行周期或者不同程序之间保持相同。
         
         因为Hashable协议符合Equatable协议，所以遵循该协议的类型也必须提供一个"是否相等"运算符(==)的实现。这个Equatable协议要求任何符合==实现的实例间都是一种相等的关系。也就是说，对于a,b,c三个值来说，==的实现必须满足下面三种情况：
         
         a == a(自反性)
         a == b意味着b == a(对称性)
         a == b && b == c意味着a == c(传递性)”
         */
        
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.")
        // 打印 "letters is of type Set<Character> with 0 items.”
        letters.insert("a")
        // letters 现在含有1个 Character 类型的值”
        
        letters = []
        // letters 现在是一个空的 Set, 但是它依然是 Set<Character> 类型”
        let favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
        print(favoriteGenres)
        // favoriteGenres 被构造成含有三个初始值的集合”
        
        /*一个Set类型不能从数组字面量中被单独推断出来，因此Set类型必须显式声明。然而，由于 Swift 的类型推断功能，如果你想使用一个数组字面量构造一个Set并且该数组字面量中的所有元素类型相同，那么你无须写出Set的具体类型。favoriteGenres的构造形式可以采用简化的方式代替：
        */
        var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]
        //由于数组字面量中的所有元素类型相同，Swift 可以推断出Set<String>作为favoriteGenres1变量的正确类型。”
        print(favoriteGenres1)
        
        if let removedGenre = favoriteGenres1.remove("Rock") {
        
            print("\(removedGenre)? I'm over it.")
        }
        else {
            print("I never much cared for that.")
        }
        // 打印 "Rock? I'm over it.”
    
        
        favoriteGenres1.insert("Jazz")
        // favoriteGenres 现在包含4个元素”
        
        if favoriteGenres.contains("Funk") {
            print("I get up on the good foot.")
        } else {
            print("It's too funky in here.")
        }
        // 打印 "It's too funky in here.”
        for genre in favoriteGenres {
            print("\(genre)")
        }
        
        /*
         “Swift 的Set类型没有确定的顺序，为了按照特定顺序来遍历一个Set中的值可以使用sorted()方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定.”
         
         */
        for genre in favoriteGenres.sorted() {
            print("\(genre)")
        }
        // prints "Classical"
        // prints "Hip hop"
        // prints "Jazz”
        
        
        // MARK: - 集合操作
        
        /*
         使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合。
         使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
         使用union(_:)方法根据两个集合的值创建一个新的集合。
         使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合。”
         
         摘录来自: 极客学院. “The Swift Programming Language 中文版”。 iBooks.
         */
        
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
        
        let _ = oddDigits.union(evenDigits).sorted()
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]”
        let _ = oddDigits.intersection(evenDigits).sorted()
        // []
        let _ = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
        // [1, 9]
        let _ = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
        // [1, 2, 9]”
        
        
        // MARK: - 集合成员关系和相等
        /*
         使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
         使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。”
         使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
         使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
         使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。”
         
         */
        
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]
        
        let _ = houseAnimals.isSubset(of: farmAnimals)
        // true
        let _ = farmAnimals.isSuperset(of: houseAnimals)
        // true
        let _ = farmAnimals.isDisjoint(with: cityAnimals)
        // true”
    }
}
