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
        return String(format: "%.1f", item.main.temp)
    }
    
    init(item: CurrentWeatherForecastResponse) {
        self.item = item
    }
}
