//
//  CurrentWeatherRowViewModel.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import Foundation
import SwiftUI
import Combine

struct CurrentWeatherRowViewModel {
    private let item: CurrentWeatherForecastResponse
    
    var temperature: String {
        return "\(Int(item.main.temp))°"
    }
    
    var maxTemperature: String {
        return "\(Int(item.main.tempMax))°"
    }
    
    var minTemperature: String {
        return "\(Int(item.main.tempMin))°"
    }
    
    var humidity: String {
        return "\(item.main.humidity)%"
    }
    
    var city: String {
        return item.name
    }
    
    var summary: String {
        // FIXME: Look out for that optional.
        return item.weather.first!.weatherDescription.capitalizingFirstLetter()
    }
    
    var feelsLikeTemperature: String {
        return "\(Int(item.main.feelsLike))°"
    }
    
    var pressure: String {
        return "\(item.main.pressure) hPa"
    }
    
    var sunriseTime: String {
        let unixTime = Double(item.sys.sunrise)
        let date = Date(timeIntervalSince1970: unixTime)
        return timeFormatter.string(from: date)
    }
    
    var sunsetTime: String {
        let unixTime = Double(item.sys.sunset)
        let date = Date(timeIntervalSince1970: unixTime)
        return timeFormatter.string(from: date)
    }
    
    init(item: CurrentWeatherForecastResponse) {
        self.item = item
    }
}
