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
}

class ProductService {
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: APIEndpoint.products) else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedResponse = try JSONDecoder().decode(ProductResponseAPI.self, from: data)
        return decodedResponse.products
//        return decodedResponse.products.map { product in
//            Product(id: product.id, title: product.title, thumbnail: product.thumbnail, price: product.price, rating: product.rating, category: product.category, description: product.description, tags: product.tags, reviews: product.reviews, isFavoriteProduct: false)
//        }
    }
    
    func fetchProductById(id: Int) async throws -> Product {
        guard let url = URL(string: APIEndpoint.products + "/\(id)") else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedResponse = try JSONDecoder().decode(Product.self, from: data)
        return decodedResponse
//        return Product(id: decodedResponse.id, title: decodedResponse.title, thumbnail: decodedResponse.thumbnail, price: decodedResponse.price, rating: decodedResponse.rating, category: decodedResponse.category, description: decodedResponse.category, tags: decodedResponse.tags, reviews: decodedResponse.reviews, isFavoriteProduct: false)
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
