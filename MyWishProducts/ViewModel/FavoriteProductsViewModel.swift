//
//  FavoriteProductsViewModel.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import Foundation

class FavoriteProductsViewModel: ObservableObject {
    @Published var favoriteProducts: [FavoriteProductEntity] = []
    
    private let favoriteProductService = FavoriteProductService()
    
    func getFavoriteProducts() {
        do {
            self.favoriteProducts = try favoriteProductService.getFavoriteProducts()
//            self.favoriteProducts = favProducts.map({ favProduct in
//                FavoriteProduct(from: favProduct)
//            })
        } catch {
            print("Error get favorite products: \(error)")
        }
    }
    
    func deleteFavoriteProduct(id: Int) {
//        if let favProduct = favoriteProducts.first(where: { $0.id == id }) {
//            favoriteProductService.deleteFavoriteProduct(id)
//        }
        favoriteProductService.deleteFavoriteProduct(id: id)
        self.getFavoriteProducts()
    }
}
