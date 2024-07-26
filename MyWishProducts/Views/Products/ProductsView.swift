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
                            ProductDetailView(product: product)
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
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            Text(product.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(20)
        .background(.teal)
        .cornerRadius(10)
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(ProductsViewModel())
    }
}
