//
//  RegexString.swift
//  Extension
//
//  Created by WJF on 2019/3/5.
//  Copyright © 2019 wjf. All rights reserved.
//  常用正则库 

import UIKit

class RegexString: NSObject {

    /// 校验手机号
    ///
    /// - Parameter mobileNum: 手机号
    /// - Returns: ture false
    class func cin_isRegexMobileNum(mobileNum : String) -> Bool {
        /// 正则规则字符串
        let pattern = "^134[0-8]\\d{7}$|^13[^4]\\d{8}$|^14[5-9]\\d{8}$|^15[^4]\\d{8}$|^16[6]\\d{8}$|^17[0-8]\\d{8}$|^18[\\d]{9}$|^19[8,9]\\d{8}$"
        return cin_isBaseRegex(baseRegex: mobileNum, pattern: pattern)
    }
    
    
    /// 校验身份证
    ///
    /// - Parameter identityNum: 身份证
    /// - Returns: ture false
    class func cin_isIdentity(identityNum :String) -> Bool {
        if identityNum.count <= 14 {
            return false
        }
        let pattern = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        return cin_isBaseRegex(baseRegex: identityNum, pattern: pattern)
    }
    
    
    /// 校验数字
    ///
    /// - Parameter number: 数字
    /// - Returns: ture false
    class func cin_isNoPointNumber(number :String) -> Bool {
        
        let pattern = "^[0-9]*$"
        return cin_isBaseRegex(baseRegex: number, pattern: pattern)
        
    }
    
    
    /// 校验是否为数字和小数
    ///
    /// - Parameter number: 数字和小数
    /// - Returns: ture false
    class func cin_isNumber(number :String) -> Bool {
        
        let pattern = "^[0-9.]*$"
        return cin_isBaseRegex(baseRegex: number, pattern: pattern)
        
    }
    
    
    /// 校验最多俩位小数
    ///
    /// - Parameter number: 数字
    /// - Returns: ture false
    class func cin_isTwoPointNumber(number :String) -> Bool {
        
        let pattern = ""   //"^(([1-9]+)|([0-9]+\.[0-9]{1,2}))$"
        return cin_isBaseRegex(baseRegex: number, pattern: pattern)
        
    }
    
    
    /// 校验用户名（6-16位数字和字母或_-符号*）
    ///
    /// - Parameter userName: 用户名
    /// - Returns: ture false
    class func cin_isUserName(userName :String) -> Bool {
        
        let pattern = "^[A-Za-z0-9-_/]{6,16}+$"
        return cin_isBaseRegex(baseRegex: userName, pattern: pattern)
    }
    
    
    /// 校验中文名
    ///
    /// - Parameter userName: 中文名
    /// - Returns: ture false
    class func cin_isChineseName(userName :String) -> Bool {
        
        let pattern = "" //"^[\u4e00-\u9fa5]{2,4}$"
        return cin_isBaseRegex(baseRegex: userName, pattern: pattern)
    }
    
    
    /// 校验密码（6-20位数字和字母组合）
    ///
    /// - Parameter password: 密码
    /// - Returns: ture false
    class func cin_isPasswordSix_Twenty(password :String) -> Bool {
        
        let pattern = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}+$"
        return cin_isBaseRegex(baseRegex: password, pattern: pattern)
    }
    
    
    /// 校验密码（6-30位数字或字母或特殊字符组合）
    ///
    /// - Parameter password: 密码
    /// - Returns: ture false
    class func cin_isPasswordSix_Thirty(password :String) -> Bool {
        
        let pattern = "^[A-Za-z0-9@&+-_/=]{6,30}+$"
        return cin_isBaseRegex(baseRegex: password, pattern: pattern)
    }
    
    
    
    /// 通用的正则（baseRegex ： 目标，pattern ：正则条件）
    class  func cin_isBaseRegex(baseRegex : String,pattern : String) -> Bool {
        /// 正则规则
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        /// 进行正则匹配
        if let results = regex?.matches(in: baseRegex, options: [], range: NSRange(location: 0, length: baseRegex.count)), results.count != 0 {
            print("匹配成功")
            for result in results{
                let string = (baseRegex as NSString).substring(with: result.range)
                print("对应帐号:",string)
            }
            return true
        }
        return false
    }
}
