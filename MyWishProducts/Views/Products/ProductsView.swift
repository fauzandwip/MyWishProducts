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
            VStack {
                if let error = productsVM.error {
                    ErrorView(error: error) {
                        await productsVM.fetchProducts(searchBy: productsVM.searchText)
                    }
                } else {
                    ScrollView {
                        VStack {
                            LazyVGrid(columns: columns, spacing: 15) {
                                ForEach(productsVM.products) { product in
                                    NavigationLink {
                                        ProductDetailView(productId: product.id, product: product)
                                    } label: {
                                        ProductCardView(product: product)
                                    }
                                }
                            }
                            .padding(20)
                            .redacted(reason: productsVM.isLoading ? .placeholder : [])
                        }
                    }
                }
            }
            .searchable(text: $productsVM.searchText, placement: .navigationBarDrawer(displayMode: .always),prompt: Text("search product"))
            .onChange(of: productsVM.searchText) { value in
                Task {
                    await productsVM.fetchProducts(searchBy: value)
                }
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        FavoriteProductsView()
                    } label: {
                        Image(systemName: "heart.fill")
                            .font(.headline)
                            .foregroundColor(Color("Primary"))
                    }
                }
            }
        }
        .task {
            await productsVM.fetchProducts()
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(ProductsViewModel())
    }
}
