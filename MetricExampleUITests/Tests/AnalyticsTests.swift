//
//  AnalyticsTests.swift
//  MetricExampleUITests
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import XCTest

final class AnalyticsTests: TestCaseBase {
    
    private let loginScreen = LoginScreen()
    private let menuScreen = MenuScreen()
    
    // MARK: - Login
    
    func testLoginSuccess() {
        launchApp(with: AppLaunchParameters(sendMetricsToPasteboard: true))
        
        analytics.assertContains(name: "open_login_screen")
        
        loginScreen.login(success: true)
        
        analytics.assertContains("authorization", ["success": true])
    }
    
    func testLoginFailed() {
        launchApp(with: AppLaunchParameters(sendMetricsToPasteboard: true))
        
        analytics.assertContains(name: "open_login_screen")
        
        loginScreen.login(success: false)
        
        analytics.assertContains("authorization", ["success": false])
    }
    
    // MARK: - Main Menu
    
    func testOpenMenu() {
        launchApp(with: AppLaunchParameters(sendMetricsToPasteboard: true))
        
        loginScreen.login(success: true)
        waitForElement(menuScreen.title)
        
        analytics.assertContains(name: "open_menu_screen")
    }
    
    func testMenuSelection() {
        launchApp(with: AppLaunchParameters(sendMetricsToPasteboard: true))
        
        loginScreen.login(success: true)
        waitForElement(menuScreen.title)
        menuScreen.profileCell.tap()
        
        analytics.assertContains("menu_item_selected", ["name": "Профиль"])
        
        menuScreen.messagesCell.tap()
        
        analytics.assertContains("menu_item_selected", ["name": "Сообщения"])
    }
}
