//
//  Extension_02.swift
//  练习
//
//  Created by hudun on 2017/9/21.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class Extension_02: NSObject {

    
    //MARK: -构造器
    
    //“扩展可以为已有类型添加新的构造器。这可以让你扩展其它类型，将你自己的定制类型作为其构造器参数，或者提供该类型的原始实现中未提供的额外初始化选项。
    
    //扩展能为类添加新的便利构造器，但是它们不能为类添加新的指定构造器或析构器。指定构造器和析构器必须总是由原始的类实现来提供。”
    

    //“注意
    //如果你使用扩展为一个值类型添加构造器，同时该值类型的原始实现中未定义任何定制的构造器且所有存储属性提供了默认值，那么我们就可以在扩展中的构造器里调用默认构造器和逐一成员构造器。
    //正如在值类型的构造器代理中描述的，如果你把定制的构造器写在值类型的原始实现中，上述规则将不再适用。”
    

    func run() -> Void {
        
        //“因为结构体 ExtensionRect 未提供定制的构造器，因此它会获得一个逐一成员构造器。又因为它为所有存储型属性提供了默认值，它又会获得一个默认构造器。”
        
        let _ = ExtensionRect()
        let _ = ExtensionRect(origin: ExtensionPoint(x: 2.0, y: 2.0),
            size: ExtensionSize(width: 5.0, height: 5.0))
        
        
        //“这个新的构造器首先根据提供的 center 和 size 的值计算一个合适的原点。然后调用该结构体的逐一成员构造器 init(origin:size:)，该构造器将新的原点和大小的值保存到了相应的属性中：”
        
        let _ = ExtensionRect(center: ExtensionPoint(x: 4.0, y: 4.0),
                                 size: ExtensionSize(width: 3.0, height: 3.0))
        // centerRect 的原点是 (2.5, 2.5)，大小是 (3.0, 3.0)”
        
        
        //“注意
        //如果你使用扩展提供了一个新的构造器，你依旧有责任确保构造过程能够让实例完全初始化。”
        
        
        
        
    }
}

//“下面的例子定义了一个用于描述几何矩形的结构体 Rect。这个例子同时定义了两个辅助结构体 Size 和 Point，它们都把 0.0 作为所有属性的默认值：”

struct ExtensionSize {
    var width = 0.0, height = 0.0
}
struct ExtensionPoint {
    var x = 0.0, y = 0.0
}
struct ExtensionRect {
    var origin = ExtensionPoint()
    var size = ExtensionSize()
}

//“你可以提供一个额外的接受指定中心点和大小的构造器来扩展 Rect 结构体：”

extension ExtensionRect {
    init(center: ExtensionPoint, size: ExtensionSize) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: ExtensionPoint(x: originX, y: originY), size: size)
    }
}
