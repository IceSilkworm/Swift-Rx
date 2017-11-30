//
//  AppDelegate.swift
//  练习
//
//  Created by hudun on 2017/8/9.
//  Copyright © 2017年 hudun. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func run() {
        
        //判断字符串是否为空
        var a = " "
        let c = ""
        _ = a.isEmpty   //false
        _ = c.isEmpty   //true
        
        //字符计数
        a = "abcdef"
        _ = a.characters.count  //6 //字符串索引
        _ = a.startIndex    //0
        _ = a.endIndex  //6,最后一个字符串的下一个位置
        //: - 用字符串的字符数组的index(after:Index)或index(before:Index)引用Index后一个或前一个索引
        _ = a[a.characters.index(after: a.startIndex)]  //b
        _ = a[a.characters.index(before: a.endIndex)]   //f
        //Get characters Index //索引3的元素
        let index = a.index(a.startIndex,offsetBy:3)    //起始位置，偏移位
        _ = index   //3
        _ = type(of:index)  //String.CharacterView.Index.Type //确定index1的值是安全的
        let index1 = a.index(a.startIndex,offsetBy:3, limitedBy:a.endIndex) //起始位置，偏移位，最后一个字符串的下一个位置
        _ = type(of:index1) //Optional<String.CharacterView.Index>.Type
        _ = a[index]    //d
        _ = a[index1!]  //d //a[index1] //错误
        
        
        //插入字符串
        var Str = "Swift很有趣"
        
        _ = Str.characters.count    //8
        
        //在开头插入一个字符，注意是字符不是字符串
        Str.insert("@", at: Str.startIndex) //"@Swift很有趣"
        //在末位插入一个字符
        Str.insert("!", at: Str.endIndex)   //"@Swift很有趣!"
        //在指定位置插入一个字符
        Str.insert("~", at: Str.index(Str.startIndex, offsetBy: 9)) //"@Swift很有趣~!"
        
        //在开头字符的后面插入一个字符串
        Str.insert(contentsOf:"YY".characters, at: Str.index(after: Str.startIndex))    //"@YYSwift很有趣~!"
        //在结尾字符的前面插入一个字符串
        Str.insert(contentsOf:"MM".characters, at: Str.index(before: Str.endIndex)) //"@YYSwift很有趣~!"
        //在指定位置插入一个字符串
        var p_str1 = "interesting"
        Str.insert(contentsOf:p_str1.characters, at: Str.startIndex)    //"interesting@YYSwift很有趣~MM!"
        
        //在指定位置插入一组字符
        Str.insert(contentsOf: ["~","~","~"], at: Str.index(Str.startIndex, offsetBy: 12))  //"interesting@~~~YYSwift很有趣~MM!"
        
        
        //1.7.1 通过索引截取字符串
        Str = "Swift很有趣"
        //截取字符串
        _ = String(Str.characters.prefix(3))  //prefix：返回一个序列，从开头截取指定的最大长度。//Swi
        
        _ = String(Str.characters.suffix(3))  //suffix：返回一个序列，从末尾截取指定的最大长度。//很有趣
        
        //如果最大长度超过集合中元素的数目，则结果包含集合中的所有元素
        _ = String(Str.characters.prefix(10))//Swift很有趣
        _ = String(Str.characters.suffix(10))//Swift很有趣
        
        _ = Str.endIndex    //8
        let i = Str.index(Str.startIndex, offsetBy: 4)  //offsetBy:最大为endIndex //4
        let j = Str.index(Str.startIndex, offsetBy: 6)  //6
        
        _ = Str[i]  //t
        _ = Str.substring(to: i) //substring(to:)：从开头截取到指定的索引，不包含索引所在元素。//Swif
        _ = Str.substring(from: i) //substring(from:)：从指定的索引开始截取到末尾，包含索引所在元素。//t很有趣
        _ = Str.substring(with: i..<j)   //substring(with:)：包含指定的索引区间 //t很
        
        //通过指定字符串截取子串
        let range1 = Str.range(of: "wi")
        let range2 = Str.range(of: "有")
        _ = Str.substring(from: (range1?.upperBound)!)
        _ = Str.substring(with: (range1?.upperBound)!..<(range2?.lowerBound)!)
        
        
        //通过指定字符串截取子串
        Str = "Swift很有趣很有趣"
        _ = Str.characters.count    //11
        // 正向检索,从前到后找到第一个 "很" 字符的range
        var range = Str.range(of: "很")  //5~6
        
        //反向检索
        //options: 用来指定一个选项标记（这个标记可以作为搜索的条件）, .backwards:反向检索
        range = Str.range(of: "趣", options: .backwards) //10~11
        
        
        range = Str.range(of: "趣", options: .backwards, range: nil, locale: nil)    //10~11
        range = Str.range(of: "趣", options: .backwards) //10~11
        range = Str.range(of: "很有趣很有趣") //5~11
        //range: 设置搜索的范围
        //locale: 可以语言环境
        _ = Locale.current    //?
        _ = Str.range(of: "趣", range: range, locale: nil)  //7~8
        _ = Str.range(of: "S", range: range, locale: nil)   //在搜索的范围内没有找到则 返回nil
        
        _ = Str.substring(from: (range?.upperBound)!)    //""
        _ = Str.substring(to: (range?.lowerBound)!)  //"Swift"
        let range3 = 17...23
        _ = range3.lowerBound   //17
        _ = range?.upperBound   //11
        _ = type(of:range)  //Optional<Range<String.CharacterView.Index>>.Type
        _ = type(of:range1) //CountableClosedRange<Int>.Type
        
        //CountableClosedRange：可数的闭区间
        //CountableRange：可数的开区间
        //ClosedRange：不可数的闭区间
        //Range：不可数的开居间
        
        //这里的range类型要是 Range<Swift.Index> 而不能是 Range<Int>
        _ = Str.substring(with: (range?.lowerBound)!..<(range2?.upperBound)!)    //很有趣
    }

}

