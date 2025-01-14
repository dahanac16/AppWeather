//
//  FavoritesViewModel.swift
//  Weather
//
//  Created by Dahana Arboleda on 12/01/25.
//
import SwiftUI

class FavoritesViewModel: ObservableObject {
    @Published var favoriteLocations: [Location] = []
    private let favoritesKey = "FavoriteLocations"

    init() {
        loadFavorites()
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
