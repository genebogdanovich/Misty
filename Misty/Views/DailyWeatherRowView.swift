//
//  DailyWeatherRowView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 22.12.20.
//

import SwiftUI

struct DailyWeatherRow: View {
    private let viewModel: DailyWeatherRowViewModel
    
    init(viewModel: DailyWeatherRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Text("\(viewModel.day)")
            
            Spacer()
            
            viewModel.icon
            
            Spacer()
            
            Text("\(viewModel.maxTemperature)°")
            
            Text("\(viewModel.minTemperature)°")
                .foregroundColor(.secondary)
            
        }
    }
}



