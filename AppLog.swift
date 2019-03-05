//
//  AppLog.swift
//  SLM
//
//  Created by Pakho Yeung on 16/10/2018.
//  Copyright © 2018 Pakho Yeung. All rights reserved.
//

import Foundation

class AppLog {
    
    enum LogType {
        case info
        case warning
        case error
    }
    
    static var userIdentity: String?
    static var debugServiceProvider: DebugServiceProvider?
    
    static func start() {
        debugServiceProvider = FabricServiceProvider()
        debugServiceProvider?.start()
    }
    
    static func log(type: LogType,
                    err: String,
                    file:String = #file,
                    function:String = #function,
                    line:Int = #line){
        var icon: String
        switch type {
        case .info:
            icon = "📝"
        case .warning:
            icon = "⚠️"
        case .error:
            icon = "🚫"
        }
        let errSource: String = URL(string: file)!.lastPathComponent + " \(function) \(line)"
        
        debugServiceProvider?.log(icon + errSource + err)
    }
    
    static func setUserIdentity(_ userIdentity: String) {
        AppLog.userIdentity = userIdentity
    }
    
    static func err(domain: String,
                    code: Int,
                    userInfo: [String: Any]?,
                    file:String = #file,
                    function:String = #function,
                    line:Int = #line) {
        var _userInfo: [String: Any]? = userInfo
        let icon: String = "🚫"
        let errSource: String = URL(string: file)!.lastPathComponent + " \(function) \(line)"
        _userInfo?["from"] = icon + errSource
        
        let error = NSError(domain: domain, code: code, userInfo: _userInfo)
        debugServiceProvider?.error(error)
    }
    
    static func forceCrash() {
        debugServiceProvider?.forceCrash()
    }
    
    private init() {}
}
