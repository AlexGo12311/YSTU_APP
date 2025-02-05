import UIKit

final class ScheduleHeader: UIView {
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Medium.size(of: 14)
        label.textColor = AccentColors.normalColor
        label.text = "Time"
        return label
    }()
    
    let courceLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Medium.size(of: 14)
        label.textColor = AccentColors.normalColor
        label.text = "Cource"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AccentColors.bgColor
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScheduleHeader {
    private func configure() {
        setupTimeLabel()
        setupCourceLabel()
    }
    
    func setupTimeLabel() {
        addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 28),
            timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6)
        ])
    }
    
    func setupCourceLabel() {
        addSubview(courceLabel)
        courceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            courceLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 34 + 4),
            courceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6)
        ])
    }
}

