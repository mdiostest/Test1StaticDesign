//
//  ViewController.swift
//  Test1StaticDesign
//
//  Created by MagicMind Technologies on 28/02/21.
//

import UIKit

class ViewController: UIViewController {

    var ExpandCollapeArray : [Bool] = []
    var expandCell  = -99
    
    @IBOutlet weak var roleObjectiveTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ExpandCollapeArray = [Bool](repeating: false, count: 4)
    }
    // MARK: - Obj Expand Tap
    @objc func objExpandTap(_ sender: UITapGestureRecognizer)
    {
        let section = (sender.view?.tag ?? 0) / 1000
        let row = sender.view?.tag ?? 0 % 1000
        let indexPathNumber = IndexPath(row: row, section: section)
        let cell : RoleObjTableViewCell = roleObjectiveTable.cellForRow(at: indexPathNumber) as! RoleObjTableViewCell
        if cell.isSelected
        {
            cell.isSelected = false
            cell.keyResultArray = []
            cell.keyResultTable.reloadData()
            cell.tableViewHeightConstraint.constant = 0
            cell.layoutIfNeeded()
        }
        else
        {
            cell.isSelected = true
            cell.keyResultArray = ["key Result1","key Result1","key Result1"]
            cell.keyResultTable.reloadData()
            cell.tableViewHeightConstraint.constant = 150
            cell.layoutIfNeeded()
        }
       // roleObjectiveTable.reloadData()
        
    }
    // MARK: - Expand Tap
    @objc func expandTap(_ sender: UITapGestureRecognizer)
    {
        let expanded : Bool = ExpandCollapeArray[sender.view?.tag ?? 0]
        
        if expanded
        {
            ExpandCollapeArray[sender.view?.tag ?? 0] = false
            expandCell = -99
   
        }
        else
        {
            ExpandCollapeArray[sender.view?.tag ?? 0] = true
            if expandCell >= 0
            {
                ExpandCollapeArray[expandCell] = false
            }
            expandCell = sender.view?.tag ?? 0
            

        }
        roleObjectiveTable.reloadData()
        

        
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }

}
private typealias TableviewDelegateAndDatasouce = ViewController

extension TableviewDelegateAndDatasouce : UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let cell:RoleObjHeaderTableViewCell = roleObjectiveTable.dequeueReusableCell(withIdentifier: "RoleObjHeaderTableViewCell") as! RoleObjHeaderTableViewCell
        
        cell.lblRole.text = "Role1"
        
        let expanded : Bool = ExpandCollapeArray[section]
        if expanded
        {
            cell.underLineView.isHidden = true
            
        }
        else
        {
            cell.underLineView.isHidden = false
            
        }
        cell.tag = section
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(self.expandTap(_:)))
        cell.addGestureRecognizer(tap)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let expanded : Bool = ExpandCollapeArray[section]
        if expanded
        {
            return 2
        }
        else
        {
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell:RoleObjTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RoleObjTableViewCell") as! RoleObjTableViewCell
        cell.lblObjective.text = "Objective1"
        
        cell.tag = 1000*indexPath.section + indexPath.row
        
        if cell.isSelected
        {
            cell.keyResultArray = ["key Result1","key Result1","key Result1"]
            cell.tableViewHeightConstraint.constant = 150
        }
        else
        {
            cell.keyResultArray = []
            cell.tableViewHeightConstraint.constant = 0
        }
        
        cell.keyResultTable.reloadData()
        cell.layoutIfNeeded()
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(self.objExpandTap(_:)))
        cell.addGestureRecognizer(tap)
        
        return cell
   

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

}


