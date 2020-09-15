//
//  LoginMetricEvent.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import Foundation
import MetricExampleCore

extension MetricEvent {
    
    /// Пользователь перешел на экран авторизации
    static var openLogin: MetricEvent {
        MetricEvent(name: "open_login_screen")
    }

    /// Пользователь ввел логин и пароль и инициировал авторизацию.
    ///
    /// - Parameter success: Успешность запроса.
    /// - Returns: Событие метрики.
    static func authorization(success: Bool) -> MetricEvent {
        MetricEvent(
            name: "authorization",
            values: ["success": success]
        )
    }
}
