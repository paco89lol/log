//
//  DebugServiceProvider.swift
//  SLM
//
//  Created by Pakho Yeung on 16/10/2018.
//  Copyright © 2018 Pakho Yeung. All rights reserved.
//

import Foundation

class DebugServiceProvider {
    
    var userIdentity: String?
    
    init() {}
    
    func start() {}
    
    func log(_ log: String) {}
    
    func error(_ error: Error) {}
    
    func forceCrash() {}
    
    func setUserIdentity(_ userIdentity: String) {
        self.userIdentity = userIdentity
    }
}
