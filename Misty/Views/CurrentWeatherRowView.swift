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
                viewModel.icon
                    .font(.title3)
                Text(viewModel.location)
                    .font(.title3)
            }
            .padding(4)
            
            Text("At \(viewModel.time) it was")
                .font(.body)
            
            Text("\(viewModel.temperature)")
                .font(.system(size: 64))
            
            HStack {
                VStack() {
                    WeatherInfoItemView(title: "Feels like", value: viewModel.feelsLikeTemperature)
                    WeatherInfoItemView(title: "High", value: viewModel.maxTemperature)
                    WeatherInfoItemView(title: "Humidity", value: viewModel.humidity)
                    WeatherInfoItemView(title: "Sunrise", value: viewModel.sunriseTime)
                }
                VStack() {
                    WeatherInfoItemView(title: "Wind speed", value: viewModel.windSpeed)
                    WeatherInfoItemView(title: "Low", value: viewModel.minTemperature)
                    WeatherInfoItemView(title: "Pressure", value: viewModel.pressure)
                    WeatherInfoItemView(title: "Sunset", value: viewModel.sunsetTime)
                }
            }
            
            Text(viewModel.summary)
                .font(.body)
        }
    }
    
    init(viewModel: CurrentWeatherRowViewModel) {
        self.viewModel = viewModel
    }
}

struct WeatherInfoItemView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title.uppercased())
                .font(.callout)
                .fontWeight(.light)
            Text(value)
                .font(.body)
        }
        .padding(4)
    }
}


