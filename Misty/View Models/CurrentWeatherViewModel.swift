//
//  CurrentWeatherViewModel.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import Foundation
import SwiftUI
import Combine

class CurrentWeatherViewModel: ObservableObject {
    @Published var dataSource: CurrentWeatherRowViewModel?
    
    let city: String
    private let weatherWebService: WeatherFetchable
    private var subscriptions = Set<AnyCancellable>()
    
    init(city: String, weatherWebService: WeatherFetchable) {
        self.weatherWebService = weatherWebService
        self.city = city
    }
    
    func refresh() {
        weatherWebService
            .currentWeatherForecast(forCity: city)
            .map(CurrentWeatherRowViewModel.init)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = nil
                case .finished:
                    break
                }
                
            }, receiveValue: { [weak self] weather in
                guard let self = self else { return }
                self.dataSource = weather
            })
            .store(in: &subscriptions)
    }
}
