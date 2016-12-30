//
//  EActivityType.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 30/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import Foundation

//
// Defines the type of an activity.
//     - boolean : which is done or not (true/false)
//     - timed   : which should be done during a given amount of time (30mins..)
//

enum EActivityType : Int {
    case undefined = -1
    case boolean = 0
    case timed = 1
}
