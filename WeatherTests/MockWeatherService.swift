//
//  MockWeatherService.swift
//  Weather
//
//  Created by Dahana Arboleda on 14/01/25.
//
@testable import Weather

class MockWeatherService: WeatherService {
    var searchResult: Result<[Location], Error>?
    var fetchWeatherResult: Result<Weather, Error>?
    
    override func searchLocations(query: String, completion: @escaping (Result<[Location], Error>) -> Void) {
        if let result = searchResult {
            completion(result)
        }
    }

    override func fetchWeather(lat: Double, lon: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        if let result = fetchWeatherResult {
            completion(result)
        }
    }
}
