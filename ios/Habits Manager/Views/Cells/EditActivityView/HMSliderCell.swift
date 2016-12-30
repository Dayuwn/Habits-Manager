//
//  HMSliderCell.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 30/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit

class HMSliderCell: HMHeaderCustomCell {

    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.headerLabel.text = NSLocalizedString("Minimum Time", comment: "")
    }

}
