//
//  Untitled.swift
//  Pronostic
//
//  Created by Dahana Arboleda on 11/01/25.
//

import Foundation
import Alamofire

class WeatherService {
   
    func searchLocations(query: String, completion: @escaping (Result<[Location], Error>) -> Void) {
        let url = "\(Constants.baseURL)/search.json?key=\(Constants.apiKey)&q=\(query)"
        AF.request(url).responseDecodable(of: [Location].self) { response in
            switch response.result {
            case .success(let locations):
                completion(.success(locations))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


    func fetchWeather(lat: Double, lon: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        let url = "\(Constants.baseURL)/forecast.json?key=\(Constants.apiKey)&q=\(lat),\(lon)&days=3&lang=es"
        AF.request(url).responseDecodable(of: Weather.self) { response in
            switch response.result {
            case .success(let weather):
                completion(.success(weather))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
