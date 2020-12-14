//
//  OpenWeatherAPI.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import Foundation

// MARK: - OpenWeatherAPI
extension WeatherWebService {
    struct OpenWeatherAPI {
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        static let path = "/data/2.5"
        // FIXME: If you want to test drive the app, add your OpenWeatherMap API key here. Go to https://home.openweathermap.org/users/sign_up. It will take you 2 minutes.
        static let key = Secrets.openWeatherMapAPIKey
    }
    
    func makeCurrentDayForecastComponents(withCity city: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenWeatherAPI.scheme
        components.host = OpenWeatherAPI.host
        components.path = OpenWeatherAPI.path + "/weather"
        
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: OpenWeatherAPI.key),
        ]
        
        return components
    }
}
