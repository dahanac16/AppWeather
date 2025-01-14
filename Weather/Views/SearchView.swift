//
//  SearchView.swift
//  Pronostic
//
//  Created by Dahana Arboleda on 11/01/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @State private var query = ""

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Buscar ubicación...", text: $query)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: query) { newValue in
                    viewModel.searchLocations(query: newValue)
                }

            if viewModel.locations.isEmpty {
                Spacer()
                Text("No se encontraron resultados")
                    .foregroundColor(.gray)
                    .padding()
                    .frame(maxWidth: .infinity)
                Spacer()
            } else {
                List(viewModel.locations) { location in
                    NavigationLink(destination: WeatherDetailView(location: location)) {
                        VStack(alignment: .leading) {
                            Text(location.name)
                                .font(.headline)
                            Text(location.country)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }

            Spacer()

            NavigationLink(destination: FavoritesView()) {
                Text("Ver Favoritos")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
        }
        .navigationBarHidden(true)
    }
}
