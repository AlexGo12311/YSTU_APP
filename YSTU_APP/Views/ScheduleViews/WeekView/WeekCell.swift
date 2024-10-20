//
//  WeekCell.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 11.10.2024.
//

import UIKit

protocol WeekCellDelegate: AnyObject {
    func dayButtonDidTapped(_ sender: DayButton)
}

class WeekCell: UICollectionViewCell {
    static let identifier = "WeekCell"
    weak var delegate: WeekCellDelegate?
    private var weekIndex: Int?
    
    @objc func buttonTapped(_ sender: DayButton) {
        print("\(sender.tag) - button tag")
        let tmpConstraint = widthConstraint.constant
        widthConstraint.constant = stackView.arrangedSubviews[sender.tag].frame.width
        leadingConstraint.constant = stackView.arrangedSubviews[sender.tag].frame.origin.x
        
        if tmpConstraint != 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.contentView.layoutIfNeeded()
                self.buttonArray.forEach { button in
                    let isActive = (button == sender)
                    UIView.transition(with: button, duration: 0.3, options: .transitionCrossDissolve, animations: {
                        button.isActive = isActive
                    })
                }
            }, completion: { _ in
                // После завершения анимации вызываем делегат
                self.delegate?.dayButtonDidTapped(sender)
            })
        } else {
            self.contentView.layoutIfNeeded()
            self.buttonArray.forEach { button in
                button.isActive = (button == sender) }
            delegate?.dayButtonDidTapped(sender)
        }
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()

    private var buttonArray = [DayButton]()
    private let selectedView = UIView()
    private var leadingConstraint = NSLayoutConstraint()
    private var widthConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension WeekCell {
    func configure(with dates: [Date], selectedWeekIndex: Int?, selectedDayIndex: Int?, currentWeekIndex: Int) {
        // Очищаем stackView и массив кнопок
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        buttonArray.removeAll()

        // Добавляем новые кнопки
        dates.enumerated().forEach {
            let button = DayButton(date: $0.element)
            button.isActive = (currentWeekIndex == selectedWeekIndex && $0.offset == selectedDayIndex)
            button.tag = $0.offset
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            buttonArray.append(button)
            stackView.addArrangedSubview(button)
        }

        // Обновляем положение и ширину selectedView после настройки всех кнопок
        if let selectedDay = selectedDayIndex, currentWeekIndex == selectedWeekIndex {
            self.weekIndex = currentWeekIndex
            let selectedButton = buttonArray[selectedDay]
            // Устанавливаем правильную ширину и положение selectedView
            DispatchQueue.main.async {
                self.widthConstraint.constant = selectedButton.frame.width
                self.leadingConstraint.constant = selectedButton.frame.origin.x
                self.contentView.layoutIfNeeded()
            }
        } else {
            // Если нет активной кнопки, скрываем selectedView
            widthConstraint.constant = 0
            leadingConstraint.constant = 0
        }
    }


}

private extension WeekCell {
    func setupLayout() {
        setupStack()
        configureSelectedView()
    }
    
    func setupStack() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func configureSelectedView() {
        selectedView.backgroundColor = AccentColors.selectedViewColor
        selectedView.layer.cornerRadius = 16
        stackView.addSubview(selectedView)
        selectedView.translatesAutoresizingMaskIntoConstraints = false
        
        leadingConstraint = selectedView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
        widthConstraint = selectedView.widthAnchor.constraint(equalToConstant: 0)
        leadingConstraint.isActive = true
        widthConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            selectedView.topAnchor.constraint(equalTo: topAnchor),
            selectedView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
