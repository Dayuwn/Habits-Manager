//
//  ActivityInformationsCell.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 29/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit

// TODO : Translate all labels and assign them in code, not in storyboards.

class HMActivityInformationsCell: UITableViewCell {
    
    @IBOutlet var shadowedViews: [UIView]!
    @IBOutlet weak var chevronImageView: UIImageView!
    
    @IBOutlet weak var typeHeaderLabel: UILabel!
    @IBOutlet weak var frequencyHeaderLabel: UILabel!
    @IBOutlet weak var descriptionHeaderLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var opened = false

    // MARK: Cell Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addShadows()
        self.setHeaders()
    }
    
    // Called when the sell is selected / deselected to show visual output to the user.
    func flipChevron() {
        if opened {
            chevronImageView.image = #imageLiteral(resourceName: "chevron")
        }
        else {
            chevronImageView.image = #imageLiteral(resourceName: "chevron_reversed")
        }
        opened = !opened
    }
    
    // Adds shadows to every view that need them.
    private func addShadows() {
        for shadowedView in shadowedViews {
            shadowedView.layer.shadowColor = UIColor.gray.cgColor
            shadowedView.layer.shadowRadius = 1.0
            shadowedView.layer.shadowOpacity = 1
            shadowedView.layer.shadowOffset = CGSize(width: 0, height: 2)
        }
    }
    
    private func setHeaders() {
        typeHeaderLabel.text = NSLocalizedString("AI_Type_Header", comment: "")
        frequencyHeaderLabel.text = NSLocalizedString("AI_Frequency_Header", comment: "")
        descriptionHeaderLabel.text = NSLocalizedString("AI_Description_Header", comment: "")
    }
}
