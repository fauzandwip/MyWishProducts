//
//  MyWishProductsApp.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 25/07/24.
//

import SwiftUI

@main
struct MyWishProductsApp: App {
    @StateObject private var productsVM = ProductsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ProductsView()
                .environmentObject(productsVM)
        }
    }
}
