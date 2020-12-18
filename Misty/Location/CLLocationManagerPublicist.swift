//
//  CLLocationManagerPublicist.swift
//  Misty
//
//  Created by Gene Bogdanovich on 16.12.20.
//

import Foundation
import Combine
import CoreLocation


/// An object that doesn’t hold any values but only transfers data between CoreLocationManager and ObservableObject.
class CLLocationManagerPublicist: NSObject, CLLocationManagerCombineDelegate {
    
    // MARK: - Publishers
    
    let authorizationSubject = PassthroughSubject<CLAuthorizationStatus, Never>()
    let locationSubject = PassthroughSubject<[CLLocation], Never>()
    
    
    func authorizationPublisher() -> AnyPublisher<CLAuthorizationStatus, Never> {
        authorizationSubject.eraseToAnyPublisher()
    }
    
    func locationPublisher() -> AnyPublisher<[CLLocation], Never> {
        locationSubject.eraseToAnyPublisher()
    }
    
    // MARK: - Delegate methods
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationSubject.send(manager.authorizationStatus)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
            // Location updates are not authorized.
            manager.stopMonitoringSignificantLocationChanges()
            
            return
        }
        // TODO: Notify users of any errors.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationSubject.send(locations)
    }
    
}
