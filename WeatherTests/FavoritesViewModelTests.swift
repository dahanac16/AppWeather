//
//  FavoritesViewModelTests.swift
//  Weather
//
//  Created by Dahana Arboleda on 14/01/25.
//

import XCTest
@testable import Weather

final class FavoritesViewModelTests: XCTestCase {
    var viewModel: FavoritesViewModel!
    let testLocations: [Location] = [
        Location(id: 518116, name: "Medellin", region: "Antioquia", country: "Colombia", lat: 6.29, lon: -75.54, url: "medellin-antioquia-colombia"),
        Location(id: 1854119, name: "Medellin", region: "Cebu", country: "Philippines", lat: 11.13, lon: 123.96, url: "medellin-cebu-philippines")
    ]

    override func setUp() {
        super.setUp()
        UserDefaults.standard.removeObject(forKey: "FavoriteLocations")
        viewModel = FavoritesViewModel()
    }

    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: "FavoriteLocations")
        viewModel = nil
        super.tearDown()
    }

    func testAddFavorite() {
        let location = testLocations[0]
        viewModel.addFavorite(location: location)
        XCTAssertEqual(viewModel.favoriteLocations.count, 1)
        XCTAssertEqual(viewModel.favoriteLocations.first, location)
    }

    func testAddDuplicateFavorite() {
        let location = testLocations[0]
        viewModel.addFavorite(location: location)
        viewModel.addFavorite(location: location)
        XCTAssertEqual(viewModel.favoriteLocations.count, 1)
    }

    func testRemoveFavorite() {
        let location = testLocations[0]
        viewModel.addFavorite(location: location)
        XCTAssertEqual(viewModel.favoriteLocations.count, 1)
        viewModel.removeFavorite(location: location)
        XCTAssertEqual(viewModel.favoriteLocations.count, 0)
    }

    func testLoadFavorites() {
        let location = testLocations[0]
        viewModel.addFavorite(location: location)
        let newViewModel = FavoritesViewModel()
        XCTAssertEqual(newViewModel.favoriteLocations.count, 1)
        XCTAssertEqual(newViewModel.favoriteLocations.first, location)
    }
}
