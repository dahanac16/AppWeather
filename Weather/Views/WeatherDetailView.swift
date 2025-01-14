//
//  Untitled.swift
//  Pronostic
//
//  Created by Dahana Arboleda on 11/01/25.
//

import SwiftUI

struct WeatherDetailView: View {
    let location: Location
    @StateObject private var viewModel = WeatherViewModel()
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        VStack {
            if let weather = viewModel.weather {
                Text(weather.location.name)
                    .font(.largeTitle)
                    .padding()

                List(weather.forecast.forecastday, id: \.date) { day in
                    HStack {
                        Text(day.date)
                        Spacer()
                        Text("\(day.day.avgtemp_c)°C")
                            .accessibilityIdentifier("temperatureLabel")
                        Spacer()
                        Text(day.day.condition.text)
                    }
                }

                Button(action: {
                    if favoritesViewModel.favoriteLocations.contains(where: { $0.id == location.id }) {
                        favoritesViewModel.removeFavorite(location: location)
                    } else {
                        favoritesViewModel.addFavorite(location: location)
                    }
                }) {
                    Text(favoritesViewModel.favoriteLocations.contains(where: { $0.id == location.id }) ? "Eliminar de Favoritos" : "Agregar a Favoritos")
                }
                .accessibilityIdentifier(favoritesViewModel.favoriteLocations.contains(where: { $0.id == location.id }) ? "removeFavoriteButton" : "addFavoriteButton")
                .padding()
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.fetchWeather(for: location)
                    }
            }
        }
    }
}
 
