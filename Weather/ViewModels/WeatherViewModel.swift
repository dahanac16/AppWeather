//
//  Untitled.swift
//  Pronostic
//
//  Created by Dahana Arboleda on 11/01/25.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var favoriteLocations: [Location] = []
    private let weatherService = WeatherService()
    private let favoritesKey = "FavoriteLocations"

    init() {
        loadFavorites()
    }

    func fetchWeather(for location: Location) {
        weatherService.fetchWeather(lat: location.lat, lon: location.lon) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self?.weather = weather
                case .failure(let error):
                    print("Error obteniendo el clima: \(error)")
                }
            }
        }
    }

    func addFavorite(location: Location) {
        if !favoriteLocations.contains(where: { $0.id == location.id }) {
            favoriteLocations.append(location)
            saveFavorites()
        }
    }

    func removeFavorite(location: Location) {
        favoriteLocations.removeAll { $0.id == location.id }
        saveFavorites()
    }

    private func saveFavorites() {
        if let data = try? JSONEncoder().encode(favoriteLocations) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }

    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let favorites = try? JSONDecoder().decode([Location].self, from: data) {
            favoriteLocations = favorites
        }
    }
}
