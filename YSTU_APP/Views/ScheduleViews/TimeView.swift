//
//  TimeView.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 06.01.2025.
//

import UIKit


class TimeView: UIView {
    
    private var startTimeLabel: UILabel = {
        var label = UILabel()
        label.textColor = AccentColors.ordinaryTextColor
        label.font = .Montserrat.Medium.size(of: 14)
        
        return label
    }()
    
    private var endTimeLabel: UILabel = {
        var label = UILabel()
        label.textColor = AccentColors.normalColor
        label.font = .Montserrat.Medium.size(of: 14)
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        configureTimeView()
        startTimeLabel.text = "n/a"
        endTimeLabel.text = "n/a"
        self.backgroundColor = AccentColors.bgColor

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(start: String?, end: String?) {
        guard let start = start else { return }
        startTimeLabel.text = start
        
        guard let end = end else { return }
        endTimeLabel.text = end
    }
    
    private func configureTimeView() {
        addSubview(startTimeLabel)
        startTimeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            startTimeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            startTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            startTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])

        addSubview(endTimeLabel)
        endTimeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            endTimeLabel.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor, constant: 4),
            endTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            endTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
}


//#Preview("TimeView", traits: .fixedLayout(width: 80, height: 100)) {
//    TimeView(start: "8:30", end: "10:10")
//}
