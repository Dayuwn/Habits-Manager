//
//  HMStepperCell.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 30/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit

class HMStepperCell: HMHeaderCustomCell {

    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var frequencyStepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.headerLabel.text = NSLocalizedString("Frequency", comment: "")
    }

}
