//
//  WeeklyWeatherView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 22.12.20.
//

import SwiftUI

struct WeeklyWeatherView: View {
    @ObservedObject var viewModel: WeeklyWeatherViewModel
    
    init(viewModel: WeeklyWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            
        
            List {
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    forecastSection
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Week", displayMode: .inline)
            
        }
    }
}

private extension WeeklyWeatherView {
    var forecastSection: some View {
//        Section {
            ForEach(viewModel.dataSource, content: DailyWeatherRow.init(viewModel:))
//        }
    }
    
    var emptySection: some View {
//        Section {
            Text("No results")
                .foregroundColor(.gray)
//        }
    }
}
