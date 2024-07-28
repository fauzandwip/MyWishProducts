//
//  ProductService.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import Foundation

struct APIBasePath {
    static let BASE_PATH = "https://dummyjson.com"
}

struct APIEndpoint {
    static let products = APIBasePath.BASE_PATH + "/products"
    static let searchProducts = products + "/search?q="
}

class ProductService {
    func fetchProducts(searchBy: String = "") async throws -> [Product] {
        guard let url = URL(string: APIEndpoint.searchProducts + searchBy) else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedResponse = try JSONDecoder().decode(ProductResponseAPI.self, from: data)
        return decodedResponse.products
    }
    
    func fetchProductById(id: Int) async throws -> Product {
        guard let url = URL(string: APIEndpoint.products + "/\(id)") else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedResponse = try JSONDecoder().decode(Product.self, from: data)
        return decodedResponse
    }
}

enum APIError: Error {
    case invalidURL
    case fetchError
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .fetchError:
            return "Error: fetch data"
        }
    }
}
