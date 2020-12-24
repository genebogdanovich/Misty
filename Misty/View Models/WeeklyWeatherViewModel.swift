//
//  WeeklyWeatherViewModel.swift
//  Misty
//
//  Created by Gene Bogdanovich on 22.12.20.
//

import SwiftUI
import Combine
import CoreLocation

class WeeklyWeatherViewModel: ObservableObject {
    @Published var dataSource = [DailyWeatherRowViewModel]()
    
    private let weatherWebService: WeatherFetchable
    private let locationPublisher: AnyPublisher<[CLLocation], Never>
    private var cancellables = Set<AnyCancellable>()
    
    func refresh() {
        locationPublisher
            // Convert an array of CLLocation into a Publisher itself
            .flatMap(Publishers.Sequence.init(sequence:))
            .flatMap { self.weatherWebService.weeklyWeatherForecast(forCoordinate: $0.coordinate) }
            .map { response in
                response.list.map(DailyWeatherRowViewModel.init)
            }
            .map(Array.removeDuplicates)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = []
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] forecast in
                guard let self = self else { return }
                self.dataSource = forecast
            })
            .store(in: &cancellables)
    }
    
    init(locationPublisher: AnyPublisher<[CLLocation], Never>, weatherWebService: WeatherFetchable) {
        self.weatherWebService = weatherWebService
        self.locationPublisher = locationPublisher
    }
}
