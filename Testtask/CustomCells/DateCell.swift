//
//  DateCell.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 12/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var displayImg: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var langLbl: UILabel!
    @IBOutlet weak var menLbl: UILabel!
    @IBOutlet weak var birthLbl: UILabel!
      
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
