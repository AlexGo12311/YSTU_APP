//
//  ScheduleController.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 10.09.2024.
//

import UIKit

final class ScheduleController: BaseController {
    
    private let navBar = ScheduleNavBar()
    
    let scheduleFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.identifier)
        table.backgroundColor = AccentColors.bgColor
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getSchedule()
//        getGruopList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navBar.scrollToCurrentWeek()
        navBar.selectToday()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.layer.cornerRadius = 24
        navBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        setShadow(navBar)
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 134 + view.safeAreaInsets.top)
        ])
    }
    
    private func getSchedule() {
        APICaller.shared.getSchedule { results in
            switch results {
            case .success(let items):
                print(items)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getGruopList() {
        APICaller.shared.getGroupsList { results in
            switch results {
            case .success(let items):
                print(items)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func addHeaderView() {
        let header = ScheduleHeader(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 40))
        scheduleFeedTable.tableHeaderView = header
    }
    
    override func addViews() {
        super.addViews()
        view.addSubview(scheduleFeedTable)
        view.addSubview(navBar)
    }
    
    override func layoutViews() {
        super.layoutViews()
        addHeaderView()
        scheduleFeedTable.translatesAutoresizingMaskIntoConstraints = false
        scheduleFeedTable.contentInsetAdjustmentBehavior = .never
         
        NSLayoutConstraint.activate([
            scheduleFeedTable.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -12),
            scheduleFeedTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scheduleFeedTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scheduleFeedTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    override func configure() {
        super.configure()
        scheduleFeedTable.delegate = self
        scheduleFeedTable.dataSource = self
        scheduleFeedTable.estimatedRowHeight = 137 // Примерное значение для улучшения производительности
        scheduleFeedTable.rowHeight = UITableView.automaticDimension
    }
    
    
}

extension ScheduleController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as? ScheduleTableViewCell else { return UITableViewCell() }
            cell.configureTimeView(start: "08:30", end: "11:40")
            cell.configureCourseView(name: "Объектно-ориентированное программирование (ИСТ)", type: "Лекция", room: "Дистант", teacher: "ст.преп. Самсонова ЕС")
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as? ScheduleTableViewCell else { return UITableViewCell() }
            cell.configureTimeView(start: "15:40", end: "17:10")
            cell.configureCourseView(name: "Математика (ВМ)", type: "Лекция", room: "А-237", teacher: "Ройтенберг Владимир Шлеймович")
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as? ScheduleTableViewCell else { return UITableViewCell() }
            cell.configureTimeView(start: "17:30", end: "19:00")
            cell.configureCourseView(name: "Физика", type: "Лекция", room: "А-237", teacher: "Морозов ВВ")
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as? ScheduleTableViewCell else { return UITableViewCell() }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16 // Создаст отступ перед секцией, тем самым увеличив расстояние между ячейками
    }
}
