//
//  TabBarView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 17.12.20.
//

import SwiftUI

struct TabBarView: View {
    
    let currentWeatherViewModel: CurrentWeatherViewModel
    let weeklyWeatherViewModel: WeeklyWeatherViewModel
    
    var body: some View {
        TabView {
            CurrentWeatherView(viewModel: currentWeatherViewModel).tabItem {
                Image(systemName: "sun.max.fill")
                Text("Now")
            }
            
            WeeklyWeatherView(viewModel: weeklyWeatherViewModel).tabItem {
                Image(systemName: "calendar")
                Text("Week")
            }
            
            SettingsView(viewModel: SettingsViewModel()).tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        .background(Color.red)
    }
}
