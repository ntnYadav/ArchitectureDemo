//  Created by Chetu on 18/12/20.
//  Copyright © 2020 Database Services. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
   
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    // Set the border Width of Text Field
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    // Set the Corner Radius of Text Field
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    // Set the border color of Text Field
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
    //Variable is being used to check the whether mail is valid or not
    var isValidEmail: Bool {
        let emailRegEx = SMConstant.CharacterSetForValidation.emailCharacterSet
        let emailTest = NSPredicate(format:"\(SMConstant.kselfMatch) %@", emailRegEx)
        return emailTest.evaluate(with: self.text!)
    }
    
    //Variable to check whether password is valid or not
    var isValidPassword: Bool {
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = self.text?.rangeOfCharacter(from: decimalCharacters)
        let characterset = CharacterSet(charactersIn: SMConstant.CharacterSetForValidation.characterSet)
        let characterRange = self.text?.rangeOfCharacter(from: characterset)
        if decimalRange != nil && characterRange != nil {
            return true
        } else {
            return false
        }
    }
    
    //Variable is being used to check the current textfield is empty or not
    var isEmpty: Bool {
        if self.text == nil || self.text == "" || self.text!.trimmingCharacters(in: .whitespaces) == "" {
            return true
        }
        return false
    }
}
