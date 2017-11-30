//
//  ViewController.swift
//  练习
//
//  Created by hudun on 2017/8/9.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //特殊的闭包
    lazy var nameLable: UILabel = { //() -> UILabel in
        
        print("我懒吗")
        let lable = UILabel()
        lable.textAlignment = .center
        return lable
        
    }() //小括号 表示执行闭包
    
    //懒加载  只会被调用一次
    func lazyRun() -> () {
        
        //        print(nameLable)
        //        print(nameLable)
        //        print(nameLable)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
        let textView: UITextView = UITextView(frame: CGRect(x: 100, y: 100, width: 200, height: 300))
        
        self.view.addSubview(textView)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //检测API 可用性
        if #available(iOS 10, macOS 10.12, *) {
            // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
        } else {
            // 使用先前版本的 iOS 和 macOS 的 API
        }
        
        if #available(iOS 10, macOS 10.12, *) {
            
        }
        
//        if #available(platform name version, ..., *) {
//            APIs 可用，语句将执行
//        } else {
//            APIs 不可用，语句将不执行
//        }
        
        
        // MARK: - KVO监测
        
//        let p = Person(dic: ["name":"Ring" as AnyObject,
//                             "age": 33 as AnyObject,
//                             "play": "box" as AnyObject])
//
//        textView.text = p.name! + String(p.age)
//        textView.text = (p.name ?? "null") + String(p.age)
        
        
//        lazyRun()
        
        let variable = Generics_04()
        
        
        //运行
        variable.run()
        
    }
    

   
}

