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
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()

    private let selectedView = UIView()
    
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
        dates.enumerated().forEach {
            let button = DayButton(date: $0.element)
            button.tag = $0.offset
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
}

private extension WeekCell {
    func setupLayout() {
        setupStack()
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
}
