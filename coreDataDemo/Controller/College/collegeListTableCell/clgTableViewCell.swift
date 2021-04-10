//
//  clgTableViewCell.swift
//  coreData
//
//  Created by Adsum MAC 3 on 10/04/21.
//

import UIKit

class clgTableViewCell: UITableViewCell {

    @IBOutlet weak var clgName: UILabel!
    @IBOutlet weak var clgCity: UILabel!
    @IBOutlet weak var clgUniversity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
