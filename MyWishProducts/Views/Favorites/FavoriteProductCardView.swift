//
//  FavoritProductCardView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 27/07/24.
//

import SwiftUI

struct FavoriteProductCardView: View {
    @EnvironmentObject private var favoriteProductsVM: FavoriteProductsViewModel
    @State private var showRemoveAlert = false
    var favProduct: FavoriteProduct
    
    var body: some View {
        VStack {
            imageProduct
            
            HStack(alignment: .top) {
                infoProduct
                
                Spacer()
                
                favoriteIcon
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(10)
        .frame(maxWidth: 200)
        .foregroundColor(.black)
        .padding(5)
    }
}

extension FavoriteProductCardView {
    private var imageProduct: some View {
        NavigationLink {
            ProductDetailView(productId: Int(favProduct.id), product: nil)
        } label: {
            if let thumbnail = favProduct.thumbnail {
                AsyncImage(url: URL(string: thumbnail)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: 200)
                .frame(height: 200)
            }
        }
        .background(Color("Secondary"))
        .cornerRadius(20)
    }
    
    private var infoProduct: some View {
        NavigationLink {
            ProductDetailView(productId: Int(favProduct.id), product: nil)
        } label: {
            VStack(alignment: .leading, spacing: 5) {
                Text(favProduct.title ?? "")
                    .font(.headline)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text("\(favProduct.price.toDollar())")
                    .fontWeight(.bold)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private var favoriteIcon: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    showRemoveAlert = true
                } label: {
                    Image(systemName: "heart.fill")
                        .font(.title3)
                        .foregroundColor(Color("Primary"))
                }
                .alert("Remove Product", isPresented: $showRemoveAlert) {
                    Button("Remove", role: .destructive) {
                        favoriteProductsVM.deleteFavoriteProduct(favProduct: favProduct)
                    }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Are you sure to remove product from Favorites?")
                }
            }
        }
    }
}

//struct FavoriteProductCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritProductCardView()
//    }
//}
