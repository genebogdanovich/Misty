//
//  SettingsViewModel.swift
//  Misty
//
//  Created by Gene Bogdanovich on 17.12.20.
//

import Foundation
import Combine

private var cancellables = [String: AnyCancellable]()

class SettingsViewModel: ObservableObject {
    static let unitTypes = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @Published(key: "unit_type") var type = 0
    // FIXME: This doesn't update weather right away.
    // Try did set
    // Try updating WeatherView when we load it!!!
    
}


// This takes care of saving our @Published property to UserDefaults.
extension Published {
    init(wrappedValue defaultValue: Value, key: String) {
        let value = UserDefaults.standard.object(forKey: key) as? Value ?? defaultValue
        self.init(initialValue: value)
        cancellables[key] = projectedValue.sink(receiveValue: { value in
            UserDefaults.standard.set(value, forKey: key)
        })
    }
}
