//
//  ProductDetailViewModel.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var isFavProduct: Bool = false
    
    var product: Product? = nil
    private var favoriteProducts: [FavoriteProductEntity] = []
    
    private let favoriteProductService = FavoriteProductService()
    private let productService = ProductService()

    init(productId: Int, product: Product?) {
        if let product {
            self.product = product
        } else {
            fetchProductById(id: productId)
        }
        
        self.getFavoriteProducts()
        self.setIsFavoritProduct(id: productId)
//        print(self.isFavProduct, self.product?.title ?? "Title")
    }
    
    private func fetchProductById(id: Int) {
        Task {
            do {
                let productData = try await productService.fetchProductById(id: id)
                DispatchQueue.main.async {
                    self.product = productData
                }
                print("fetch product detail vm")
            } catch {
                print("error \(error)")
            }
        }
    }
    
    func getFavoriteProducts() {
        do {
            self.favoriteProducts =  try favoriteProductService.getFavoriteProducts()
        } catch {
            print("Error get favorite products: \(error)")
        }
    }
    
    func addFavoriteProduct(_ product: Product) {
        favoriteProductService.addFavoriteProduct(product)
        getFavoriteProducts()
        self.isFavProduct = true
    }
    
    func deleteFavoriteProduct(id: Int) {
//        if let favProduct = favoriteProducts.first(where: { $0.id == id }) {
//            favoriteProductService.deleteFavoriteProduct(favProduct)
//            self.isFavProduct = false
//        }
        favoriteProductService.deleteFavoriteProduct(id: id)
        self.isFavProduct = false
        print(self.isFavProduct, "delete fav")
    }
    
    func favoriteButtonAction() {
        guard let product = self.product else {
            return
        }
        isFavProduct ? deleteFavoriteProduct(id: product.id) : addFavoriteProduct(product)
    }
    
    func setIsFavoritProduct(id: Int) {
        self.isFavProduct = favoriteProducts.contains { product in
            product.id == id
        }
    }
}
