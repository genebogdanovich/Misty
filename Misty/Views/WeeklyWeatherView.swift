//
//  WeeklyWeatherView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 22.12.20.
//

import SwiftUI

struct WeeklyWeatherView: View {
    @ObservedObject var viewModel: WeeklyWeatherViewModel
    
    var body: some View {
        NavigationView {
            content()
                .navigationBarTitle("Week")
                .onAppear {
                    viewModel.refresh()
                }
        }
    }
    
    init(viewModel: WeeklyWeatherViewModel) {
        self.viewModel = viewModel
    }
}

private extension WeeklyWeatherView {
    func content() -> some View {
        if !viewModel.dataSource.isEmpty {
            return AnyView(
                List {
                    ForEach(viewModel.dataSource, content: DailyWeatherRow.init(viewModel:))
                }
            )
        } else {
            return AnyView(loading)
        }
    }
    var loading: some View {
        return LoadingView()
    }
}
