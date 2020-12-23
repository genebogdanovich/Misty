//
//  LocationError.swift
//  Misty
//
//  Created by Gene Bogdanovich on 23.12.20.
//

import Foundation

enum LocationError: Error {
    case locationUpdatesNotAuthorized(description: String)
}
