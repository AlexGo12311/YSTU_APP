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
    static let tabBarColor = UIColor { traitCollection in
        (traitCollection.userInterfaceStyle == .dark ? UIColor(hex: "#1C1F26") : UIColor(hex: "#E5ECFB")) ?? UIColor.systemBackground
    }
    
    static let selectedColor = UIColor { traitCollection in
        (traitCollection.userInterfaceStyle == .dark ? UIColor(hex: "#E5ECFB") : AccentColors.blueColor) ?? UIColor.systemBackground
    }
    static let normalColor = UIColor { traitCollection in
        (traitCollection.userInterfaceStyle == .dark ? UIColor(hex: "#8B9DB5") : UIColor.black) ?? UIColor.systemBackground
    }
    
    static let mainColor = UIColor(hex: "#E18230")
    static let blueColor = UIColor(hex: "#194484")
    static let secondaryColor = UIColor(hex: "#F1F3F7")
}
