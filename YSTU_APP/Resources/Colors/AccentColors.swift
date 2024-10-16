//
//  AccentColors.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 09.09.2024.
//

import UIKit

struct AccentColors {
    static let bgColor = UIColor { traitCollection in
        return (traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor(red: 0.98, green: 0.98, blue: 1.00, alpha: 1.00))
    }
    
    static let interfaceColor = UIColor { traitCollection in
        (traitCollection.userInterfaceStyle == .dark ? AccentColors.greyColor : UIColor.white) ?? UIColor.systemBackground
    }
    
    static let selectedColor = UIColor { traitCollection in
        (traitCollection.userInterfaceStyle == .dark ? UIColor(hex: "#E5ECFB") : AccentColors.blueColor) ?? UIColor.systemBackground
    }
    static let normalColor = UIColor { traitCollection in
        (traitCollection.userInterfaceStyle == .dark ? UIColor(hex: "#8B9DB5") : UIColor(hex: "929CAD")) ?? UIColor.systemBackground
    }
    
    static let ordinaryTextColor = UIColor { traitCollection in
        (traitCollection.userInterfaceStyle == .dark ? UIColor.white : UIColor.black)
    }
    
    static let buttonTextColor = UIColor { traitCollection in
        (traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor.white)
    }
    
//    static let mainColor = UIColor(hex: "#E18230")
    static let greyColor = UIColor(hex: "#252525")
    static let blackColor = UIColor(hex: "#080808")
    static let blueColor = UIColor(hex: "#194484")
    static let shadowColor = UIColor(hex: "#18396B")
    static let testColor = UIColor(hex: "#EDEFFA")
}
