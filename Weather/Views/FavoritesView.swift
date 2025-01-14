//
//  FavoritesView.swift
//  Weather
//
//  Created by Dahana Arboleda on 12/01/25.
//
import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.favoriteLocations.isEmpty {
                    Spacer()
                    Text("No hay ubicaciones favoritas")
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                } else {
                    List(viewModel.favoriteLocations) { location in
                        VStack(alignment: .leading) {
                            Text(location.name)
                                .font(.headline)
                            Text(location.country)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Favoritos")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
