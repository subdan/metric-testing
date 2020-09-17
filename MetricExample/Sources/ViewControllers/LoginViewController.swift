//
//  LoginViewController.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private var loginField: UITextField!
    @IBOutlet private var passwordField: UITextField!
    
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
        
        title = "Вход"
        
        metricService.send(event: .openLogin)
    }
    
    @IBAction private func login() {
        if loginField.text == "login" && passwordField.text == "password" {
            metricService.send(event: .authorization(success: true))
            openMenu()
        } else {
            metricService.send(event: .authorization(success: false))
            showError()
        }
    }
    
    private func openMenu() {
        let vc = MenuViewController()
        show(vc, sender: nil)
    }
    
    private func showError() {
        let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: {
            _ in alert.dismiss(animated: true)
        })
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
