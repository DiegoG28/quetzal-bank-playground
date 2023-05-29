//
//  PantallaRecibir.swift
//  QuetzalBank
//
//  Created by imac 07 on 25/05/23.
//

import SwiftUI

struct ReceiveView: View {
    var body: some View {
            ZStack(alignment: .topLeading) {
                Color.white
                VStack(alignment: .leading, spacing: 10){
                Text("Recibir").padding()
                Text("Estos son los datos que debes compartir para recibir dinero a esta cuenta").padding()
                Text("Beneficiario:").padding()
                    Button(action: {
                        
                    }) {
                        Text("ALEX FRANCISCO TORRES HERNANDEZ")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    Text("CLABE:").padding()
                    Button(action: {
                        
                    }) {
                        Text("1234567890123456678")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
            }
                .padding()
        }
    }
}

struct ReceiveView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveView()
    }
}
