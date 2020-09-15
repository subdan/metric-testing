//
//  MenuViewController.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import UIKit

final class MenuViewController: UITableViewController {

    private let metricService: MetricService
    
    init(metricService: MetricService = ServiceLayer.shared.metricService) {
        self.metricService = metricService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Меню"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        metricService.send(event: .openMenu)
    }
}

// MARK: - UITableViewDelegate

extension MenuViewController {
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 { // Профиль
            metricService.send(event: .menuItemSelected(name: "Профиль"))
        } else if indexPath.row == 1 { // Сообщения
            metricService.send(event: .menuItemSelected(name: "Сообщения"))
        }
    }
}

// MARK: - UITableViewDataSource

extension MenuViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        if indexPath.row == 0 {
            cell.textLabel?.text = "Профиль"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "Сообщения"
        }
        return cell
    }
}
