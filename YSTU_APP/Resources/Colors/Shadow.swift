//
//  Shadow.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 29.09.2024.
//

import UIKit

import UIKit

public func setShadow(_ cell: UITableViewCell) {
    cell.layer.shadowColor = AccentColors.shadowColor?.cgColor
    cell.layer.shadowOpacity = 0.08
    cell.layer.shadowOffset = CGSize(width: 0, height: 0)
    cell.layer.shadowRadius = 10
    cell.layer.masksToBounds = false
}

public func setShadow(_ view: UIView) {
    view.layer.shadowColor = AccentColors.shadowColor?.cgColor
    view.layer.shadowOpacity = 0.08
    view.layer.shadowOffset = CGSize(width: 0, height: 0)
    view.layer.shadowRadius = 10
    view.layer.masksToBounds = false
}
