//
//  HMEditActivityViewController.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 30/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit

//
// This view is used by clicking one of the two following buttons: [Edit, Add] in HMActivitiesViewController.
// The UI stays the same but the data displayed, and the saving method don't.
//
// @actionType -> Defines if this view is pushed as an edit view or a save view.
// @activityData -> Gets the data of the activity to show, in case of an edit view.
//

class HMEditActivityViewController: UITableViewController {

    var typeCell: HMRadioCell!
    
    var actionType: EActionType = .undefined
    
    // In case of EDIT action
    var activityData: String? = nil
    
    // In case of CREATE action
    var selectedType: EActivityType = .boolean
    
    // MARK: View Logic
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }
    
    // MARK: User Interactions
    
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        // When the type of activity changes, the MinTime cell may have to be shown or hidden.
        if keyPath == "selectedTypeRaw" {
            self.selectedType = typeCell.selectedType
            
            // Shows or hides the MinTime cell
            if self.selectedType == .boolean && tableView.numberOfSections == 5 {
                self.tableView.deleteSections([4], with: .bottom)
            }
            else if self.selectedType == .timed {
                self.tableView.insertSections([4], with: .top)
            }
            
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
    
    // MARK: Table View Overrides
    
    // Shows the good cell according to the given section
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath)
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "FrequencyCell", for: indexPath)
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath)
            self.typeCell = cell as! HMRadioCell
            // When the type of activity changes, the MinTime cell may have to be shown or hidden/.
            self.typeCell.addObserver(self, forKeyPath: "selectedTypeRaw", options: NSKeyValueObservingOptions.new, context: nil)
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "MinTimeCell", for: indexPath) as! HMSliderCell
        default:
            cell = UITableViewCell()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 4 {
            return 68
        }
        return 44
    }
    
    // Prevents rows from being highlighted
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // MARK: Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Adjust to the radio buttons selected value.
        if selectedType == .boolean {
            return 4
        }
        else {
            return 5
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
}
