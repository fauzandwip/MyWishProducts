//
//  ProductDetailViewModel.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product? = nil
    @Published var productId: Int
    @Published var isFavProduct: Bool = false
    @Published private var favoriteProducts: [FavoriteProduct] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    var placeholder = Product(id: 1, title: "Placeholder", thumbnail: "", price: 234, rating: 5, description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.", tags: [], reviews: [])
    
    private let favoriteProductService = FavoriteProductService()
    private let productService = ProductService()

    init(productId: Int, product: Product?) {
        self.productId = productId
        
        if let product {
            self.product = product
        } else {
            fetchProductById(id: productId)
        }
        
        self.getFavoriteProducts()
        self.setIsFavoritProduct(id: productId)
    }
    
    func fetchProductById(id: Int) {
        isLoading = true
        error = nil
        
        Task {
            do {
                let productData = try await productService.fetchProductById(id: id)
                DispatchQueue.main.async {
                    self.product = productData
                    self.isLoading = false
                }
            } catch {
                self.error = error
                self.isLoading = false
            }
        }
    }
    
    func getFavoriteProducts() {
        isLoading = true
        error = nil
        
        do {
            self.favoriteProducts = try favoriteProductService.getFavoriteProducts()
            self.isLoading = false
        } catch {
            self.error = error
            self.isLoading = false
        }
    }
    
    func addFavoriteProduct(_ product: Product) {
        favoriteProductService.add(product)
        getFavoriteProducts()
        self.isFavProduct = true
//        setIsFavoritProduct(id: product.id)
    }
    
    func deleteFavoriteProduct(id: Int) {
        if let favProduct = favoriteProducts.first(where: { $0.id == id }) {
            favoriteProductService.delete(favProduct)
            self.isFavProduct = false
//            setIsFavoritProduct(id: id)
        }
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
