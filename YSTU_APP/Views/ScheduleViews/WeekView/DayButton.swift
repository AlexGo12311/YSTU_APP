//
//  DayButton.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 11.10.2024.
//

import UIKit

class DayButton: UIButton {
    
    var isActive = false { didSet {changeFont()} }
    
    private static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
    
    private static let weekdayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
//        formatter.locale = Locale(identifier: "ru_RU") // Устанавливаем локализацию
        return formatter
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.SemiBold.size(of: 16)
        label.textColor = AccentColors.ordinaryTextColor
        label.textAlignment = .center
        return label
    }()
    
    private let monthLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Light.size(of: 12)
        label.textAlignment = .center
        label.textColor = AccentColors.ordinaryTextColor
        return label
    }()
    
    init(date: Date) {
        super.init(frame: .zero)
        backgroundColor = .clear
        
        // Устанавливаем текст для dayLabel и monthLabel
        dayLabel.text = Self.dayFormatter.string(from: date) // Используем статический форматтер
        let weekday = Self.weekdayFormatter.string(from: date)
        monthLabel.text = String(weekday.prefix(2)) // Обрезаем до двух символов
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func changeFont() {
        if isActive {
            dayLabel.font = .Montserrat.SemiBold.size(of: 20)
            dayLabel.textColor = AccentColors.selectedColor
            
            monthLabel.font = .Montserrat.SemiBold.size(of: 14)
            monthLabel.textColor = AccentColors.selectedColor
        } else {
            dayLabel.font = .Montserrat.SemiBold.size(of: 16)
            dayLabel.textColor = AccentColors.ordinaryTextColor
            
            monthLabel.font = .Montserrat.Regular.size(of: 12)
            monthLabel.textColor = AccentColors.ordinaryTextColor
        }
    }
}

private extension DayButton {
    func setupLayout() {
        setupDayLabel()
        setupMonthLabel()
    }
    
    func setupDayLabel() {
        addSubview(dayLabel)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayLabel.topAnchor.constraint(equalTo: topAnchor),
            dayLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupMonthLabel() {
        addSubview(monthLabel)
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            monthLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            monthLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 2),
            monthLabel.heightAnchor.constraint(equalToConstant: 14)
        ])

    }
}

//#Preview("DayButton", traits: .fixedLayout(width: 27, height: 40)) {
//    let buttom = DayButton(date: Date())
//    buttom.isActive = true
//    
//    return buttom
//}
