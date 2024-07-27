//
//  FavoriteProductsView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import SwiftUI

struct FavoriteProductsView: View {
    @EnvironmentObject private var favoriteProductsVM: FavoriteProductsViewModel
    
    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(favoriteProductsVM.favoriteProducts) { favProduct in
                    NavigationLink {
                        ProductDetailView()
                            .environmentObject(ProductDetailViewModel(productId: Int(favProduct.id), product: nil))
                    } label: {
                        FavoriteProductCardView(product: favProduct)
                    }
                }
            }
            .padding(20)
            .task {
                favoriteProductsVM.getFavoriteProducts()
            }
        }
    }
}

struct FavoriteProductsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteProductsView()
            .environmentObject(FavoriteProductsViewModel())
    }
}
