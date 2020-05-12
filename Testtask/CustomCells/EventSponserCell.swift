//
//  EventSponserCell.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 12/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//

import UIKit

class EventSponserCell: UITableViewCell {
 @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var displayLbl: UILabel!
    @IBOutlet weak var plusaBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
