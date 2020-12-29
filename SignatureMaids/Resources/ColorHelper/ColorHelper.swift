//
//  ColorHelper.swift
//  Created by Chetu on 18/12/20.
//  Copyright © 2020 Database Services. All rights reserved.
//

import Foundation
import UIKit

struct PrimaryColor {
    
    
    /* navyBlue - managing the color on the User Interface
     Parameters:
     alphaValue: CGFloat
     return : UIColor
     */
    static func navySeptaBlue(alphaValue: CGFloat) -> UIColor {
        return UIColor(red: 41/255.0, green: 50.0/255.0, blue: 117.0/255.0, alpha: CGFloat(alphaValue))
    }
    static func navySeptaLightGray(alphaValue: CGFloat) -> UIColor {
        return UIColor(red: 235/255.0, green: 235/255.0, blue:235/255.0, alpha: CGFloat(alphaValue))
    }
    
    /* Red - managing the color on the User Interface
     Parameters:
     alphaValue: CGFloat
     return : UIColor
     */
//    static func septaRed(alphaValue: CGFloat) -> UIColor {
//        return UIColor(red: 237/255.0, green: 93.0/255.0, blue: 58.0/255.0, alpha: CGFloat(alphaValue))
//    }
    static func septaDarkRed(alphaValue: CGFloat) -> UIColor {
        return UIColor(red: 196/255.0, green: 53.0/255.0, blue: 74.0/255.0, alpha: CGFloat(alphaValue))
    }
    /* navyLightGray - managing the color on the User Interface
     Parameters:
     alphaValue: CGFloat
     return : UIColor
     */
    static func navyLightGray(alphaValue: CGFloat) -> UIColor {
        return UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: CGFloat(alphaValue))
    }
    /* navyLightGray - managing the color on the User Interface
     Parameters:
     alphaValue: CGFloat
     return : UIColor
     */
    static func darkRed(alphaValue: CGFloat) -> UIColor {
        return UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: CGFloat(alphaValue))
    }
    /* navyLightGray - managing the color on the User Interface
     Parameters:
     alphaValue: CGFloat
     return : UIColor
     */
    static func darkGreen(alphaValue: CGFloat) -> UIColor {
        return UIColor(red: 0.0/255.0, green: 144.0/255.0, blue: 81.0/255.0, alpha: CGFloat(alphaValue))
    }
    /* navyLightGray - managing the color on the User Interface
     Parameters:
     alphaValue: CGFloat
     return : UIColor
     */
    static func lightGreen(alphaValue: CGFloat) -> UIColor {
        return UIColor(red: 0.0/255.0, green: 249.0/255.0, blue: 0.0/255.0, alpha: CGFloat(alphaValue))
    }
}



