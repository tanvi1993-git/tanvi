//
//  eventOrganizerCollectionCell.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 12/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//

import UIKit

class eventOrganizerCollectionCell: UICollectionViewCell {
    @IBOutlet weak var displayImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cellView: UIView!
   
    
    
       override func awakeFromNib() {
            super.awakeFromNib()
        self.cellView.makeBorder(cornerRadiusValue: 3.0, borderWidth: 1.0, borderColor: UIColor.lightGray)
           
        }
}
