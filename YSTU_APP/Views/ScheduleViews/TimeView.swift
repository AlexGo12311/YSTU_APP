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
        label.font = .Montserrat.Medium.size(of: 16)
        
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
        
        let rightBorder = CALayer()
        rightBorder.backgroundColor = AccentColors.normalColor.cgColor
        rightBorder.frame = CGRect(x: self.frame.width - 2, y: 0, width: 2, height: self.frame.height)
        self.layer.addSublayer(rightBorder)
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
            startTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            startTimeLabel.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        addSubview(endTimeLabel)
        endTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            endTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            endTimeLabel.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor)
        ])
    }
    
}


//#Preview("TimeView", traits: .fixedLayout(width: 80, height: 100)) {
//    TimeView(start: "8:30", end: "10:10")
//}
