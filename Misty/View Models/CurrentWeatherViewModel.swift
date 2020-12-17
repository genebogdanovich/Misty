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
    private var subscriptions = Set<AnyCancellable>()
    let coordinate: CLLocationCoordinate2D
    let locationManager = WeatherLocationManager()
    
    var cancellables = [AnyCancellable]()
    
    init(coordinate: CLLocationCoordinate2D, weatherWebService: WeatherFetchable) {
        self.weatherWebService = weatherWebService
        self.coordinate = coordinate
    }
    
    func refresh() {
        
        
//        locationManager.$authorizationStatus
//            .sink(receiveValue: { _ in
//                print("Got em!")
//            })
//            .store(in: &subscriptions)
        
        locationManager.$location
            .retry(3)
            .flatMap { self.weatherWebService.currentWeatherForecast(forCoordinate: $0!.coordinate) }
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
