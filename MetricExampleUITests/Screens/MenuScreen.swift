//
//  MenuScreen.swift
//  MetricExampleUITests
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import Foundation

import XCTest

final class MenuScreen {
    
    let app: XCUIApplication
    
    init(app: XCUIApplication = XCUIApplication()) {
        self.app = app
    }
    
    /// Текст в навбаре
    var title: XCUIElement { app.navigationBars.staticTexts["Меню"] }
    
    /// Ячейка «Профиль»
    var profileCell: XCUIElement { app.cells.staticTexts["Профиль"] }
    
    /// Ячейка «Сообщения»
    var messagesCell: XCUIElement { app.cells.staticTexts["Сообщения"] }
}
