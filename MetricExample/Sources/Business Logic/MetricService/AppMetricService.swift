//
//  AppMetricService.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import Foundation
import MetricExampleCore
//Код заккоментирован потому что AppMetrica не подключена проекту
//import YandexMobileMetrica

open class AppMetricService: MetricService {

//    public init(configuration: YMMYandexMetricaConfiguration) {
//        YMMYandexMetrica.activate(with: configuration)
//    }

    open func send(event: MetricEvent) {
//        YMMYandexMetrica.reportEvent(event.name, parameters: event.values, onFailure: nil)
    }
}
