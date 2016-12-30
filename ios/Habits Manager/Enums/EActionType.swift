//
//  EActionType.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 30/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import Foundation

//
// Defines the action type required of a view controller.
// Used when one screen can have two different logics.
//

enum EActionType {
    case undefined
    case edit
    case create
}
