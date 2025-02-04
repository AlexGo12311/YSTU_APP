//
//  CourseView.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 06.01.2025.
//
import UIKit

class CourseView: UIView {
    private var courseNameLabel: UILabel = {
        var label = UILabel()
        label.textColor = AccentColors.ordinaryTextColor
        label.font = .Montserrat.SemiBold.size(of: 16)
        label.numberOfLines = 0
        
        return label
    }()
    
    private var courceTypeLabel: UILabel = {
        var label = UILabel()
        label.textColor = AccentColors.normalColor
        label.font = .Montserrat.Medium.size(of: 12)
        
        return label
    }()
    
    private var locationImageView: UIImageView = {
        let image = UIImageView(image: UIImage(resource: .marker))
        return image
    }()
    
    private var roomLabel: UILabel = {
        var label = UILabel()
        label.textColor = AccentColors.ordinaryTextColor
        label.font = .Montserrat.Regular.size(of: 12)
        label.numberOfLines = 0
        
        return label
    }()
    
    private var teacherImage: UIImageView = {
        var imageView = UIImageView()
        var stdImage = UIImage(systemName: "person.crop.circle.fill")
        stdImage?.withRenderingMode(.alwaysOriginal)
        
        imageView.image = stdImage
        return imageView
    }()
    
    private var teacherNameLabel: UILabel = {
        var label = UILabel()
        label.textColor = AccentColors.ordinaryTextColor
        label.font = .Montserrat.Regular.size(of: 12)
        label.numberOfLines = 0
        
        return label
    }()
    
    init() {
        self.courseNameLabel.text = "n/a"
        self.courceTypeLabel.text = "n/a"
        self.roomLabel.text = "n/a"
        self.teacherNameLabel.text = "n/a"
        super.init(frame: .zero)
        
        configureLayout()
        self.layer.cornerRadius = 16
        self.backgroundColor = AccentColors.interfaceColor
        setShadow(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(name: String?, type: String?, room: String?, teacher: String?) {
        guard let name = name else { return }
        courseNameLabel.text = name
        
        guard let type = type else { return }
        courceTypeLabel.text = type
        
        guard let room = room else { return }
        roomLabel.text = room
        
        guard let teacher = teacher else { return }
        teacherNameLabel.text = teacher
    }
}

private extension CourseView {
    func configureLayout() {
        configureCourseNameLabel()
        configureCourceTypeLabel()
        configureRoomLabel()
        configureTeacherNameLabel()

        // Привязка нижнего элемента к нижней границе
        NSLayoutConstraint.activate([
            teacherNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }

    func configureCourseNameLabel() {
        addSubview(courseNameLabel)
        courseNameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            courseNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            courseNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            courseNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }

    func configureCourceTypeLabel() {
        addSubview(courceTypeLabel)
        courceTypeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            courceTypeLabel.topAnchor.constraint(equalTo: courseNameLabel.bottomAnchor, constant: 4),
            courceTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            courceTypeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }

    func configureRoomLabel() {
        addSubview(roomLabel)
        roomLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            roomLabel.topAnchor.constraint(equalTo: courceTypeLabel.bottomAnchor, constant: 16),
            
            roomLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])

        addSubview(locationImageView)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            locationImageView.centerYAnchor.constraint(equalTo: roomLabel.centerYAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            locationImageView.widthAnchor.constraint(equalToConstant: 16),
            locationImageView.heightAnchor.constraint(equalToConstant: 16),
            roomLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 10)
        ])
    }

    func configureTeacherNameLabel() {
        addSubview(teacherNameLabel)
        teacherNameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            teacherNameLabel.topAnchor.constraint(equalTo: roomLabel.bottomAnchor, constant: 8),
            teacherNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])

        addSubview(teacherImage)
        teacherImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            teacherImage.centerYAnchor.constraint(equalTo: teacherNameLabel.centerYAnchor),
            teacherImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            teacherImage.widthAnchor.constraint(equalToConstant: 16),
            teacherImage.heightAnchor.constraint(equalToConstant: 16),
            teacherNameLabel.leadingAnchor.constraint(equalTo: teacherImage.trailingAnchor, constant: 10)
        ])
    }
}


//#Preview("CourseView", traits: .fixedLayout(width: 250, height: 137)) {
//    CourseView(courseNameLabel: "Математика", courceTypeLabel: "Лекция", roomLabel: "А-409", teacherNameLabel: "Ройтенберг В.Ш.")
//}
