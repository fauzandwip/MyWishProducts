//
//  ProductDetailView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    // image
                    AsyncImage(url: URL(string: product.thumbnail)) { image in
                        image
                            .resizable()
                            .frame(height: 300)
                            .frame(maxWidth: .infinity)
                    } placeholder: {
                        ProgressView()
                            .frame(height: 300)
                            .frame(maxWidth: .infinity)
                    }
                    
                    // title, price, rating
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .background(.blue)
                        Text("\(String(format: "%.2f", product.price))")
                        Text("\(String(format: "%.1f", product.rating))")
                    }
                    .background(.yellow)
                    
                    // description, tags
                    VStack {
                        Text(product.description)
                        
                        HStack() {
                            Spacer()
                            ForEach(product.tags, id: \.self) { tag in
                                Text("#\(tag)")
                            }
                        }
                    }
                    
                    // reviews
                    ProductReviewListView(reviews: product.reviews ?? [])
                    
                }
                .background(.teal)
            }
            .frame(maxWidth: .infinity)
    }
}

struct ProductReviewListView: View {
    var reviews: [ProductReview]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Reviews :")
                .font(.title3)
                .fontWeight(.semibold)
            List(reviews, id: \.reviewerEmail) { review in
                HStack {
                    Text(review.reviewerEmail)
                    Text(review.reviewerName)
                }
                Text("test")
            }
            .background(.red)
            .frame(height: 200)
        }
        .background(.green)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(id: 1, title: "Essence Mascara Lash Princess", description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.", category: "beauty", price: 9.99, rating: 4.94, tags: [
            "beauty",
            "mascara"
        ], thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png", reviews: [ProductReview(rating: 2, comment: "Very unhappy with my purchase!", reviewerName: "John Doe", reviewerEmail: "john.doe@x.dummyjson.com")]))
    }
}
