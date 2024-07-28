//
//  ProductsViewModel.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 25/07/24.
//

import Foundation

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var searchText = ""
    @Published var isLoading = false
    @Published var error: Error?
    
    private let productService = ProductService()
    
    func fetchProducts(searchBy: String = "") async {
        DispatchQueue.main.async {
            self.isLoading = true
            self.error = nil
        }
        
        do {
            let productsData = try await productService.fetchProducts(searchBy: searchBy)
            DispatchQueue.main.async {
                self.products = productsData
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.error = error
                self.isLoading = false
            }
        }
    }
}
