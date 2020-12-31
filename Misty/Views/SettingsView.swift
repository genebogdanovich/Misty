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
                    
                    Picker(selection: $viewModel.type, label:
                            PickerTitleView(title: "Unit Type", image: Image(systemName: "thermometer.sun.fill").renderingMode(.original)), content: {
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

struct PickerTitleView: View {
    let title: String
    let image: Image
    
    var body: some View {
        HStack {
            image
                .padding(3)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(6)
            Text(title)
        }
    }
}
