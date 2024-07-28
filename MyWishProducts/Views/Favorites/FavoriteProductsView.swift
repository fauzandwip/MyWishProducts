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
        VStack {
            if let error = favoriteProductsVM.error {
                ErrorView(error: error) {
                    favoriteProductsVM.getFavoriteProducts()
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(favoriteProductsVM.favoriteProducts, id: \.id) { favProduct in
                            FavoriteProductCardView(favProduct: favProduct)
                        }
                    }
                    .padding(20)
                }
                .redacted(reason: favoriteProductsVM.isLoading ? .placeholder : [])
            }
        }
        .task {
            favoriteProductsVM.getFavoriteProducts()
        }
        .navigationTitle("Favorites")
    }
}

struct FavoriteProductsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteProductsView()
            .environmentObject(FavoriteProductsViewModel())
    }
}
