//
//  MetricEvent.swift
//  MetricExampleCore
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import Foundation

/// Событие аналитики
public struct MetricEvent: Equatable {

    /// Название
    public let name: String
    
    /// Атрибуты
    public let values: [String: AnyHashable]?

    public init(name: String, values: [String: AnyHashable]? = nil) {
        self.name = name
        self.values = values
    }
    
    /// Пытается создать объект MetricEvent из словаря
    public init?(from dict: NSDictionary) {
        guard let eventName = dict["name"] as? String else { return nil }

        self = MetricEvent(
            name: eventName,
            values: dict["values"] as? [String: AnyHashable])
    }
    
    /// Представляет событие в виде словаря для передачи в JSONSerialization.data(withJSONObject:)
    public var asJSONObject: NSDictionary {
        return [
            "name": name,
            "values": values ?? [:]
        ]
    }
}
