//
//  HMTextField.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 30/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit

class HMTextFieldCell: HMHeaderCustomCell {

    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setHeaderAndPlaceholderFor(tag: self.tag)
    }

    // Needed because two cells with different contents use this class.
    func setHeaderAndPlaceholderFor(tag: Int) {
        switch tag {
        case 0:
            self.headerLabel.text = NSLocalizedString("Name", comment: "")
            self.textField.placeholder = NSLocalizedString("Reading", comment: "")
        case 1:
            self.headerLabel.text = NSLocalizedString("Description", comment: "")
            self.textField.placeholder = NSLocalizedString("Read a little bit everyday", comment: "")
        default:
            break
        }
    }
    
}
