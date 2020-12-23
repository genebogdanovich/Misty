//
//  SceneDelegate.swift
//  Misty
//
//  Created by Gene Bogdanovich on 8.12.20.
//

import UIKit
import SwiftUI
import CoreLocation
import Combine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let defaults = UserDefaults.standard
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let weatherWebService = WeatherWebService()
        let locationManager = WeatherLocationManager()
        
        let currentWeatherViewModel = CurrentWeatherViewModel(
            locationPublisher: locationManager.locationPublisher,
            weatherWebService: weatherWebService
        )
        
        let weeklyWeatherViewModel = WeeklyWeatherViewModel(
            locationPublisher: locationManager.locationPublisher,
            weatherWebService: weatherWebService
        )
        
        let tabBarView = TabBarView(
            currentWeatherViewModel: currentWeatherViewModel,
            weeklyWeatherViewModel: weeklyWeatherViewModel
        ).environmentObject(defaults)
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: tabBarView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

extension UserDefaults: ObservableObject {}
