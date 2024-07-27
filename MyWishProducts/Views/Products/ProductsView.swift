//
//  ProductsView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject private var productsVM: ProductsViewModel
    
    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productsVM.products) { product in
                        NavigationLink {
                            ProductDetailView()
                                .environmentObject(ProductDetailViewModel(productId: product.id, product: product))
                        } label: {
                            ProductCardView(product: product)
                        }
                    }
                }
                .padding(20)
                .task {
                    await productsVM.fetchProducts()
                }
            }
        }
    }
}

struct ProductCardView: View {
    var product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 200)
            .frame(height: 200)
            
            .background(.thinMaterial)
            .cornerRadius(20)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Text("$\(String(format: "%.2f", product.price))")
                        .fontWeight(.bold)
                        .font(.headline)
                }
                Spacer()
                Spacer()
                    .frame(width: 10)
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(String(format: "%.1f", product.rating))")
                        .fontWeight(.medium)
                }
                .font(.subheadline)
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

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(ProductsViewModel())
    }
}
