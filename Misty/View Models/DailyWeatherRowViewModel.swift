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
    
    var date: String {
        return dateFormatter.string(from: item.date)
    }
    
    var temperatureUnitString: String {
        if UserDefaults.standard.integer(forKey: "unit_type") == 2 {
            return "K"
        }
        
        return "°"
    }
    
    var temp: String {
        return "\(Int(item.main.temp))\(temperatureUnitString)"
    }
    
    var icon: Image {
        WeatherWebService.OpenWeatherAPI.getIconImage(for: item.weather.first!.icon)
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
