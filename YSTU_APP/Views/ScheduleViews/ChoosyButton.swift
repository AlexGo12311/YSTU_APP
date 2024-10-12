//
//  ChoosyButton.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 06.10.2024.
//

import UIKit

final class ChoosyButton: UIButton {
    
    let group: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Regular.size(of: 14)
        label.numberOfLines = 1
        label.textColor = AccentColors.buttonTextColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pathIcon: UIImageView = {
        let ico = UIImageView()
        ico.contentMode = .scaleAspectFit
        ico.clipsToBounds = true
        ico.image = UIImage(resource: .path).withRenderingMode(.alwaysTemplate)
        ico.tintColor = AccentColors.buttonTextColor
        ico.translatesAutoresizingMaskIntoConstraints = false
        return ico
    }()
    
    init(groupName: String) {
        self.group.text = groupName
        super.init(frame: .zero)
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

@objc extension ChoosyButton {
    func addViews() {
        addSubview(group)
        addSubview(pathIcon)
    }
    
    func layoutViews() {
        // pathIcon layout
        NSLayoutConstraint.activate([
            pathIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            pathIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            pathIcon.heightAnchor.constraint(equalToConstant: 5),
            pathIcon.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        // group
        NSLayoutConstraint.activate([
            group.centerYAnchor.constraint(equalTo: centerYAnchor),
            group.trailingAnchor.constraint(equalTo: pathIcon.leadingAnchor),
            group.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    func configure() {
        backgroundColor = AccentColors.selectedColor
        self.layer.cornerRadius = 16
    }
}

//#Preview("ChoosyButton", traits: .fixedLayout(width: 100, height: 50)) {
//    let button = ChoosyButton(frame: .zero, groupName: "ЦПИ-11")
//    return button
//}
