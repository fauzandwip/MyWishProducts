//
//  FavoriteProductService.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 26/07/24.
//

import Foundation
import CoreData

class FavoriteProductService {
    private let containerName = "FavoriteProductContainer"
    private let entityName = "FavoriteProduct"
    
    private static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoriteProductContainer")
                container.loadPersistentStores { _, error in
                    if let error = error {
                         fatalError("Unable to load persistent stores: \(error)")
                    }
                }
                return container
            }()
        
    var context: NSManagedObjectContext {
        return Self.persistentContainer.viewContext
    }
    
   func getFavoriteProducts() throws -> [FavoriteProduct] {
        let request = NSFetchRequest<FavoriteProduct>(entityName: entityName)
        let favoriteProducts = try context.fetch(request)
        return favoriteProducts
    }
    
//    func getFavoriteProduct(id: Int) throws -> FavoriteProduct? {
//        let fetchRequest: NSFetchRequest<FavoriteProduct> = FavoriteProduct.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
//
//        let results = try container.viewContext.fetch(fetchRequest)
//        return results.first
//    }

    
    func add(_ product: Product) {
        let favProduct = FavoriteProduct(context: context)
        favProduct.id = Int64(product.id)
        favProduct.title = product.title
        favProduct.thumbnail = product.thumbnail
        favProduct.price = product.price
        saveContext()
    }
    
    func delete(_ favProduct: FavoriteProduct) {
        context.delete(favProduct)
        saveContext()
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}
