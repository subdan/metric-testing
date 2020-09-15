//
//  AppLaunchParameters.swift
//  MetricExampleUITests
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

/// Параметры запуска приложения для UI-тестирования
struct AppLaunchParameters {
    
    /// Отправлять аналитику в UIPasteboard
    private let sendMetricsToPasteboard: Bool
    
    init(sendMetricsToPasteboard: Bool = false) {
        self.sendMetricsToPasteboard = sendMetricsToPasteboard
    }
    
    var launchArguments: [String] {
        var arguments = ["--UI-TESTING"]
        if sendMetricsToPasteboard {
            arguments.append("--SEND-METRICS-TO-PASTEBOARD")
        }
        return arguments
    }
}
