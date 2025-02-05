//
//  ScheduleTableViewCell.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 12.12.2024.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    static let identifier = "ScheduleTableViewCell"
    
    private let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = AccentColors.bgColor
        return view
    }()
    
    private var timeView = TimeView()
    private var courseView = CourseView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        configureCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        cellView.frame = contentView.bounds
    }
    
    func configureTimeView(start: String?, end: String?) {
        guard let start = start, let end = end else { return }
        timeView.updateView(start: start, end: end)
    }

    func configureCourseView(name: String?, type: String?, room: String?, teacher: String?) {
        courseView.updateView(name: name, type: type, room: room, teacher: teacher)
    }
}

private extension ScheduleTableViewCell {
    func configureCellView() {
        contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        cellView.addSubview(timeView)
        timeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            timeView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            timeView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -8),
            timeView.widthAnchor.constraint(equalToConstant: 82)
        ])
        
        cellView.addSubview(courseView)
        courseView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            courseView.leadingAnchor.constraint(equalTo: timeView.trailingAnchor, constant: 4),
            courseView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            courseView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            courseView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -8),
        ])
    }
}

//#Preview("Cell", traits: .fixedLayout(width: 375, height: 137)) {
//    var table = ScheduleTableViewCell(style: .default, reuseIdentifier: "ScheduleTableViewCell")
//    
//    table.configureTimeView(start: "8:30", end: "10:00")
//    table.cofigureCourceView(name: "Математика", type: "Лекция", room: "А-409", teacher: "Ройтенберг В. Ш.")
//    return table
//    
//}
