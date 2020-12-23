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
        // FIXME: Look out for that optional.
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
    
    var time: String {
        let unixTime = item.dt
        let date = Date(timeIntervalSince1970: unixTime)
        
        return timeFormatter.string(from: date)
    }
    
    
    
    init(item: CurrentWeatherForecastResponse) {
        self.item = item
    }
}
