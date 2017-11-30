//
//  Person.swift
//  练习
//
//  Created by hudun on 2017/8/10.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    //let 不可变， 线程安全的
    static let person: Person = Person()
    
    //默认值是 nil ， 没有分配空间， 运行时临时分配内存空间
    
    var name: String?
    
    var age: Int = 0
    
    override init() {
        super.init()
    }
    
    init(name: String, age: Int){
        //当属姓名与参数名相同时，  需要加上 self 区分
        self.name = name
        self.age = age
        super.init()
    }
    
    //KVC 构造
    init(dic: [String: AnyObject]){
        super.init()
        setValuesForKeys(dic)  //消息转发给 setValue forkey
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        //forKey  外部参数 ，key 内部参数，函数内部使用 内部参数
        print("forKey" , key, value as Any)
        
        super.setValue(value, forKey: key)
    }
    
    // "play"
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //起了 过滤掉 不存在的属性  对应的 key
        print(key, value as Any)
    }
}
