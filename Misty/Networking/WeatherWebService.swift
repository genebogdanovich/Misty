//
//  WeatherWebService.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import Foundation
import Combine

// MARK: - WeatherFetchable
/// Describes an object that fetches weather data.
protocol WeatherFetchable {
    func currentWeatherForecast(forCity city: String) -> AnyPublisher<CurrentWeatherForecastResponse, WeatherError>
    
}

// MARK: - WeatherWebService
class WeatherWebService {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - WeatherFetchable Conformance

extension WeatherWebService: WeatherFetchable {
    func currentWeatherForecast(forCity city: String) -> AnyPublisher<CurrentWeatherForecastResponse, WeatherError> {
        return forecast(with: makeCurrentDayForecastComponents(withCity: city))
    }
    
    private func forecast<T>(with components: URLComponents) -> AnyPublisher<T, WeatherError> where T: Decodable {
        guard let url = components.url else {
            let error = WeatherError.network(description: "Could not create URL.")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in .network(description: error.localizedDescription) }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
    
}
