//
//  DailyWeatherRowViewModel.swift
//  Misty
//
//  Created by Gene Bogdanovich on 22.12.20.
//

import Foundation
import SwiftUI

struct DailyWeatherRowViewModel: Identifiable {
    private let item: WeeklyForecastResponse.Item
    
    var id: String {
        return UUID().uuidString
    }
    
    var day: String {
        return dayFormatter.string(from: item.date)
    }
    
    var month: String {
        return monthFormatter.string(from: item.date)
    }
    
    var temperature: String {
        return "\(Int(item.main.temp))"
    }
    
    var minTemperature: String {
        return "\(Int(item.main.minTemp))"
    }
    
    var maxTemperature: String {
        return "\(Int(item.main.maxTemp))"
    }
    
    // FIXME: Refactor this
    var icon: Image {
        
        switch item.weather.first?.icon {
        case "01d":
            return Image(systemName: "sun.max.fill")
        case "01n":
            return Image(systemName: "moon.fill")
        case "02d":
            return Image(systemName: "cloud.sun.fill")
        case "02n":
            return Image(systemName: "cloud.moon.fill")
        case "03d", "03n":
            return Image(systemName: "cloud.fill")
        case "04d", "04n":
            return Image(systemName: "smoke.fill")
        case "09d", "09n":
            return Image(systemName: "cloud.heavyrain.fill")
        case "10d":
            return Image(systemName: "cloud.sun.rain.fill")
        case "10n":
            return Image(systemName: "cloud.moon.rain.fill")
        case "11d", "11n":
            return Image(systemName: "cloud.bolt.fill")
        case "13d", "13n":
            return Image(systemName: "snow")
        case "50d", "50n":
            return Image(systemName: "cloud.fog.fill")
        default:
            return Image(systemName: "questionmark")
        }
    }
    
    
    
    init(item: WeeklyForecastResponse.Item) {
        self.item = item
    }
}

// Used to hash on just the day in order to produce a single view model for each day when there are multiple items per each day.
extension DailyWeatherRowViewModel: Hashable {
    static func == (lhs: DailyWeatherRowViewModel, rhs: DailyWeatherRowViewModel) -> Bool {
        return lhs.day == rhs.day
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.day)
    }
}
