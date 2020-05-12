//
//  Extensions.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 12/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//

import Foundation
import UIKit
extension UIView
{
    func dropShadow(color: UIColor) {
           self.layer.masksToBounds = false
           self.layer.shadowColor = color.cgColor
           self.layer.shadowOpacity = 1
           self.layer.shadowOffset = CGSize.zero
           self.layer.shadowRadius = 5
           self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
       }
    func makeTopCornersRound(cornerRadiusValue: Float) {
        let path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners:[.topRight, .topLeft],
                                cornerRadii: CGSize(width: Double(cornerRadiusValue), height:  Double(cornerRadiusValue)))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    func makeBottomCornersRound(cornerRadiusValue: Float) {
        let path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners:[.bottomLeft,.bottomRight],
                                cornerRadii: CGSize(width: Double(cornerRadiusValue), height:  Double(cornerRadiusValue)))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    func makeBorder(cornerRadiusValue: Float, borderWidth: Float, borderColor: UIColor) {
        self.layer.cornerRadius = CGFloat(cornerRadiusValue)
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = CGFloat(borderWidth)
    }
}
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
