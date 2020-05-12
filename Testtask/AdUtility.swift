//
//  AdUtility.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 12/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//

import Foundation
import UIKit
import  SVProgressHUD
import Alamofire
class AdUtility: NSObject{
   
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
 
    //MARK:- Show Progress method
    class func showProgressDialog() {
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setRingThickness(3.0)
        //SVProgressHUD.setMinimumDismissTimeInterval(2.0)
    }
    
  
     //MARK:- Hide Progress method
    class func dismissProgressDialog() {
        SVProgressHUD.dismiss()
    }
    
    
   
    //MARK: -- Alert View Validation Methods
    class func showAlert(VC: UIViewController, title: String, message: String, actionButtons : Array<String>, completionHandler: @escaping (_ response: String) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for buttonTitle in actionButtons {
            let action = UIAlertAction(title: buttonTitle , style: .default, handler: { (action:UIAlertAction!) in
                completionHandler(action.title!)
            })
            alert.addAction(action)
        }
        VC.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Alert Messages
    
    class func showAlertViewWithTitle(VC: UIViewController,title:String,message:String){
        let alert=UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
         VC.present(alert, animated: true, completion: nil)
        
    }
   class func showAlertWithLoader(VC: UIViewController,message:String)->UIAlertController
   {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    loadingIndicator.hidesWhenStopped = true
    loadingIndicator.style = UIActivityIndicatorView.Style.gray
    loadingIndicator.startAnimating();
    
    alert.view.addSubview(loadingIndicator)
    VC.present(alert, animated: true, completion: nil)
    return alert
  }
  class func dismissAlertWithLoader(VC: UIAlertController) {
    VC.dismiss(animated: false, completion: nil)
  }

}
