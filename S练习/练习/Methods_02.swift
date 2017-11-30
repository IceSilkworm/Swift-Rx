//
//  Methods_02.swift
//  练习
//
//  Created by hudun on 2017/8/17.
//  Copyright © 2017年 hudun. All rights reserved.
//

import Foundation
class Methods_02 {
    
    
    //MARK: - 类型方法
    
    //“实例方法是被某个类型的实例调用的方法。你也可以定义在类型本身上调用的方法，这种方法就叫做类型方法。在方法的func关键字之前加上关键字static，来指定类型方法。类还可以用关键字class来允许子类重写父类的方法实现。”
    
    //“注意
    //在 Objective-C 中，你只能为 Objective-C 的类类型（classes）定义类型方法（type-level methods）。在 Swift 中，你可以为所有的类、结构体和枚举定义类型方法。每一个类型方法都被它所支持的类型显式包含。”
    
    
    
    func run() {
        
        TestSomeClass.someTypeMethod()

    }
}

class  TestSomeClass{
    class func someTypeMethod() {
        // 在这里实现类型方法
        
        //“在类型方法的方法体（body）中，self指向这个类型本身，而不是类型的某个实例。这意味着你可以用self来消除类型属性和类型方法参数之间的歧义（类似于我们在前面处理实例属性和实例方法参数时做的那样）。
        
        //一般来说，在类型方法的方法体中，任何未限定的方法和属性名称，可以“被本类中其他的类型方法和类型属性引用。一个类型方法可以直接通过类型方法的名称调用本类中的其它类型方法，而无需在方法名称前面加上类型名称。类似地，在结构体和枚举中，也能够直接通过类型属性的名称访问本类中的类型属性，而不需要前面加上类型名称。
        
        //下面的例子定义了一个名为LevelTracker结构体。它监测玩家的游戏发展情况（游戏的不同层次或阶段）。这是一个单人游戏，但也可以存储多个玩家在同一设备上的游戏信息。
        
        //游戏初始时，所有的游戏等级（除了等级 1）都被锁定。每次有玩家完成一个等级，这个等级就对这个设备上的所有玩家解锁。LevelTracker结构体用类型属性和方法监测游戏的哪个等级已经被解锁。它还监测每个玩家的当前等级。”
        
        
        
        
        //你还可以为一个新的玩家创建一个Player的实例，然后看这个玩家完成等级一时发生了什么：”

        var player = Player(name: "Argyrios")
        player.complete(level: 1)
        print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
        // 打印 "highest unlocked level is now 2”
        
        
        
        //“如果你创建了第二个玩家，并尝试让他开始一个没有被任何玩家解锁的等级，那么试图设置玩家当前等级将会失败”
        player = Player(name: "Beto")
        if player.tracker.advance(to: 6) {
            print("player is now on level 6")
        } else {
            print("level 6 has not yet been unlocked")
        }
        // 打印 "level 6 has not yet been unlocked"
        
    }
}

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
            
        } else {
            return false
        }
    }
}

//“LevelTracker监测玩家已解锁的最高等级。这个值被存储在类型属性highestUnlockedLevel中。”

/*
 “LevelTracker还定义了两个类型方法与highestUnlockedLevel配合工作。第一个类型方法是unlock(_:)，一旦新等级被解锁，它会更新highestUnlockedLevel的值。第二个类型方法是isUnlocked(_:)，如果某个给定的等级已经被解锁，它将返回true。（注意，尽管我们没有使用类似LevelTracker.highestUnlockedLevel的写法，这个类型方法还是能够访问类型属性highestUnlockedLevel）
 
 除了类型属性和类型方法，LevelTracker还监测每个玩家的进度。它用实例属性currentLevel来监测每个玩家当前的等级。
 
 为了便于管理currentLevel属性，LevelTracker定义了实例方法advance(to:)。这个方法会在更新currentLevel之前检查所请求的新等级是否已经解锁。advance(to:)方法返回布尔值以指示是否能够设置currentLevel。因为允许在调用advance(to:)时候忽略返回值，不会产生编译警告，所以函数被标注为@ discardableResult属性，更多关于属性信息，请参考属性章节。
 
 “下面，Player类使用LevelTracker来监测和更新每个玩家的发展进度：”
 */

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

//“Player类创建一个新的LevelTracker实例来监测这个用户的进度。它提供了complete(level:)方法，一旦玩家完成某个指定等级就调用它。这个方法为所有玩家解锁下一等级，并且将当前玩家的进度更新为下一等级。（我们忽略了advance(to:)返回的布尔值，因为之前调用LevelTracker.unlock(_:)时就知道了这个等级已经被解锁了）。


