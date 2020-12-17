//
//  CurrentWeatherRowView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import Foundation
import SwiftUI

struct CurrentWeatherRowView: View {
    private let viewModel: CurrentWeatherRowViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Temperature:")
                Text("\(viewModel.temperature)")
            }
            
            HStack {
                Text("Max temperature:")
                Text("\(viewModel.maxTemperature)")
            }
            
            HStack {
                Text("Min temperature:")
                Text("\(viewModel.minTemperature)")
            }
            
            HStack {
                Text("Humidity:")
                Text("\(viewModel.humidity)")
            }
            
            HStack {
                Text("City:")
                Text("\(viewModel.city)")
            }
            
            HStack {
                Text("Summary:")
                Text("\(viewModel.summary)")
            }
            
            HStack {
                Text("Feels like:")
                Text("\(viewModel.feelsLikeTemperature)")
            }
            
            HStack {
                Text("Pressure:")
                Text("\(viewModel.pressure)")
            }
            
            HStack {
                Text("Sunrise:")
                Text("\(viewModel.sunriseTime)")
            }
            
            HStack {
                Text("Sunset:")
                Text("\(viewModel.sunsetTime)")
            }
        }
    }
    
    init(viewModel: CurrentWeatherRowViewModel) {
        self.viewModel = viewModel
    }
}
