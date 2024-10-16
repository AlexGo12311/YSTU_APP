//
//  WeekCell.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 11.10.2024.
//

import UIKit

class WeekCell: UICollectionViewCell {
    static let identifier = "WeekCell"
    
    @objc func buttonTapped(_ sender: DayButton) {
        print("\(sender.tag) - button tag")
        widthConstraint.constant = stackView.arrangedSubviews[sender.tag].frame.width
        leadingConstraint.constant = stackView.arrangedSubviews[sender.tag].frame.origin.x
        
        UIView.animate(withDuration: 0.2) {
            self.stackView.layoutIfNeeded()
            self.buttonArray.forEach { button in
                let isActive = (button == sender)
                
                UIView.transition(with: button, duration: 0.3, options: .transitionCrossDissolve, animations: { button.isActive = isActive } )
                
            }
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
    func configure(with dates: [Date]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        buttonArray.removeAll()
        dates.enumerated().forEach {
            let button = DayButton(date: $0.element)
            button.tag = $0.offset
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            buttonArray.append(button)
            stackView.addArrangedSubview(button)
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
        selectedView.backgroundColor = AccentColors.testColor
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
