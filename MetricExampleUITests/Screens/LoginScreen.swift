//
//  LoginScreen.swift
//  MetricExampleUITests
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import XCTest

final class LoginScreen {
    
    let app: XCUIApplication
    
    init(app: XCUIApplication = XCUIApplication()) {
        self.app = app
    }
    
    /// Поле логина
    var loginField: XCUIElement { app.textFields["email"] }
    
    /// Поле пароля
    var passwordField: XCUIElement { app.secureTextFields["password"] }
    
    /// Кнопка "Войти"
    var loginButton: XCUIElement { app.buttons["login"] }
    
    func login(success: Bool) {
        loginField.tap()
        loginField.typeText(success ? "1" : "0")
        
        passwordField.tap()
        passwordField.typeText(success ? "1" : "0")
        
        loginButton.tap()
    }
}
