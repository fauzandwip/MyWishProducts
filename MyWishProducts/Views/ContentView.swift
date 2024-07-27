//
//  ContentView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 25/07/24.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        TabView {
            ProductsView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Products")
                }
            
            FavoriteProductsView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductsViewModel())
    }
}
