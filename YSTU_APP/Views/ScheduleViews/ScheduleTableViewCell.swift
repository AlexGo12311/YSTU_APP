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
    
    
    // MARK: - Time view
    private var timeView = TimeView()
    
    // MARK: - Cource view things
    private var courseView = CourseView()
    
    
    // MARK: - Init
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
        addSubview(cellView)
        
        cellView.addSubview(timeView)
        timeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            timeView.topAnchor.constraint(equalTo: cellView.topAnchor),
            timeView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            timeView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        cellView.addSubview(courseView)
        courseView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            courseView.leadingAnchor.constraint(equalTo: timeView.trailingAnchor, constant: 16),
            courseView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -28),
            courseView.topAnchor.constraint(equalTo: cellView.topAnchor),
            courseView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
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
