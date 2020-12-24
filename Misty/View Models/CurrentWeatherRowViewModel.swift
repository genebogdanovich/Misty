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
    
    var temperatureUnitString: String {
        if UserDefaults.standard.integer(forKey: "unit_type") == 2 {
            return "K"
        }
        
        return "°"
    }
    
    var temperature: String {
        return "\(Int(item.main.temperature))\(temperatureUnitString)"
    }
    
    var maxTemperature: String {
        return "\(Int(item.main.maxTemperature))\(temperatureUnitString)"
    }
    
    var minTemperature: String {
        return "\(Int(item.main.minTemperature))\(temperatureUnitString)"
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
        return "\(Int(item.main.feelsLike))\(temperatureUnitString)"
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
        var unitString = "m/s"
        
        if UserDefaults.standard.integer(forKey: "unit_type") == 1 {
            unitString = "mph"
        }
        
        let angle = item.wind.deg
        return "\(Int(item.wind.speed)) \(unitString) \(angle.direction)"
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
