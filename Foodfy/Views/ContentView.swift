//
//  ContentView.swift
//  Foodfy
//
//  Created by Diego Jurfest Ceccon on 27/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListVM: OrderListViewModel
    
    @State private var showSheet: Bool = false
    
    init() {
        self.orderListVM = OrderListViewModel()
    }
    
    private func delete(at offsets: IndexSet) {

        offsets.forEach { index in
            let orderVM = self.orderListVM.orders[index]
            self.orderListVM.deleteOrder(orderVM)
            
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    
                    ForEach(self.orderListVM.orders, id: \.name) { order in
                        
                        HStack {
                            Image(order.type)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                            
                            Text(order.name).font(.largeTitle)
                                .padding([.leading], 10)
                        }
                        
                    }.onDelete(perform: delete)
                    
                }
            }
            .sheet(isPresented: $showSheet, onDismiss: {
                self.orderListVM.fetchAllOrders()
            }, content: {
                AddOrderView(showSheet: self.$showSheet)
            })
            .navigationBarTitle("Orders", displayMode: .automatic)
            .navigationBarItems(trailing: Button("Add Order") {
                self.showSheet = true
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
