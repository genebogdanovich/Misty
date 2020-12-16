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
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let webService = WeatherWebService()
        let viewModel = CurrentWeatherViewModel(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), weatherWebService: webService)
        let contentView = CurrentWeatherView(viewModel: viewModel)
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

