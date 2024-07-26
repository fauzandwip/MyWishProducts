//
//  Product.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 25/07/24.
//

import Foundation

struct ProductResponseAPI: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Float
    let rating: Float
    let tags: [String]
    let thumbnail: String
    let reviews: [ProductReview]?
}

struct ProductReview: Codable {
    let rating: Int
    let comment: String
    let reviewerName: String
    let reviewerEmail: String
}
