//
//  TabBarView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 17.12.20.
//

import SwiftUI

struct TabBarView: View {
    
    let currentWeatherViewModel: CurrentWeatherViewModel
    
    var body: some View {
        TabView {
            CurrentWeatherView(viewModel: currentWeatherViewModel).tabItem {
                Image(systemName: "sun.max.fill")
                Text("Now")
            }
            
            SettingsView(viewModel: SettingsViewModel()).tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
