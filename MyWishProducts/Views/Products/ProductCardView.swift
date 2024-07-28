//
//  ProductCardView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 27/07/24.
//

import SwiftUI

struct ProductCardView: View {
    var product: Product
    
    var body: some View {
        VStack {
            imageProduct
            
            // info product
            HStack(alignment: .top) {
                titlePrice
                Spacer()
                Spacer()
                    .frame(width: 10)
                rating
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

extension ProductCardView {
    private var imageProduct: some View {
        AsyncImage(url: URL(string: product.thumbnail)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .frame(maxWidth: 200)
        .frame(height: 200)
        .background(Color("Secondary"))
        .cornerRadius(20)
    }
    
    private var titlePrice: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(product.title)
                .font(.headline)
                .fontWeight(.medium)
                .lineLimit(1)
                .truncationMode(.tail)
            Text("\(product.price.toDollar())")
                .fontWeight(.bold)
                .font(.headline)
        }
    }
    
    private var rating: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text("\(String(format: "%.1f", product.rating))")
                .fontWeight(.medium)
        }
        .font(.subheadline)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: Product(
            id: 1,
            title: "Essence Mascara Lash Princess",
            thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
            price: 9.99,
            rating: 4.94,
            description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
            tags: ["beauty", "mascara"],
            reviews: [
                ProductReview(rating: 2, comment: "Very unhappy with my purchase!", reviewerName: "John Doe", reviewerEmail: "john.doe@x.dummyjson.com")
            ]))
    }
}
