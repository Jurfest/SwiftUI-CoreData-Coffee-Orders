//
//  AddOrderViewModel.swift
//  Foodfy
//
//  Created by Diego Jurfest Ceccon on 27/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import Foundation
import SwiftUI

class AddOrderViewModel {
    
    var name: String = ""
    var type: String = ""
    
//    init(name: String, type: String) {
//        self.name = name
//        self.type = type
//    }
    
    func saveOrder() {
        CoreDataManager.shared.saveOrder(name: self.name, type: self.type)
    }
}
