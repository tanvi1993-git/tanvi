//
//  ViewController.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 11/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,EventOrganizerCellDelegate {
    
    
    
    @IBOutlet weak var tblView :UITableView!
   
    var eventObj:EventDataClass?
    
    var strtDate:String?
    var endDate:String?
    var isCellExpand:Bool? = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEventDetails()
        
    }
    
    //MARK: Event Details Api
    func getEventDetails()
    {
        
        
        let parameters = ["user_id": "00","latitude":28.1245,"longitude":78.1245,"event_id":12] as [String : Any]
        AdAPIManager.instance.callEventDetails(params: parameters as [String : Any], endURL: "http://saudicalendar.com/api/user/getEventDetail", controller: self) { (response) in
            print(response)
            
            if response.error == false
            {
                print(response.data ?? "")
                if let data = response.data
                {
                    self.eventObj = data
                   
                    
                }
               
                self.tblView.reloadData()
                
            }
            //                else{
            //                    AdUtility.showAlert(VC: self, title: "", message: response.message!, actionButtons: [ALERT_BUTTONS.OK], completionHandler: { (response) in
            //
            //                    })
            //                }
            
        }
    }
    //MARK:- Table Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         7
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 260
        }
        else if indexPath.row == 1
        {
            return 330
            //return UITableView.automaticDimension
            
        }
        else if indexPath.row == 2
        {
            return 180
                       
        }
         else if indexPath.row == 3
        {
            return UITableView.automaticDimension
        }
        else
        {
            return 100
        }
       
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath)as! DateCell
            cell.selectionStyle = .none
            DispatchQueue.main.async {
                 cell.cellView.makeBorder(cornerRadiusValue: 7.0, borderWidth: 0.0, borderColor: UIColor.lightGray)
                cell.langLbl.text = "Arabic & Urdu"
                            cell.menLbl.text = "Mens & Womens"
                           cell.birthLbl.text = "19-25 Years"
                           cell.timeLbl.text = "10:45 - 16:45"
            }
           
            
            if let date = self.eventObj?.evStartDate, let date1 = self.eventObj?.evEndDate
            {
                let dateFormatterGet = DateFormatter()
                dateFormatterGet.dateFormat = "yyyy-MM-dd"
                
                let dateFormatterPrint = DateFormatter()
                dateFormatterPrint.dateFormat = "dd MMMM yyyy"
                dateFormatterPrint.locale = Locale(identifier: "en_US")
                if let date = dateFormatterGet.date(from: date) {
                    print(dateFormatterPrint.string(from: date))
                    strtDate = dateFormatterPrint.string(from: date)
                } else {
                    print("There was an error decoding the string")
                }
                if let dateEnd = dateFormatterGet.date(from: date1) {
                    
                    endDate = dateFormatterPrint.string(from: dateEnd)
                }
                else {
                    print("There was an error decoding the string")
                }
                cell.dateLbl.text = (strtDate ?? "") + "-" + (endDate ?? "")
            }
           
            
            return cell
        }
        else if indexPath.row == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)as! LocationCell
            cell.selectionStyle = .none
            DispatchQueue.main.async {
                  cell.cellView.makeBorder(cornerRadiusValue: 7.0, borderWidth: 0.0, borderColor: UIColor.lightGray)
             }
            
            cell.dispLbl.text =
                "Geo Location of the event"
            if let country = eventObj?.evCountry,let region = eventObj?.evRegion,let city = eventObj?.evCity
            {
                cell.countryLbl.text = region + "," + country
                 cell.cityLbl.text = city
            }
           
            if let lat = eventObj?.evLat,let long = eventObj?.evLong
            {
                let camera = GMSCameraPosition.camera(withLatitude:CLLocationDegrees((lat.toDouble())!) , longitude: CLLocationDegrees((long.toDouble())!), zoom: 6.0)
                let mapView = GMSMapView.map(withFrame: cell.mapContainer.frame, camera: camera)
                cell.cellView.addSubview(mapView)

            let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat.toDouble()!), longitude: CLLocationDegrees(long.toDouble()!))
                marker.map = mapView
            }
            
           
            
            
            return cell
        }
        else if indexPath.row == 2
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath)as! DescriptionCell
            cell.selectionStyle = .none
            DispatchQueue.main.async {
                  cell.cellView.makeBorder(cornerRadiusValue: 7.0, borderWidth: 0.0, borderColor: UIColor.lightGray)
             }
            
            
           
            return cell
        }
        else if indexPath.row == 3
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventOrganizerCell", for: indexPath)as! EventOrganizerCell
            cell.selectionStyle = .none
            DispatchQueue.main.async {
                  cell.cellView.makeBorder(cornerRadiusValue: 7.0, borderWidth: 0.0, borderColor: UIColor.lightGray)
             }
            
            cell.minusBtn.tag = indexPath.row
            cell.configureCell(array: (eventObj?.eventOrganizer))
            cell.delegate = self
            if isCellExpand == true
            {
                cell.constraintBtnHeight.constant = 128
                cell.minusBtn.setImage(UIImage(named:"minus"), for: .normal)
                
            }
            else
            {
                cell.constraintBtnHeight.constant = 0
                cell.minusBtn.setImage(UIImage(named:"plus"), for: .normal)
            }

            
            return cell
        }
        else if indexPath.row == 4
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventSponserCell", for: indexPath)as! EventSponserCell
            cell.selectionStyle = .none
            DispatchQueue.main.async {
                  cell.cellView.makeBorder(cornerRadiusValue: 7.0, borderWidth: 0.0, borderColor: UIColor.lightGray)
             }
            
            cell.displayLbl.text = "View event sponsers"
           
            return cell
        }
        else if indexPath.row == 5
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventSponserCell", for: indexPath)as! EventSponserCell
            cell.selectionStyle = .none
            DispatchQueue.main.async {
                  cell.cellView.makeBorder(cornerRadiusValue: 7.0, borderWidth: 0.0, borderColor: UIColor.lightGray)
             }
            
             cell.displayLbl.text = "View event performers"
           
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventSponserCell", for: indexPath)as! EventSponserCell
            cell.selectionStyle = .none
            DispatchQueue.main.async {
                  cell.cellView.makeBorder(cornerRadiusValue: 7.0, borderWidth: 0.0, borderColor: UIColor.lightGray)
             }
            
             cell.displayLbl.text = "View seating plan"
           
            return cell
        }
    }
    func tapOnBtn(sender: UIButton) {
        if self.isCellExpand == true
        {
             self.isCellExpand = false
        }
        else
        {
            self.isCellExpand = true
        }
        
        self.tblView.reloadData()
    }
}
