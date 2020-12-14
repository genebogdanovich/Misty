//
//  WeatherError.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import Foundation

enum WeatherError: Error {
    case parsing(description: String)
    case network(description: String)
}
