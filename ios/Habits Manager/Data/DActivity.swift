//
//  DActivity.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 01/01/2017.
//  Copyright © 2017 Lucas Rollet. All rights reserved.
//

import UIKit

class DActivity: NSObject, NSCoding {
    var acName: String
    var acDescription: String
    var acFrequency: Int
    var acType: EActivityType
    var acMinTime: Int?
    
    init(name: String, description: String, frequency: Int, type: EActivityType, minTime: Int?) {
        self.acName = name
        self.acDescription = description
        self.acFrequency = frequency
        self.acType = type
        self.acMinTime = minTime
    }
    
    required init(coder aDecoder: NSCoder) {
        self.acName = aDecoder.decodeObject(forKey: "name") as! String
        self.acDescription = aDecoder.decodeObject(forKey: "description") as! String
        self.acFrequency = aDecoder.decodeObject(forKey: "frequency") as! Int
        self.acType = aDecoder.decodeObject(forKey: "type") as! EActivityType
        self.acMinTime = aDecoder.decodeObject(forKey: "minTime") as! Int?
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(acName, forKey: "name")
        aCoder.encode(acDescription, forKey: "description")
        aCoder.encode(acFrequency, forKey: "frequency")
        aCoder.encode(acType.rawValue, forKey: "type")
        aCoder.encode(acMinTime, forKey: "minTime")
    }
    
}
