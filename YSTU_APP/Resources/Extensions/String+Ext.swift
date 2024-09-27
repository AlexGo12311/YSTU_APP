//
//  Date+Ext.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 27.09.2024.
//

import UIKit

extension String {
    func capitalizeFirstLetter() -> String {
        self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
