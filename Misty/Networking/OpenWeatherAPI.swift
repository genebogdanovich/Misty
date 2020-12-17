//
//  OpenWeatherAPI.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import Foundation
import CoreLocation

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
    
    func makeCurrentDayForecastComponents(withCoordinate coordinate: CLLocationCoordinate2D) -> URLComponents {
        
        
        
        var components = URLComponents()
        components.scheme = OpenWeatherAPI.scheme
        components.host = OpenWeatherAPI.host
        components.path = OpenWeatherAPI.path + "/weather"
        
        let unitsURLQueryItem: URLQueryItem = {
            if UserDefaults.standard.integer(forKey: "unit_type") == 0 {
                return URLQueryItem(name: "units", value: "metric")
            } else if UserDefaults.standard.integer(forKey: "unit_type") == 1 {
                return URLQueryItem(name: "units", value: "imperial")
            } else if UserDefaults.standard.integer(forKey: "unit_type") == 2 {
                return URLQueryItem(name: "units", value: "kelvin")
            } else {
                fatalError()
            }
        }()
        
        components.queryItems = [
            URLQueryItem(name: "lat", value: coordinate.latitude.description),
            URLQueryItem(name: "lon", value: coordinate.longitude.description),
            URLQueryItem(name: "mode", value: "json"),
            unitsURLQueryItem,
            URLQueryItem(name: "APPID", value: OpenWeatherAPI.key),
        ]
        
        return components
    }
}
