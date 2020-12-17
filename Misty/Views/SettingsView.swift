//
//  SettingsView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 17.12.20.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var defaults: UserDefaults
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Unit type", selection: $viewModel.type, content: {
                        ForEach(0..<SettingsViewModel.unitTypes.count) {
                            Text(SettingsViewModel.unitTypes[$0])
                        }
                    })
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel())
    }
}
