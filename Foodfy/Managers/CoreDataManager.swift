//
//  CoreDataManager.swift
//  Foodfy
//
//  Created by Diego Jurfest Ceccon on 27/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//
// Singleton Design Pattern
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var managedObjectContext: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.managedObjectContext = moc
    }
    
    func saveOrder(name: String, type: String) {
        
        let order = Order(context: self.managedObjectContext)
        order.name = name
        order.type = type
        
        do {
            try self.managedObjectContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func getAllOrders() -> [Order] {
        
        var orders = [Order]()
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        
        do {
            orders = try self.managedObjectContext.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return orders
    }
    
    
    private func fetchOrder(name: String) -> Order? {
        
        var orders = [Order]()
        
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            orders = try self.managedObjectContext.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        
        return orders.first
        
    }
    
    func deleteOrder(name: String) {
        
        do {
            if let order = fetchOrder(name: name) {
                self.managedObjectContext.delete(order)
                try self.managedObjectContext.save()
            }
            
        } catch let error as NSError {
            print(error)
        }
        
    }
    
    
}
