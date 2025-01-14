//
//  WeatherApp.swift
//  Weather
//
//  Created by Usuario on 14/01/25.
//

import SwiftUI

@main
struct WeatherApp: App {
    @StateObject private var favoritesViewModel = FavoritesViewModel()

    var body: some Scene {
        WindowGroup {
            SplashView()
                
        }
        .environmentObject(FavoritesViewModel())
    }
}
