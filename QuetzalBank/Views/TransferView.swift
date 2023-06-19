//
//  TransferView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 15/06/23.

import SwiftUI

struct TransferView: View {
    @State var clabe: String = ""
    @State var concepto: String = ""
    @State var monto: String = ""
    let ntf = NotificationHandler(title: "Tranferencia exitosa", subtitle: "", body: "")
    
    var body: some View {
        VStack{
            Text("Transferencia")
            TextField("Clabe",
                      text: $clabe)
            TextField("Concepto",
                      text: $concepto)
            TextField("Monto",
                      text: $monto)
            Button("Enviar"){
                ntf.subtitle = concepto
                ntf.body = "La transferencia a \(clabe) por \(monto) se ha realizado."
                ntf.showNotification()
            }
        }.padding(16).onAppear(){
            ntf.requestPermission()
        }
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
