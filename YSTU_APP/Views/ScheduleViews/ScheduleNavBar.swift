//
//  OverviewNavBar.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 29.09.2024.
//

import UIKit

final class ScheduleNavBar: BaseView {
    func addChooseGroupButtonAction(_ action: Selector, with: Any?) {
        chooseGroupButton.addTarget(with, action: action, for: .touchUpInside)
    }
    
    
    private let currentDate = Date()

    private let baseDate: Date = {
        var calendar = Calendar.current
        
        let startDateOfYear = calendar.date(from: calendar.dateComponents([.year], from: Date()))!
        let startDateOfWeek = calendar.dateInterval(of: .weekOfYear, for: startDateOfYear)!.start
        
        return startDateOfWeek
    }()
    
    let weekView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    func scrollToCurrentWeek() {
        if let currentWeekIndex = getCurrentWeekIndex() {
            let totalItems = self.weekView.numberOfItems(inSection: 0)
            if currentWeekIndex >= 0 && currentWeekIndex < totalItems {
                let indexPath = IndexPath(item: currentWeekIndex, section: 0)
                let layoutAttributes = self.weekView.layoutAttributesForItem(at: indexPath)
                
                if let attributes = layoutAttributes {
                    let targetOffset = CGPoint(x: attributes.frame.origin.x, y: 0)
                    self.weekView.setContentOffset(targetOffset, animated: false)
                }
            }
        }
    }
    
    private func getCurrentWeekIndex() -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekOfYear], from: baseDate, to: Date())
        guard let weekIndex = components.weekOfYear else { return nil }
        
        return weekIndex
    }
    
    private func getDatesForWeek(startDate: Date) -> [Date] {
        var dates = [Date]()
        let calendar = Calendar.current
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: startDate)?.start ?? Date()
        
        for i in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: i, to: startOfWeek) {
                dates.append(date)
            }
        }
        return dates
    }
    
    let chooseGroupButton = ChoosyButton(groupName: "ЦПИ-11")
    
    let todayLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Bold.size(of: 20)
        label.textColor = AccentColors.ordinaryTextColor
        label.text = "Today"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currentDateLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Light.size(of: 14)
        label.textColor = AccentColors.ordinaryTextColor
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"  // Формат даты: Apr 08, 2022
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        let date = Date()  // Текущая дата
        let formattedDate = dateFormatter.string(from: date)
        
        label.text = String(formattedDate)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
}

extension ScheduleNavBar {
    override func addViews() {
        super.addViews()
        addSubview(chooseGroupButton)
        addSubview(currentDateLabel)
        addSubview(todayLabel)
        addSubview(weekView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        // Group choose button
        NSLayoutConstraint.activate([
            chooseGroupButton.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            chooseGroupButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            chooseGroupButton.heightAnchor.constraint(equalToConstant: 30),
            chooseGroupButton.widthAnchor.constraint(equalToConstant: 96)
        ])
        
        // CurrentDate label
        NSLayoutConstraint.activate([
            currentDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            currentDateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60)
        ])
        
        // Today Label
        NSLayoutConstraint.activate([
            todayLabel.topAnchor.constraint(equalTo: currentDateLabel.bottomAnchor, constant: 4),
            todayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        // Week view
        NSLayoutConstraint.activate([
            weekView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 8),
            weekView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            weekView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            weekView.heightAnchor.constraint(equalToConstant: 72)
        ])
    
    }
    
    override func configure() {
        super.configure()
        weekView.register(WeekCell.self, forCellWithReuseIdentifier: WeekCell.identifier)
        weekView.dataSource = self
        weekView.delegate = self

        backgroundColor = AccentColors.interfaceColor
        setShadow(chooseGroupButton)
        chooseGroupButton.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension ScheduleNavBar: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekCell.identifier, for: indexPath) as? WeekCell else { return UICollectionViewCell() }
        let offset = indexPath.item
        let newStartDate = Calendar.current.date(byAdding: .weekOfYear, value: offset, to: baseDate) ?? Date()
        
        let dates = getDatesForWeek(startDate: newStartDate)
        cell.configure(with: dates)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width
        let cellHeight = collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

