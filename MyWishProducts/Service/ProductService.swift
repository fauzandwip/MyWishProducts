//
//  ProductService.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import Foundation

class ProductService {
    static func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            print("Invalid URL")
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedResponse = try JSONDecoder().decode(ProductResponseAPI.self, from: data)
        return decodedResponse.products
    }
}

enum APIError: Error {
    case invalidURL
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        }
    }
}
