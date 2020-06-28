//
//  Countdown.swift
//  WWDC2020 Countdown
//
//  Created by temp on 28.06.2020.
//

import SwiftUI
import Combine

final class Countdown: ObservableObject {
    @Published private(set) var components = DateComponents(day: 10, hour: 13, minute: 12, second: 45)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    
    init() {
        timer
            .autoconnect()
            .map { _ in
                self.wwdc2020CountdownComponents()
        }
        .sink {
            [weak self] in
            self?.components = $0
        }
        .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    deinit {
        for cancell in cancellables {
            cancell.cancel()
        }
    }
    
    func wwdc2020CountdownComponents() -> DateComponents {
        let calendar = Calendar.autoupdatingCurrent
        let wwdc2020Start: Date = {
            let calendar = Calendar.autoupdatingCurrent
            let timeZone: TimeZone = TimeZone(abbreviation: "PDT")!
            let year = 2020
            let month = 6
            let day = 22
            let hour = 10
            let minute = 0
            let components = DateComponents(calendar: calendar, timeZone: timeZone, year: year, month: month, day: day, hour: hour, minute: minute)
            return calendar.date(from: components)!
        }()
        
        let now = Date()
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: now, to: wwdc2020Start)
        return components
    }
}
