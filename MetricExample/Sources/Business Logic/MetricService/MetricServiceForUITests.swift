//
//  MetricServiceForUITests.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import Foundation
import MetricExampleCore
import UIKit

final class MetricServiceForUITests: MetricService {

    private var metricEvents: [MetricEvent] = []

    // MARK: - MetricService

    func send(event: MetricEvent) {
        guard ProcessInfo.processInfo.isUITesting, ProcessInfo.processInfo.sendMetricsToPasteboard else {
            return
        }
        
        if UIPasteboard.general.string == nil || UIPasteboard.general.string?.isEmpty == true {
            metricEvents = []
        }

        metricEvents.append(event)

        if let metricsString = try? encodeMetricEvents(metricEvents) {
            UIPasteboard.general.string = metricsString
        }
    }

    private func encodeMetricEvents(_ events: [MetricEvent]) throws -> String {
        let arrayOfEvents: [NSDictionary] = events.map { $0.asJSONObject }
        let data = try JSONSerialization.data(withJSONObject: arrayOfEvents)
        return String(decoding: data, as: UTF8.self)
    }
}
