//
//  FabricServiceProvider.swift
//  SLM
//
//  Created by Pakho Yeung on 16/10/2018.
//  Copyright © 2018 Pakho Yeung. All rights reserved.
//

import Foundation
import Fabric
import Crashlytics

class FabricServiceProvider: DebugServiceProvider {
    
    override init() {
        super.init()
    }
    
    override func start() {
        Fabric.with([Crashlytics.self])
    }
    
    override func log(_ log: String) {
        super.log(log)
        switch AppConstant.appMode {
        case .debug:
            CLSNSLogv("%@", getVaList([log]))
        case .release:
            CLSLogv("%@", getVaList([log]))
        }
    }
    
    override func error(_ error: Error) {
        super.error(error)
        Crashlytics.sharedInstance().recordError(error)
    }
    
    override func forceCrash() {
        super.forceCrash()
        Crashlytics.sharedInstance().crash()
    }
    
    override func setUserIdentity(_ userIdentity: String) {
        super.setUserIdentity(userIdentity)
        Crashlytics.sharedInstance().setUserIdentifier(userIdentity)
    }
}
