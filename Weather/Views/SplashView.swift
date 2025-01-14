//
//  Splash.swift
//  Pronostic
//
//  Created by Dahana Arboleda on 11/01/25.
//

import SwiftUI

struct SplashView: View {
    @State private var navigateToNextView = false

    var body: some View {
        NavigationView {
            VStack {
                Image("fondo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity, height: .infinity)
                    .padding()
            }
            .padding()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigateToNextView = true
                }
            }
            .background(
                NavigationLink(
                    destination: SearchView(),
                    isActive: $navigateToNextView,
                    label: { EmptyView() }
                )
                .hidden()
            )
        }
    }
}
