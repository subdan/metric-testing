//
//  ProcessInfo+extension.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import Foundation

extension ProcessInfo {
    
    var isUITesting: Bool {
        arguments.contains("--UI-TESTING")
    }
    
    var sendMetricsToPasteboard: Bool {
        arguments.contains("--SEND-METRICS-TO-PASTEBOARD")
    }
}
