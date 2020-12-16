//
//  CLLocationManagerCombineDelegate.swift
//  Misty
//
//  Created by Gene Bogdanovich on 16.12.20.
//

import Foundation
import CoreLocation
import Combine

protocol CLLocationManagerCombineDelegate: CLLocationManagerDelegate {
    func authorizationPublisher() -> AnyPublisher<CLAuthorizationStatus, Never>
    func locationPublisher() -> AnyPublisher<[CLLocation], Never>
}
