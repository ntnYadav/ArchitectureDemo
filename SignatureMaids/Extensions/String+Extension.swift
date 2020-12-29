//  Extension
//  Created by Chetu on 18/12/20.
//  Copyright © 2020 Database Services. All rights reserved.
//

import Foundation
import UIKit

extension String
{
    //Variable is being used to check the whether mail is valid or not
    var isValidEmail: Bool {
        let emailRegEx = SMConstant.CharacterSetForValidation.emailCharacterSet
        let emailTest = NSPredicate(format:"\(SMConstant.kselfMatch) %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    //variable for converting string to base 64 string
    var base64String: String {
        let data = (self).data(using: String.Encoding.utf8)
        let base64 = data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return base64
    }
    //Variable to check whether password is valid or not
    var isValidPassword: Bool {
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = self.rangeOfCharacter(from: decimalCharacters)
        let characterset = CharacterSet(charactersIn: SMConstant.CharacterSetForValidation.characterSet)
        let characterRange = self.rangeOfCharacter(from: characterset)
        if decimalRange != nil && characterRange != nil {
            return true
        } else {
            return false
        }
    }
    
    var isValidPasswordRegex: Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[ !\"\\\\#$%&'\\(\\)\\*+,\\-\\./:;<=>?@\\[\\]^_`\\{|\\}~])[A-Za-z\\d !\"\\\\#$%&'\\(\\)\\*+,\\-\\./:;<=>?@\\[\\]^_`\\{|\\}~]{8,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
    //Variable is being used to check the current textfield is empty or not
    var isEmpty: Bool {
        if self == "" || self.trimmingCharacters(in: .whitespaces) == "" {
            return true
        }
        return false
    }
}
extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "System-Bold", size: 17)!]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)

        return self
    }

    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)

        return self
    }
}
