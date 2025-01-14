//
//  Location.swift
//  Pronostic
//
//  Created by Dahana Arboleda on 11/01/25.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let url: String
}

