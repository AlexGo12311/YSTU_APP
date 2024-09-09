//
//  UIFont+Ext.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 09.09.2024.
//

import UIKit

extension UIFont {
    enum Montserrat {
        enum Black {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Montserrat.black, size: size) ?? UIFont()
            }
        }
        
        enum BlackItalic {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.blackItalic, size: size) ?? UIFont()
            }
        }
        
        enum Bold {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.bold, size: size) ?? UIFont()
            }
        }
        
        enum BoldItalic {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.boldItalic, size: size) ?? UIFont()
            }
        }
        
        enum ExtraBold {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.extraBold, size: size) ?? UIFont()
            }
        }
        
        enum ExtraBoldItalic {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.extraBoldItalic, size: size) ?? UIFont()
            }
        }
        
        enum ExtraLight {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.extraLight, size: size) ?? UIFont()
            }
        }
        
        enum ExtraLightItalic {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.extraLightItalic, size: size) ?? UIFont()
            }
        }
        
        enum Italic {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.italic, size: size) ?? UIFont()
            }
        }
        
        enum Light {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.light, size: size) ?? UIFont()
            }
        }
        
        enum LightItalic {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.lightItalic, size: size) ?? UIFont()
            }
        }
        
        enum Medium {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.medium, size: size) ?? UIFont()
            }
        }
        
        enum MediumItalic {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.mediumItalic, size: size) ?? UIFont()
            }
        }
        
        enum Regular {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.regular, size: size) ?? UIFont()
            }
        }
        
        enum SemiBold {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.semiBold, size: size) ?? UIFont()
            }
        }
        
        enum SemiBoldItalic {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.semiBoldItalic, size: size) ?? UIFont()
            }
        }
        
        enum Thin {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.thin, size: size) ?? UIFont()
            }
        }
        
        enum ThinItalic {
            static func size(of size: CGFloat) -> UIFont {
                UIFont(name: Constants.Montserrat.thinItalic, size: size) ?? UIFont()
            }
        }
    }
}

private extension UIFont {
    enum Constants {
        enum Montserrat {
            static let black = "Montserrat-Black"
            static let blackItalic = "Montserrat-BlackItalic"
            static let bold = "Montserrat-Bold"
            static let boldItalic = "Montserrat-BoldItalic"
            static let extraBold = "Montserrat-ExtraBold"
            static let extraBoldItalic = "Montserrat-ExtraBoldItalic"
            static let extraLight = "Montserrat-ExtraLightItalic"
            static let extraLightItalic = "Montserrat-ExtraLightItalic"
            static let italic = "Montserrat-Italic"
            static let light = "Montserrat-Light"
            static let lightItalic = "Montserrat-LightItalic"
            static let medium = "Montserrat-Medium"
            static let mediumItalic = "Montserrat-MediumItalic"
            static let regular = "Montserrat-Regular"
            static let semiBold = "Montserrat-SemiBold"
            static let semiBoldItalic = "Montserrat-SemiBoldItalic"
            static let thin = "Montserrat-Thin"
            static let thinItalic = "Montserrat-ThinItalic"
            
        }
    }
}
