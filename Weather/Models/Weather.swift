//
//  Forecast.swift
//  Pronostic
//
//  Created by Dahana Arboleda on 11/01/25.
//

import Foundation

struct Weather: Codable {
    let location: WeatherLocation
    let forecast: Forecast

    struct WeatherLocation: Codable {
        let name: String
        let country: String
    }

    struct Forecast: Codable {
        let forecastday: [Day]
    }

    struct Day: Codable {
        let date: String
        let day: DayDetail
        
        struct DayDetail: Codable {
            let avgtemp_c: Double
            let condition: Condition
        }

        struct Condition: Codable {
            let text: String
            let icon: String
        }
    }
}
