//
//  CurrentWeatherView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject var viewModel: CurrentWeatherViewModel
    
    var body: some View {
        content()
            .onAppear(perform: viewModel.refresh)
            .navigationBarTitle(viewModel.city)
        
        
    }
    
    init(viewModel: CurrentWeatherViewModel) {
        self.viewModel = viewModel
    }
    
}

private extension CurrentWeatherView {
    func content() -> some View {
        if let viewModel = viewModel.dataSource {
            return AnyView(details(for: viewModel))
        } else {
            return AnyView(loading)
        }
    }
    
    func details(for viewModel: CurrentWeatherRowViewModel) -> some View {
        CurrentWeatherRowView(viewModel: viewModel)
    }
    
    var loading: some View {
        return Text("Loading...")
            .foregroundColor(.gray)
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(viewModel: CurrentWeatherViewModel(city: "Minsk", weatherWebService: WeatherWebService()))
    }
}