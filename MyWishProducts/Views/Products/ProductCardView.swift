//
//  ProductCardView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 27/07/24.
//

import SwiftUI

//struct ProductCardView: View {
//    var product: Product
//
//    var body: some View {
//        HStack(spacing: 20) {
//            VStack {
//                AsyncImage(url: URL(string: product.thumbnail)) { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                } placeholder: {
//                    ProgressView()
//                }
//                .frame(height: 200)
//                .frame(maxWidth: 200)
//                .background(.secondary)
//                .cornerRadius(20)
//
//                HStack {
//                    VStack {
//                        Text(product.title)
//                        Text("\(String(format: "%.2f", product.price))")
//                    }
//
//                    HStack(spacing: 0) {
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.yellow)
//                        Text("\(String(format: "%.1f", product.rating))")
//                    }
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .cornerRadius(10)
//            .background(.teal)
//            .frame(maxWidth: 200)
//        }
//    }
//}

//struct ProductCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCardView(product: Product(
//            id: 1,
//            title: "Essence Mascara Lash Princess",
//            thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
//            price: 9.99,
//            rating: 4.94,
//            category: "beauty",
//            description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
//            tags: ["beauty", "mascara"],
//            reviews: [
//                ProductReview(rating: 2, comment: "Very unhappy with my purchase!", reviewerName: "John Doe", reviewerEmail: "john.doe@x.dummyjson.com")
//            ]))
//    }
//}
