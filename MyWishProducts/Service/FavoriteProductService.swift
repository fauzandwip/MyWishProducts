//
//  FavoriteProductService.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import Foundation
import CoreData

class FavoriteProductService {
    private let container: NSPersistentContainer
    private let containerName = "FavoriteProductContainer"
    private let entityName = "FavoriteProductEntity"
    
    init() {
        self.container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error {
                print("Error loading core data! \(error)")
            }
        }
    }
    
   func getFavoriteProducts() throws -> [FavoriteProductEntity] {
        let request = NSFetchRequest<FavoriteProductEntity>(entityName: entityName)
        let favoriteProducts = try container.viewContext.fetch(request)
        return favoriteProducts
    }
    
    func getFavoriteProduct(id: Int) throws -> FavoriteProductEntity? {
        let fetchRequest: NSFetchRequest<FavoriteProductEntity> = FavoriteProductEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)

        let results = try container.viewContext.fetch(fetchRequest)
        return results.first
    }

    
    func addFavoriteProduct(_ product: Product) {
        let favProduct = FavoriteProductEntity(context: container.viewContext)
        favProduct.id = Int64(product.id)
        favProduct.title = product.title
        favProduct.thumbnail = product.thumbnail
        favProduct.price = product.price
        favProduct.rating = product.rating
        saveContext()
    }
    
    func deleteFavoriteProduct(id: Int) {
        do {
            if let favProduct = try getFavoriteProduct(id: id) {
                container.viewContext.delete(favProduct)
            }
            saveContext()
        } catch {
            print("error delete favorite product")
        }
    }
    
    func saveContext() {
        do {
            try container.viewContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}
