//
//  CurrentWeatherViewModel.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import Foundation
import SwiftUI
import Combine
import CoreLocation

class CurrentWeatherViewModel: ObservableObject {
    @Published var dataSource: CurrentWeatherRowViewModel?
    
    private let weatherWebService: WeatherFetchable
    private let locationPublisher: AnyPublisher<[CLLocation], Never>
    private var cancellables = Set<AnyCancellable>()
    
    func refresh() {
        locationPublisher
            // Convert an array of CLLocation into a Publisher itself
            .flatMap(Publishers.Sequence.init(sequence:))
            .flatMap { self.weatherWebService.currentWeatherForecast(forCoordinate: $0.coordinate) }
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
            .store(in: &cancellables)
    }
    
    init(locationPublisher: AnyPublisher<[CLLocation], Never>, weatherWebService: WeatherFetchable) {
        self.weatherWebService = weatherWebService
        self.locationPublisher = locationPublisher
    }
}
