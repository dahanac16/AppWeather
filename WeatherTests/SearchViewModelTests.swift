//
//  SearchViewModelTests.swift
//  Weather
//
//  Created by Dahana Arboleda on 14/01/25.
//

import XCTest
@testable import Weather

class SearchViewModelTests: XCTestCase {

    var viewModel: SearchViewModel!
    var mockWeatherService: MockWeatherService!

    override func setUp() {
        super.setUp()
        mockWeatherService = MockWeatherService()
        viewModel = SearchViewModel(weatherService: mockWeatherService)
    }

    override func tearDown() {
        viewModel = nil
        mockWeatherService = nil
        super.tearDown()
    }

    func testSearchLocationsWithEmptyQuery() {
        let query = ""
        viewModel.searchLocations(query: query)
        XCTAssertTrue(viewModel.locations.isEmpty, "Las ubicaciones deben estar vacías cuando la consulta esta vacia.")
    }


    func testSearchLocationsFailure() {
        let error = NSError(domain: "WeatherError", code: 1, userInfo: nil)
        mockWeatherService.searchResult = .failure(error)
        viewModel.searchLocations(query: "New York")
        XCTAssertTrue(viewModel.locations.isEmpty, "Las ubicaciones deben permanecer vacías si falla la llamada de servicio.")
    }
}
