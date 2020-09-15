//
//  MenuMetricEvent.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import Foundation
import MetricExampleCore

extension MetricEvent {
    
    /// Пользователь перешел на экран с меню
    static var openMenu: MetricEvent {
        MetricEvent(name: "open_menu_screen")
    }
    
    /// Пользователь выбрал пункт в меню
    /// - Parameter name Название пунка меню
    static func menuItemSelected(name: String) -> MetricEvent {
        MetricEvent(
            name: "menu_item_selected",
            values: ["name": name]
        )
    }
}
