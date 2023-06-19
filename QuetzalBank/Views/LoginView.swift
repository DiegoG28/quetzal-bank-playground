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
    @State private var nombre: String = ""
    @Binding var isUserLoggedIn: Bool
    @Binding var defaults: UserDefaults
    @State var allowSaveUser: Bool = false
    @State var allowFaceID: Bool = false
    @StateObject var uvm: UserViewModel = UserViewModel()
    @State var shouldUpdateUser: Bool = false
    @State var userToUpdate: UserEntity?
    @State private var showAlert = true
    @Binding var username: String
    @State private var password = ""
    var context = LAContext() // Inicializa la clase Local Auth
    let ntf = NotificationHandler(title: "Hola", subtitle: "Notificación", body: "Hola soy una notificación")
    
    func authenticate() {
        var error: NSError? // Almacenará nuestro error
        if
            context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Acceder con FaceID") {
                success, authenticationError in
                if (success) {
                    print("User Auth Success")
                    //defaults.set(uvm.c_username, forKey: "username")
                    //defaults.set(uvm.c_password, forKey: "password")
                    isUserLoggedIn = true
                } else if ((authenticationError) != nil) {
                    print("Auth failed")
                    print(authenticationError?.localizedDescription ?? "No errir")
                } else {
                    print("Biometric unvailable")
                    print(error?.localizedDescription ?? "Error principal")
                }
            }
        }
    }
    
    
    var body: some View {
        VStack{
            Image(systemName: "person")
                .resizable(capInsets:(EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)))
                .frame(width: 100,height: 100).onAppear() {
                    username = defaults.string(forKey: "username") ?? ""
                    password = defaults.string(forKey: "password") ?? ""
                    allowSaveUser = defaults.bool(forKey: "allowSaveUser")
                    allowFaceID = defaults.bool(forKey: "allowFaceID")
                    print("Buenas")
                    print(allowFaceID)
                    if (allowFaceID) {
                        print("Ando entrando")
                        authenticate()
                    }
                }
            Text("QuetzalBank").padding(50)
            
            GroupBox(label: Text("Usuario:")) {
                TextField("Usuario", text: $username)
            }
            GroupBox(label: Text("Password:")) {
                TextField("Password", text: $password)
            }
            Button("Ingresar"){
                uvm.c_username = username
                uvm.c_password = password
                if (allowSaveUser) {
                    defaults.set(uvm.c_username, forKey: "username")
                    defaults.set(uvm.c_password, forKey: "password")
                    defaults.set(allowSaveUser, forKey: "allowSaveUser")
                    defaults.set(allowFaceID, forKey: "allowFaceID")
                } else {
                    defaults.removeObject(forKey: "username")
                    defaults.removeObject(forKey: "password")
                    defaults.removeObject(forKey: "allowSaveUser")
                    defaults.removeObject(forKey: "allowFaceID")
                }
                ntf.showNotification()
                isUserLoggedIn = true
            }
            .frame(width: 500)
                .foregroundColor(Color.black)
                .background(Color.gray)
            Button("Guardar"){
                uvm.createUser()
                isUserLoggedIn = true
            }
            .frame(width: 500)
                .foregroundColor(Color.black)
                .background(Color.gray)
            Toggle("Guardar datos", isOn: $allowSaveUser)
            Toggle("Usar FaceID", isOn: $allowFaceID)
            Button {
            } label: {
                Text("The Gradient")
                    .padding()
                    .background {
                        Capsule()
                            .stroke(gradient, lineWidth: 2)
                            .saturation(1.8)
                    }
            }.onAppear() {
                ntf.requestPermissions()
            }
            
        }
            
        
    }
}

