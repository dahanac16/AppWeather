//
//  Untitled.swift
//  Pronostic
//
//  Created by Dahana Arboleda on 11/01/25.
//
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var locations: [Location] = []
    private let weatherService: WeatherService

    init(weatherService: WeatherService = WeatherService()) {
        self.weatherService = weatherService
    }

    func searchLocations(query: String) {
        guard !query.isEmpty else {
            locations = []
            return
        }

        weatherService.searchLocations(query: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let locations):
                    self?.locations = locations
                case .failure(let error):
                    print("Error buscando ubicaciones: \(error)")
                }
            }
        }
    }
}
