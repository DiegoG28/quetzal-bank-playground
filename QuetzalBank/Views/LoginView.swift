//
//  LoginView.swift
//  QuetzalBank
//
//  Created by IMAC 20 on 25/05/23.
//

import SwiftUI
import LocalAuthentication

struct LoginView: View {
    let gradient = LinearGradient(colors: [Color.purple, Color.blue],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
    @State private var nombre :
    String = ""
    @Binding var isUserLoggedIn: Bool
    @Binding var username: String
    @StateObject var uvm: UserViewModel = UserViewModel()
    @State var shouldUpdateUser: Bool = false
    @State var userToUpdate: UserEntity?
    @State private var showAlert = true
    @State private var showGreeting = false
    var context = LAContext()
    let ntf = NotificationHandler(title: "hola", subtitle: "Diego", body: "Te quiero")
    
    func authenticate() {
        var error: NSError?
        
        if
            context.canEvaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Accesder con Face ID"){
                sucess, authenticationError in
                if (sucess){
                    print("user auth succes")
                    isUserLoggedIn = true
                } else if ((authenticationError) != nil){
                    print("Auth failed")
                    print(authenticationError?.localizedDescription ??
                          "No error")
                }else {
                    print("Biometric unavailable")
                    print(error?.localizedDescription ??
                          "Error principal")
                }
            }
        }
    }
    
    var body: some View {
        VStack{
            Button("") {
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Face ID"),
                        primaryButton: .default(
                            Text("Si"),
                            action: authenticate
                        ),
                        secondaryButton: .destructive(
                            Text("No"),
                            action: {}
                        )
                    )
                }
            Image(systemName: "person")
                .resizable(capInsets:(EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)))
                .frame(width: 100,height: 100)
            
            Text("QuetzalBank").padding(50)
            
            GroupBox(label: Text("Usuario:")) {
                TextField("Usuario", text: $uvm.c_username)
            }
            GroupBox(label: Text("Password:")) {
                TextField("Password", text: $uvm.c_password)
            }
            Button("Ingresar"){
                //uvm.createUser()
                ntf.showNotification()
                authenticate()
            }
            .frame(width: 500)
                .foregroundColor(Color.black)
                .background(Color.gray)
            Button("Guardar"){
                uvm.createUser()
                username = uvm.c_username
                isUserLoggedIn = true
            }
            .frame(width: 500)
                .foregroundColor(Color.black)
                .background(Color.gray)
            Toggle("Mantener sesión", isOn: $showGreeting)
            Toggle("FaceID", isOn: $showGreeting)
            Button {
            } label: {
                Text("The Gradient")
                    .padding()
                    .background {
                        Capsule()
                            .stroke(gradient, lineWidth: 2)
                            .saturation(1.8)
                    }
            }.onAppear(){
                ntf.requestPermission()
            }
            
        }
            
        
    }
}

