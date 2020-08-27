//
//  OrderListViewModel.swift
//  Foodfy
//
//  Created by Diego Jurfest Ceccon on 27/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class OrderListViewModel: ObservableObject {
   
    // Wrong:
    // var orders = [Order]()
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchAllOrders()
        print(orders)
    }
    
    func fetchAllOrders() {
        self.orders = CoreDataManager.shared.getAllOrders().map(OrderViewModel.init)
    }
    
    func deleteOrder(_ orderVM: OrderViewModel) {
        CoreDataManager.shared.deleteOrder(name: orderVM.name)
        fetchAllOrders()
    }
    
}

class OrderViewModel {
    
    var name: String = ""
    var type: String = ""
    
    init(order: Order) {
        
        self.name = order.name!
        self.type = order.type!
        
    }
}
