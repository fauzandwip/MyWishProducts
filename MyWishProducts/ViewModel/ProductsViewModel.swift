//
//  ProductsViewModel.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 25/07/24.
//

import Foundation

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    private var favoriteProducts: [FavoriteProductEntity] = []
    
    private let productService = ProductService()
    private let favoriteProductService = FavoriteProductService()
    
    func fetchProducts() async {
        do {
            let productsData = try await productService.fetchProducts()
//            favoriteProducts = try favoriteProductService.getFavoriteProducts()
//            let mappedProducts: [Product] = productsData.map({ product in
//                let isFavoriteProduct = (try self.favoriteProductService.getFavoriteProduct(id: product.id) != nil) ? true : false
//                Product(id: product.id, title: product.title, thumbnail: product.thumbnail, price: product.price, rating: product.rating, category: product.category, description: product.description, tags: product.tags, reviews: product.reviews, isFavoriteProduct: isFavoriteProduct)
//            })
//
            DispatchQueue.main.async {
//                self.products = productsData.map({ product in
//                    Product(id: product.id, title: product.title, thumbnail: product.thumbnail, price: product.price, rating: product.rating, category: product.category, description: product.description, tags: product.tags, reviews: product.reviews, isFavoriteProduct: self.getIsFavoritProduct(id: product.id))
//                })
                self.products = productsData
            }
            
            print("fetch products vm")
        } catch {
            print("error \(error)")
        }
    }
    
    func getIsFavoritProduct(id: Int) -> Bool {
        return self.favoriteProducts.contains { product in
            product.id == id
        }
    }
}
