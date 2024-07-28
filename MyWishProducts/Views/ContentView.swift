//
//  ContentView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 25/07/24.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
//        TabView {
//            ProductsView()
//                .tabItem {
//                    Label("Products", systemImage: "house")
//                }
//
//            FavoriteProductsView()
//                .tabItem {
//                    Label("Favorites", systemImage: "heart")
//                }
//        }
//        .tint(Color("Primary"))
        ProductsView()
            .tint(Color("Primary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductsViewModel())
            .environmentObject(FavoriteProductsViewModel())
    }
}
