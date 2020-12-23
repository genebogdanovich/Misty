//
//  WeeklyForecastResponse.swift
//  Misty
//
//  Created by Gene Bogdanovich on 22.12.20.
//

import Foundation

struct WeeklyForecastResponse: Codable {
    let list: [Item]
    
    struct Item: Codable {
        let date: Date
        let main: MainClass
        let weather: [Weather]
        
        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case main
            case weather
        }
    }
    
    struct MainClass: Codable {
        let temp: Double
        let maxTemp: Double
        let minTemp: Double
        
        enum CodingKeys: String, CodingKey {
            case temp
            case maxTemp = "temp_max"
            case minTemp = "temp_min"
        }
    }
    
    struct Weather: Codable {
        let main: MainEnum
        let weatherDescription: String
        let icon: String
        
        enum CodingKeys: String, CodingKey {
            case main
            case weatherDescription = "description"
            case icon
        }
    }
    
    enum MainEnum: String, Codable {
        case clear = "Clear"
        case clouds = "Clouds"
        case rain = "Rain"
        case snow = "Snow"
    }
}
