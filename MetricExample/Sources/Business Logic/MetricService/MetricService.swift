//
//  MetricService.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import MetricExampleCore

/// Сервис отправки событий в аналитику
public protocol MetricService {
    
    /// Отправка события
    func send(event: MetricEvent)
    
}
