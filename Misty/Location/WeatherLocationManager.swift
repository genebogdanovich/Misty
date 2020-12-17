//
//  WeatherLocationManager.swift
//  Misty
//
//  Created by Gene Bogdanovich on 16.12.20.
//

import Foundation
import Combine
import CoreLocation

class WeatherLocationManager: ObservableObject {
    @Published var authorizationStatus = CLAuthorizationStatus.notDetermined
    @Published var location: CLLocation? // Maybe regular Publisher here?
    
    let manager: CLLocationManager
    let publicist: CLLocationManagerCombineDelegate
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            
            
            let manager = CLLocationManager()
            
            
            
            manager.requestWhenInUseAuthorization()
            let publicist = CLLocationManagerPublicist()
            manager.delegate = publicist
            
            self.manager = manager
            self.publicist = publicist
            
            // Publishing authorization
            
            let authorizationPublisher = publicist.authorizationPublisher()
            
            authorizationPublisher
                .sink(receiveValue: beginUpdates(_:))
                .store(in: &cancellables)
            
            // Publishing location
            
            let locationPublisher = publicist.locationPublisher()
            
            locationPublisher
                .print("locationPublisher")
                // Convert an array of CLLocation into a Publisher itself
                .flatMap(Publishers.Sequence.init(sequence:))
                // Wrap in Optional type
                .map { $0 as CLLocation? }
                .receive(on: DispatchQueue.main)
                .assign(to: \.location, on: self)
                .store(in: &cancellables)
            
            
        } else {
            fatalError()
        }
        
    }
    
    /// This method will start updating location as soon as it receives authorizedAlways or authorizedWhenInUse CLAuthorizationStatus.
    func beginUpdates(_ authorizationStatus: CLAuthorizationStatus) {
        
        if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
            
            if !CLLocationManager.significantLocationChangeMonitoringAvailable() {
                // The device does not support this service.
                return
            }
            
            self.manager.startMonitoringSignificantLocationChanges()
            
        }
    }
}
