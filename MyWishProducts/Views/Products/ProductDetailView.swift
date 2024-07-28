//
//  ProductDetailView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject private var productDetailVM: ProductDetailViewModel
    
    init(productId: Int, product: Product?) {
        _productDetailVM = StateObject(wrappedValue: ProductDetailViewModel(productId: productId, product: product))
    }
    
    var body: some View {
        if let error = productDetailVM.error {
            ErrorView(error: error) {
                productDetailVM.fetchProductById(id: productDetailVM.productId)
            }
        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    if let thumbnail = productDetailVM.product?.thumbnail {
                        imageProduct(thumbnail: thumbnail)
                    } else {
                        ProgressView()
                            .frame(height: 300)
                            .frame(maxWidth: .infinity)
                    }
                    
                    VStack {
                        VStack {
                            detailProduct
                            
                            description
                        }
                        
                        // reviews
                        ProductReviewListView(reviews: productDetailVM.product?.reviews ?? [])
                    }
                    .padding(20)
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
                .background(Color("Secondary"))
                .redacted(reason: productDetailVM.isLoading ? .placeholder : [])
            }
            .frame(maxWidth: .infinity)
            .toolbar {
                ToolbarItem {
                    Button {
                        print("add wishlist")
                        productDetailVM.favoriteButtonAction()
                    } label: {
                        Image(systemName: productDetailVM.isFavProduct ? "heart.fill" : "heart")
                            .foregroundColor(Color("Primary"))
                            .font(.title2)
                    }

                }
            }
        }
    }
}

extension ProductDetailView {
    private func imageProduct(thumbnail: String) -> some View {
             AsyncImage(url: URL(string: thumbnail)) { image in
                image
                    .resizable()
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
            } placeholder: {
                ProgressView()
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
            }
    }
    
    private var detailProduct: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                // title
                Text(productDetailVM.product?.title ?? productDetailVM.placeholder.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                // rating
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(String(format: "%.1f", productDetailVM.product?.rating ?? productDetailVM.placeholder.rating))")
                        .fontWeight(.medium)
                }
                .font(.title3)
                .fontWeight(.bold)
            }
            Spacer()
            Spacer()
                .frame(width: 10)
            
            // price
            Text("\((productDetailVM.product?.price ?? productDetailVM.placeholder.price).toDollar())")
                .font(.title)
                .fontWeight(.thin)
        }
    }
    
    private var description: some View {
        VStack {
            Text(productDetailVM.product?.description ?? productDetailVM.placeholder.description)
            
            HStack() {
                Spacer()
                ForEach(productDetailVM.product?.tags ?? [], id: \.self) { tag in
                    Text("#\(tag)")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color("Primary"))
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.medium)
                }
            }
            .padding(5)
        }
        .padding(.top)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailView(productId: 1, product: Product(
                                    id: 1,
                                    title: "Essence Mascara Lash Princess",
                                    thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
                                    price: 9.99,
                                    rating: 4.94,
                                    description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
                                    tags: ["beauty", "mascara"],
                                    reviews: [
                                        ProductReview(rating: 2, comment: "Very unhappy with my purchase!", reviewerName: "John Doe", reviewerEmail: "john.doe@x.dummyjson.com"),
                                        ProductReview(rating: 2, comment: "Very unhappy with my purchase!", reviewerName: "John Doe", reviewerEmail: "john.doe@x.dummyjson.com")
                                    ]))
        }
    }
}
