//
//  APIManager.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 12/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
let kSharedUserDefaults     = UserDefaults.standard
class AdAPIManager {
  
  static let instance = AdAPIManager()
  
  private init() { }
  
  
  func callEventDetails(params: [String: Any], endURL: String, controller: UIViewController, completion: @escaping (_ response : OverViewModel) -> Void){
    if !AdUtility.isConnectedToInternet() {
      AdUtility.showAlertViewWithTitle(VC: controller, title: "Internet Connection", message: "Please check your internet connection and try again")
      return
    }
    AdUtility.showProgressDialog()
    debugPrint(params)
   
    //var userResponse = UserRegisterResponse()
    
    AF.request(endURL, method: .post, parameters: params,encoding: URLEncoding.default).responseJSON(completionHandler: {
      ( response ) in
      let decoder = JSONDecoder()
      AdUtility.dismissProgressDialog()
      debugPrint(endURL)
      debugPrint(params)
          print(response.result)
         if let responseData = response.data{
                    
                     let userLoginResponse = try! decoder.decode(OverViewModel.self, from: responseData)
                     print(userLoginResponse)
          
                      completion(userLoginResponse)
                  }
         
      //      else
      //      {
      //        AdUtility.showAlert(VC: controller, title: "", message: "Error occured", actionButtons: [ALERT_BUTTONS.OK], completionHandler: { (response) in
      //        })
      //      }
         
        })
    
    
  }
}
