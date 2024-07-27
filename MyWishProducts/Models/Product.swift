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

//struct ProductAPI: Codable, Identifiable {
//    let id: Int
//    let title: String
//    let thumbnail: String
//    let price: Double
//    let rating: Float
//    let category: String
//    let description: String
//    let tags: [String]
//    let reviews: [ProductReview]?
//}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let thumbnail: String
    let price: Double
    let rating: Float
    let category: String
    let description: String
    let tags: [String]
    let reviews: [ProductReview]?
}

struct ProductReview: Codable {
    let rating: Int
    let comment: String
    let reviewerName: String
    let reviewerEmail: String
}

//protocol WishProduct: Codable, Identifiable {
//    var id: Int { get }
//    var title: String { get }
//    var thumbnail: String { get }
//    var price: Double { get }
//    var rating: Float { get }
//    var isFavoriteProduct: Bool { get set }
//}

//struct FavoriteProduct {
//    let id: Int
//    let title: String
//    let thumbnail: String
//    let price: Double
//    let rating: Float
//    var isFavoriteProduct: Bool
    
//    init(from favProductEntity: FavoriteProductEntity) {
//        id = Int(favProductEntity.id)
//        title = favProductEntity.title ?? ""
//        thumbnail = favProductEntity.thumbnail ?? ""
//        price = favProductEntity.price
//        rating = favProductEntity.rating
//        isFavoriteProduct = true
//    }
//}


