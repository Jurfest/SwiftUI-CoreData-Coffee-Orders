//
//  AddOrderView.swift
//  Foodfy
//
//  Created by Diego Jurfest Ceccon on 27/08/20.
//  Copyright © 2020 ___DIEGOJURFESTCECCON___. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
    
    @State var addOrderVM = AddOrderViewModel()
    @Binding var showSheet: Bool
    
    
    var body: some View {
        
        NavigationView {
            Group {
                VStack(alignment: .center) {
                    TextField("Enter name", text: self.$addOrderVM.name)
                    
                    Picker(selection: self.$addOrderVM.type, label: Text("")) {
                        
                        Text("Cappuccino").tag("cappuccino")
                        Text("Regular").tag("regular")
                        Text("Expresso").tag("expresso")
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Button("Place order") {
                        self.addOrderVM.saveOrder()
                        self.showSheet = false
                    }
                    .padding(8)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
                    
                    
                    
                }
            }.padding()
                
                .navigationBarTitle("Add Order")
        }
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(showSheet: .constant(false))
    }
}
