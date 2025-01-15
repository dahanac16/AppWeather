//
//  Untitled.swift
//  Pronostic
//
//  Created by Dahana Arboleda on 11/01/25.
//

import Foundation

class WeatherService {
    /// Busca ubicaciones basadas en una consulta.
    func searchLocations(query: String, completion: @escaping (Result<[Location], Error>) -> Void) {
        guard let url = APIClient.shared.buildURL(
            baseURL: Constants.baseURL,
            endpoint: "/search.json",
            queryItems: [
                URLQueryItem(name: "key", value: Constants.apiKey),
                URLQueryItem(name: "q", value: query)
            ]
        ) else {
            completion(.failure(APIClient.APIClientError.invalidURL))
            return
        }

        APIClient.shared.performRequest(url: url, responseType: [Location].self, completion: completion)
    }

    func fetchWeather(lat: Double, lon: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        guard let url = APIClient.shared.buildURL(
            baseURL: Constants.baseURL,
            endpoint: "/forecast.json",
            queryItems: [
                URLQueryItem(name: "key", value: Constants.apiKey),
                URLQueryItem(name: "q", value: "\(lat),\(lon)"),
                URLQueryItem(name: "days", value: "3"),
                URLQueryItem(name: "lang", value: "es")
            ]
        ) else {
            completion(.failure(APIClient.APIClientError.invalidURL))
            return
        }

        APIClient.shared.performRequest(url: url, responseType: Weather.self, completion: completion)
    }
}

