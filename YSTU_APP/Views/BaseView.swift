//
//  BaseView.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 29.09.2024.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

@objc extension BaseView {
    func addViews() {}
    func layoutViews() {}
    func configure() {}
}
