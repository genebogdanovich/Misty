//
//  OpenWeatherAPI.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import Foundation
import CoreLocation
import SwiftUI

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
    
    func makeWeeklyForecastComponents(withCoordinate coordinate: CLLocationCoordinate2D) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenWeatherAPI.scheme
        components.host = OpenWeatherAPI.host
        components.path = OpenWeatherAPI.path + "/forecast"
        
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

extension WeatherWebService.OpenWeatherAPI {
    static func getIconImage(for string: String) -> Image {
        switch string {
        case "01d":
            return Image(systemName: "sun.max.fill")
                .renderingMode(.template)
        case "01n":
            return Image(systemName: "moon.fill")
                .renderingMode(.template)
        case "02d":
            return Image(systemName: "cloud.sun.fill")
                .renderingMode(.template)
        case "02n":
            return Image(systemName: "cloud.moon.fill")
                .renderingMode(.template)
        case "03d", "03n":
            return Image(systemName: "cloud.fill")
                .renderingMode(.template)
        case "04d", "04n":
            return Image(systemName: "smoke.fill")
                .renderingMode(.template)
        case "09d", "09n":
            return Image(systemName: "cloud.heavyrain.fill")
                .renderingMode(.template)
        case "10d":
            return Image(systemName: "cloud.sun.rain.fill")
                .renderingMode(.template)
        case "10n":
            return Image(systemName: "cloud.moon.rain.fill")
                .renderingMode(.template)
        case "11d", "11n":
            return Image(systemName: "cloud.bolt.fill")
                .renderingMode(.template)
        case "13d", "13n":
            return Image(systemName: "snow")
                .renderingMode(.template)
        case "50d", "50n":
            return Image(systemName: "cloud.fog.fill")
                .renderingMode(.template)
        default:
            return Image(systemName: "questionmark")
        }
    }
}

enum WindDirection: String, CaseIterable {
    case n, nne, ne, ene, e, ese, se, sse, s, ssw, sw, wsw, w, wnw, nw, nnw
}

extension WindDirection: CustomStringConvertible {
    init<D: BinaryFloatingPoint>(_ direction: D) {
        self = Self.allCases[Int((direction.angle + 11.25).truncatingRemainder(dividingBy: 360) / 22.5)]
    }
    
    var description: String { rawValue.uppercased() }
}

extension BinaryFloatingPoint {
    var angle: Self {
        (truncatingRemainder(dividingBy: 360) + 360)
            .truncatingRemainder(dividingBy: 360)
    }
    var direction: WindDirection { .init(self) }
}
