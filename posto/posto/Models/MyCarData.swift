//
//  MyCarData.swift
//  posto
//
//  Created by Davi Rodrigues on 15/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

 class MyCarData: NSObject {
    
    static var km: NSNumber = 0.0
    static var oil: NSNumber = 0.0
    static var inspection: NSNumber = 0.0
    static var userType: Int = 0
    static let defauts = NSUserDefaults.standardUserDefaults()

    class func changeKmValue(kmd: NSNumber) {
        km = kmd
    }
    
    class func changeOilValue(oild: NSNumber){
        oil = oild
    }
    
    class func changeInspection(inspectiond: NSNumber) {
        inspection = inspectiond
    }
    
    class func changeUserType(type: Int) {
        userType = type
    }
    
    class func saveValues() ->Bool {
        
        defauts.setObject(km, forKey: "km_defaults")
        defauts.setObject(oil, forKey: "oil_defaults")
        defauts.setObject(inspection, forKey: "inspection_defaults")
        defauts.setInteger(userType, forKey: "user_type")
        return true
    }
    
    class func returnValue (withKey: String) -> AnyObject {
        return defauts.objectForKey(withKey)!
    }

}
