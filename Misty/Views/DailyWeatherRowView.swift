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
                viewModel.icon
                    .font(.headline)
                    .frame(width: 32, alignment: .center)
                
                Text("\(viewModel.temp)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 50, alignment: .trailing)
            }
        }
    }
    init(viewModel: DailyWeatherRowViewModel) {
        self.viewModel = viewModel
    }
}



