//
//  TestCaseBase.swift
//  MetricExampleUITests
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import XCTest

class TestCaseBase: XCTestCase {
    
    var app: XCUIApplication!
    var analytics: AnalyticsTestBase!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        analytics = AnalyticsTestBase(app: app)
    }
    
    /// Запускает приложение для UI-тестирования с указанными параметрами.
    func launchApp(with parameters: AppLaunchParameters = AppLaunchParameters()) {
        app.launchArguments = parameters.launchArguments
        app.launch()
    }
    
    /// Ожидает пока элемент не появится (Свойство exists у XCUIElement не станет равно true)
    func waitForElement(_ element: XCUIElement, _ timeout: TimeInterval = 0.5) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expect(element, existsPredicate, timeout)
    }
    
    private func expect(_ object: XCUIElement, _ predicate: NSPredicate, _ timeout: TimeInterval) {
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: object)
        XCTWaiter(delegate: nil).wait(for: [expectation], timeout: timeout)
    }
}
