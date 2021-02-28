//
//  RoleObjTableViewCell.swift
//  Test1StaticDesign
//
//  Created by MagicMind Technologies on 28/02/21.
//

import UIKit

class RoleObjTableViewCell: UITableViewCell {

    @IBOutlet weak var lblObjective: UILabel!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    var keyResultArray = ["key Result1","key Result1","key Result1"]
    
    @IBOutlet weak var keyResultTable: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension RoleObjTableViewCell : UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return keyResultArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell:KeyResultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KeyResultTableViewCell") as! KeyResultTableViewCell
        cell.lblKeyResult.text = "Key Result 1"
        return cell
   

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    

}

