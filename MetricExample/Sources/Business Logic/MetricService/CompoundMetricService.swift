//
//  CompoundMetricService.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import MetricExampleCore

/// Объединяет несколько MetricService в один
public final class CompoundMetricService: MetricService {
    
    private let metricServices: [MetricService]

    public init(metricServices: [MetricService]) {
        self.metricServices = metricServices
    }

    public func send(event: MetricEvent) {
        metricServices.forEach { $0.send(event: event) }
    }
}
