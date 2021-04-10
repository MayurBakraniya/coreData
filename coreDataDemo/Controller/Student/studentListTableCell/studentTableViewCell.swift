//
//  studentTableViewCell.swift
//  coreDataDemo
//
//  Created by Adsum MAC 3 on 10/04/21.
//

import UIKit

class studentTableViewCell: UITableViewCell {

    @IBOutlet weak var studNameLbl: UILabel!
    @IBOutlet weak var studContactLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
