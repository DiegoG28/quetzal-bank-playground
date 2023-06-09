//
//  TransferView.swift
//  OURBANK
//
//  Created by IMAC 20 on 22/05/23.
//

import SwiftUI

struct TransferView: View {
    
    @State private var accountNumber: String = ""
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text("Destination").frame(maxWidth: .infinity, alignment: .leading)
                TextField("Enter account number.", text: $accountNumber)
                    .overlay(Rectangle().frame(height: 1).padding(.top, 30)
                    ).foregroundColor(Color("FontPrimary")).frame(maxWidth: .infinity, alignment: .leading)
                Text("Recents").frame(maxWidth: .infinity, alignment: .leading).padding(0.5)
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

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
