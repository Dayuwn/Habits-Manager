//
//  HMActivitiesTableViewController.swift
//  Habits Manager
//
//  Created by Lucas Rollet on 28/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit

class HMActivitiesViewController: UITableViewController {
    
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    var selectedIndexPath: IndexPath? = nil
    
    // MARK: View Logic
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HCommons.setNavbarAppearance(of: self)
        self.title = NSLocalizedString("My Activities", comment: "")
        
        editBarButton.title = NSLocalizedString("Edit", comment: "")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Sets the edit view's action type
        if let editActivityVC = segue.destination as? HMEditActivityViewController {
            switch segue.identifier! {
                case "Edit Activity":
                    editActivityVC.actionType = .edit
                case "Create Activity":
                    editActivityVC.actionType = .create
                default:
                    editActivityVC.actionType = .undefined
            }
        }
    }
    
    // MARK: Table View Overrides
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HMCell2", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Closes the previously selected cell by deselecting it
        if selectedIndexPath != indexPath {
            if let uwSelectedIndexPath = selectedIndexPath {
                (tableView.cellForRow(at: uwSelectedIndexPath) as! HMActivityInformationsCell).flipChevron()
                tableView.deselectRow(at: uwSelectedIndexPath, animated: true)
            }
            selectedIndexPath = indexPath
        }
        
        
        (tableView.cellForRow(at: indexPath) as! HMActivityInformationsCell).flipChevron()

        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // Makes sure that only one cell is selected at a time
        if selectedIndexPath == indexPath {
            selectedIndexPath = nil
        }
        
        
        (tableView.cellForRow(at: indexPath) as! HMActivityInformationsCell).flipChevron()
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.white
    }
    
    // Adjusts height if this cell is currently selected.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndexPath == indexPath {
            return 188
        }
        return 49
    }
    
    // MARK: Table View Data Source
    // 1 row per section is used, with 10 sections, to add spacing between each row.
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
}
