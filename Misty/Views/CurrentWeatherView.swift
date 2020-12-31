//
//  CurrentWeatherView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 14.12.20.
//

import SwiftUI
import CoreLocation

struct CurrentWeatherView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: CurrentWeatherViewModel
    
    var body: some View {
        NavigationView {
            content()
                .onAppear(perform: {
                    viewModel.refresh()
                })
                .navigationBarTitle("")

        }
    }
    
    init(viewModel: CurrentWeatherViewModel) {
        self.viewModel = viewModel
    }
}

private extension CurrentWeatherView {
    func content() -> some View {
        if let viewModel = viewModel.dataSource {
            return AnyView(
                ZStack {
                    Image("Winter")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.vertical)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color("GradientStartColor"), colorScheme == .dark ? .black : .white]),
                                startPoint: .top,
                                endPoint: .bottom)
                                .opacity(0.85)
                        )
                        .edgesIgnoringSafeArea(.vertical)
                    details(for: viewModel)
                }
            )
        } else {
            return AnyView(loading)
        }
    }
    
    func details(for viewModel: CurrentWeatherRowViewModel) -> some View {
        CurrentWeatherRowView(viewModel: viewModel)
    }
    
    var loading: some View {
        return LoadingView()
    }
}
