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
        return "\(Int(item.main.temperature))°"
    }
    
    var maxTemperature: String {
        return "\(Int(item.main.maxTemperature))°"
    }
    
    var minTemperature: String {
        return "\(Int(item.main.minTemperature))°"
    }
    
    var humidity: String {
        return "\(Int(item.main.humidity))%"
    }
    
    var location: String {
        return item.name
    }
    
    var summary: String {
        return item.weather.first!.weatherDescription.capitalizingFirstLetter()
    }
    
    var feelsLikeTemperature: String {
        return "\(Int(item.main.feelsLike))°"
    }
    
    var pressure: String {
        return "\(Int(item.main.pressure)) hPa"
    }
    
    var sunriseTime: String {
        let unixTime = item.sys.sunrise
        let date = Date(timeIntervalSince1970: unixTime)
        
        return timeFormatter.string(from: date)
    }
    
    var sunsetTime: String {
        let unixTime = item.sys.sunset
        let date = Date(timeIntervalSince1970: unixTime)
        
        return timeFormatter.string(from: date)
    }
    
    var windSpeed: String {
        return "\(Int(item.wind.speed)) m/s ESE"
    }
    
    var icon: Image {
        WeatherWebService.OpenWeatherAPI.getIconImage(for: item.weather.first!.icon)
    }
    
    var time: String {
        let unixTime = item.dt
        let date = Date(timeIntervalSince1970: unixTime)
        
        return timeFormatter.string(from: date)
    }
    
    init(item: CurrentWeatherForecastResponse) {
        self.item = item
    }
}
