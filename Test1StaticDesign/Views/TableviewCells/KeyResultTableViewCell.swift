//
//  KeyResultTableViewCell.swift
//  Test1StaticDesign
//
//  Created by MagicMind Technologies on 28/02/21.
//

import UIKit

class KeyResultTableViewCell: UITableViewCell {

    @IBOutlet weak var lblKeyResult: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
