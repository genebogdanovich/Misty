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
        }
    }
    
    init(viewModel: CurrentWeatherRowViewModel) {
        self.viewModel = viewModel
    }
}
