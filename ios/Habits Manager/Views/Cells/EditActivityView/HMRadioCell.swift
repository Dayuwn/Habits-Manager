//
//  HMRadioCell.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 30/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit

class HMRadioCell: HMHeaderCustomCell {

    @IBOutlet weak var booleanRadioButton: UIButton!
    @IBOutlet weak var timedRadioButton: UIButton!
    
    var selectedType: EActivityType = .boolean {
        didSet {
            selectedTypeRaw = selectedType.rawValue
        }
    }
    dynamic var selectedTypeRaw: Int = -1
    
    // MARK: View Logic
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.headerLabel.text = NSLocalizedString("Type", comment: "")
        
        self.booleanRadioButton.setTitle(" " + NSLocalizedString("Boolean", comment: ""), for: .normal)
        self.booleanRadioButton.tag = 0
        self.timedRadioButton.setTitle(" " + NSLocalizedString("Timed", comment: ""), for: .normal)
        self.timedRadioButton.tag = 1
    }
        
    // MARK: User Interaction

    // Only one of the two buttons can be selected at a time.
    @IBAction func buttonPressed(_ sender: UIButton!) {
        if sender.tag == 0 && selectedType != .boolean {
            selectedType = .boolean
            booleanRadioButton.setImage(#imageLiteral(resourceName: "radiobtn_checked"), for: .normal)
            timedRadioButton.setImage(#imageLiteral(resourceName: "radiobtn_unchecked"), for: .normal)
        }
        else if sender.tag == 1 && selectedType != .timed {
            selectedType = .timed
            booleanRadioButton.setImage(#imageLiteral(resourceName: "radiobtn_unchecked"), for: .normal)
            timedRadioButton.setImage(#imageLiteral(resourceName: "radiobtn_checked"), for: .normal)
        }
    }
    
}
