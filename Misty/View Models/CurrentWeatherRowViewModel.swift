//
//  CurrentWeatherRowViewModel.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import Foundation
import SwiftUI
import Combine

struct CurrentWeatherRowViewModel {
    private let item: CurrentWeatherForecastResponse
    
    // Interpretation goes here...
    
    var temperature: String {
        return String(item.main.temp)
    }
    
    var maxTemperature: String {
        return String(item.main.tempMax)
    }
    
    var minTemperature: String {
        return String(item.main.tempMin)
    }
    
    var humidity: String {
        return String(item.main.humidity)
    }
    
    
    
    init(item: CurrentWeatherForecastResponse) {
        self.item = item
    }
}
