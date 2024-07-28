//
//  Product.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 25/07/24.
//

import Foundation
import CoreData

struct ProductResponseAPI: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let thumbnail: String
    let price: Double
    let rating: Float
    let description: String
    let tags: [String]
    let reviews: [ProductReview]?
}

struct ProductReview: Codable, Hashable {
    let rating: Int
    let comment: String
    let reviewerName: String
    let reviewerEmail: String
}


