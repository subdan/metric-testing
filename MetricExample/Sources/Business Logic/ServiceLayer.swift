//
//  ServiceLayer.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import Foundation
//import YandexMobileMetrica

final class ServiceLayer {
    
    static let shared = ServiceLayer()
    
    private(set) lazy var metricService: MetricService = {
        if ProcessInfo.processInfo.isUITesting {
            return MetricServiceForUITests()
        } else {
            fatalError()
            //Код заккоментирован потому что AppMetrica не подключена проекту
//            let config = YMMYandexMetricaConfiguration(apiKey: "APP_METRICA_API_KEY")
//            return AppMetricService(configuration: config)
        }
    }()
}
