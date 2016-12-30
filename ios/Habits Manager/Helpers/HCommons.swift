//
//  HCommons.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 28/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit

class HCommons {
    
    static func setNavbarAppearance(of context: UIViewController) {
        
        context.navigationController?.navigationBar.barTintColor = UIColor.red
        context.navigationController?.navigationBar.tintColor = UIColor.white
        context.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
}
