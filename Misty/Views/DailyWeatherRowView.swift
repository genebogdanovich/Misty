//
//  DailyWeatherRowView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 22.12.20.
//

import SwiftUI

struct DailyWeatherRow: View {
    private let viewModel: DailyWeatherRowViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(viewModel.date)")
                    .font(.subheadline)
                Text("\(viewModel.day)")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            HStack(spacing: 0) {
                Text("\(viewModel.maxTemperature)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 32, alignment: .center)

                Text("\(viewModel.minTemperature)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .frame(width: 32, alignment: .center)

                viewModel.icon
                    .font(.headline)
                    .frame(width: 32, alignment: .center)

            }
        }
    }
    
    init(viewModel: DailyWeatherRowViewModel) {
        self.viewModel = viewModel
    }
}



