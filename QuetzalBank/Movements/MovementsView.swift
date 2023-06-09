//
//  TransferView.swift
//  OURBANK
//
//  Created by IMAC 20 on 22/05/23.
//

import SwiftUI

struct MovementsView: View {
    @State private var movements2: [Movement] = []
    @State private var accountNumber: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text("Destination").frame(maxWidth: .infinity, alignment: .leading)
                    .onAppear(){
                    CentralBankAPI()
                    .fetchMovements() {
                        (movements) in movements2 = movements}
                }
                TextField("Enter account number.", text: $accountNumber)
                    .overlay(Rectangle().frame(height: 1).padding(.top, 30)
                    ).foregroundColor(Color("FontPrimary")).frame(maxWidth: .infinity, alignment: .leading)
                Text("Recents").frame(maxWidth: .infinity, alignment: .leading).padding(0.5)
                if (movements2.count == 0) {
                    Text("No hay datos")

                } else {
                    ForEach (movements2) {
                        movement in
                        GroupBox{
                            HStack{
                                Button(movement.description){
                                    
                                }.frame(maxWidth: .infinity)
                                Spacer()
                                Text("$" + movement.amount)
                            }
                        }
                    }
                }
            }.padding(.horizontal, 30)
            Spacer()
            VStack{
                
                Text("Favorites").frame(maxWidth: .infinity, alignment: .leading)
                
                GroupBox{
                    HStack{
                        Button("Mercado pago credito"){
                            
                        }.frame(maxWidth: .infinity)
                        Spacer()
                        Text("**4753")
                    }
                }
                GroupBox{
                    HStack{
                        Button("Mercado pago credito"){
                            
                        }.frame(maxWidth: .infinity)
                        Spacer()
                        Text("**4753")
                    }
                }
                GroupBox{
                    HStack{
                        Button("Mercado pago credito"){
                            
                        }.frame(maxWidth: .infinity)
                        Spacer()
                        Text("**4753")
                    }
                }
                GroupBox{
                    HStack{
                        Button("Mercado pago credito"){
                            
                        }.frame(maxWidth: .infinity)
                        Spacer()
                        Text("**4753")
                    }
                }
            }.padding(.horizontal, 30)
            Spacer()
        }
    }
}

struct MovementsView_Previews: PreviewProvider {
    static var previews: some View {
        MovementsView()
    }
}
