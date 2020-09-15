//
//  AnalyticsTestBase.swift
//  MetricExampleUITests
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import XCTest
import MetricExampleCore

final class AnalyticsTestBase {

    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
        UIPasteboard.general.string = ""
    }

    /// Проверяет количество отправленных событий
    func assertCount(
        _ count: Int,
        file: StaticString = #file,
        line: UInt = #line) {

        let records = extractAnalytics()

        XCTAssertEqual(
            records.count,
            count,
            "Количество не совпадает. Отправлено \(records.count), а ожидалось \(count)",
            file: file,
            line: line)
    }

    /// Проверяет наличие события с указанным именем
    /// - Parameters:
    ///   - name: Название события
    ///   - count: Количество событий с указанным именем. По умолчанию равно 1.
    func assertContains(
        name: String,
        count: Int = 1,
        file: StaticString = #file,
        line: UInt = #line) {

        let records = extractAnalytics()

        XCTAssertEqual(
            records.filter { $0.name == name }.count,
            count,
            "Событие с именем \(name) не найдено.",
            file: file,
            line: line)
    }

    /// Проверяет наличие конкретного события указанное количество раз
    /// - Parameters:
    ///   - name: Название события
    ///   - values: Параметры события
    ///   - count: Количество событий
    func assertContains(
        _ name: String,
        _ values: [String: AnyHashable],
        count: Int = 1,
        file: StaticString = #file,
        line: UInt = #line) {
        
        let metric = MetricEvent(name: name, values: values)
        let records = extractAnalytics()

        XCTAssertEqual(
            records.filter { $0 == metric }.count,
            count,
            "Событие \(metric.name) с параметрами \(metric.values?.description ?? "-") не найдено.",
            file: file,
            line: line)
    }

    /// Проверяет последнее событие
    /// - Parameters:
    ///   - metric: Событие типа MetricEvent
    func assertLast(
        metric: MetricEvent,
        file: StaticString = #file,
        line: UInt = #line) {

        let records = extractAnalytics()

        XCTAssertEqual(
            records.last,
            metric,
            "Последнее событие ожидалось \(metric), а получено \(records.last.debugDescription)",
            file: file,
            line: line)
    }

    /// Проверяет, что последнее событие имеет указанное имя
    /// - Parameters:
    ///   - metric: Имя события
    func assertLast(
        name: String,
        file: StaticString = #file,
        line: UInt = #line) {

        let records = extractAnalytics()

        XCTAssertEqual(
            records.last?.name,
            name,
            "Последнее событие ожидалось \(name), а получено \(records.last?.name ?? "-")",
            file: file,
            line: line)
    }
    
    /// Очищает список событий аналитики
    func clearMetrics() {
        UIPasteboard.general.string = ""
    }

    /// Возвращает список всех событий аналитики произошедших с момента запуска приложения
    func extractAnalytics() -> [MetricEvent] {
        let string = UIPasteboard.general.string!
        if let events = try? decodeMetricEvents(from: string) {
            return events
        } else {
            return []
        }
    }

    /// Преобразует JSON строку с массивом событий в массив объектов [MetricEvent]
    private func decodeMetricEvents(from string: String) throws -> [MetricEvent] {
        guard !string.isEmpty else { return [] }
        let data = Data(string.utf8)

        guard let arrayOfEvents: [NSDictionary] = try JSONSerialization.jsonObject(with: data) as? [NSDictionary] else {
            return []
        }

        return arrayOfEvents.compactMap { MetricEvent(from: $0) }
    }
}
