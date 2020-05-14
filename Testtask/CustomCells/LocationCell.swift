//
//  LocationCell.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 12/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//

import UIKit
import GoogleMaps
class LocationCell: UITableViewCell {
 @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var countryLbl: UILabel!
       @IBOutlet weak var cityLbl: UILabel!
       @IBOutlet weak var dispLbl: UILabel!
     @IBOutlet weak var mapContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
