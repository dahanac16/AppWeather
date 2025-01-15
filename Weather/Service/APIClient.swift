//
//  Untitled.swift
//  Weather
//
//  Created by Dahana Arboleda on 14/01/25.
//

import Foundation
import Alamofire

class APIClient {
    static let shared = APIClient()

    private init() {}

    enum APIClientError: Error {
        case invalidURL
        case unknownError
    }

    func buildURL(baseURL: String, endpoint: String, queryItems: [URLQueryItem]) -> URL? {
        var components = URLComponents(string: baseURL + endpoint)
        components?.queryItems = queryItems
        return components?.url
    }

    func performRequest<T: Decodable>(url: URL, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url).responseDecodable(of: responseType) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

