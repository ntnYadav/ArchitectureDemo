//
//  ViewController.swift

//
//  Created by Chetu on 18/12/20.
//  Copyright © 2020 Database Services. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
// Set the border Width of Button
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
// Set the Corner Radius of Button
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
// Set the border color of Button
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
