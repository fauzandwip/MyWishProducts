//
//  ProductsViewModel.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 25/07/24.
//

import Foundation

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func fetchProducts() async {
        do {
            let productsData = try await ProductService.fetchProducts()
            
            DispatchQueue.main.async {
                self.products = productsData
            }
            
            print("fetch products vm")
        } catch {
            print("error \(error)")
        }
    }
}
