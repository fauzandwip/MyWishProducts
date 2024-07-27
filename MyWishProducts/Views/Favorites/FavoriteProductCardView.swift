//
//  FavoritProductCardView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 27/07/24.
//

import SwiftUI

struct FavoriteProductCardView: View {
    @EnvironmentObject private var favoriteProductsVM: FavoriteProductsViewModel
    var product: FavoriteProductEntity
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    favoriteProductsVM.deleteFavoriteProduct(id: Int(product.id))
                } label: {
                    Image(systemName: "heart.fill")
                }
            }
            AsyncImage(url: URL(string: product.thumbnail ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            Text(product.title ?? "Title")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(20)
        .background(.teal)
        .cornerRadius(10)
    }
}

//struct FavoriteProductCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritProductCardView()
//    }
//}
