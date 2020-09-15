//
//  ServiceLayer.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import Foundation

final class ServiceLayer {
    
    static let shared = ServiceLayer()
    
    private(set) lazy var metricService: MetricService = {
        var metricServices: [MetricService] = []
        
        if ProcessInfo.processInfo.isUITesting {
            metricServices.append(MetricServiceForUITests())
        } else {
            if let apiKey = Bundle.main.object(forInfoDictionaryKey: "APP_METRICA_API_KEY") as? String {
//                Код заккоментирован потому что AppMetrica не подключена проекту
//                let config = YMMYandexMetricaConfiguration(apiKey: apiKey) {
//                config.crashReporting = false
//                let appMetricService = AppMetricService(configuration: config)
                let appMetricService = AppMetricService()
                metricServices.append(appMetricService)
            }
        }
        
        return CompoundMetricService(metricServices: metricServices)
    }()
}
