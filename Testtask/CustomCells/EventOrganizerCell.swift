//
//  EventOrganizerCell.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 12/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//

import UIKit

class EventOrganizerCell: UITableViewCell {
@IBOutlet weak var cellView: UIView!
 @IBOutlet weak var collView :UICollectionView!
 @IBOutlet weak var stackCollView :UIStackView!
    @IBOutlet weak var minusBtn :UIButton!
     //@IBOutlet var constraintBtnHeight: NSLayoutConstraint!
var eventOrgArray = [EventOrganizer]()
var didTapOnButton : ((UIButton) -> (Void))?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(array:[EventOrganizer]?)
    {
        if let arr = array{
            eventOrgArray = arr
            print(eventOrgArray)
        }
        self.collView.reloadData()
    }
//    @IBAction func tapOnButton(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
//
//        if !sender.isSelected{
//
//            self.constraintBtnHeight.constant = 128
//        }else{
//            self.constraintBtnHeight.constant = 0
//        }
//        //self.didTapOnButton!(sender)
//    }

}
extension EventOrganizerCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
         eventOrgArray.count
        
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventOrganizerCollectionCell", for: indexPath) as! eventOrganizerCollectionCell
            
            cell.nameLbl.text = "hello"
            if let str = self.eventOrgArray[indexPath.row].oLogo
            {
                if let searchURL  = NSURL(string: str)
                {
                             
                if let data = NSData(contentsOf: searchURL as URL)
                {
                    cell.displayImg?.image = UIImage(data: data as Data)
                             
                }
                
            }
            }
           
            
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = 100
        let yourHeight = 100
        
        return CGSize(width: yourWidth, height: yourHeight)
    }

}
