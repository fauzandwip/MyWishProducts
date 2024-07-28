//
//  FavoriteProductsViewModel.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import Foundation

class FavoriteProductsViewModel: ObservableObject {
    @Published var favoriteProducts: [FavoriteProduct] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let favoriteProductService = FavoriteProductService()
    
    func getFavoriteProducts() {
        isLoading = true
        error = nil

        do {
            let favProducts = try favoriteProductService.getFavoriteProducts()
            self.favoriteProducts = favProducts
            self.isLoading = false
        } catch {
            self.error = error
            isLoading = false
        }
    }
    
    func deleteFavoriteProduct(favProduct: FavoriteProduct) {
        if favoriteProducts.contains(favProduct) {
            favoriteProductService.delete(favProduct)
            self.getFavoriteProducts()
        }
    }
}
