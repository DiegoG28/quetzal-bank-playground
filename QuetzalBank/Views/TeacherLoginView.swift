import SwiftUI

struct TeacherLoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var keep: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                TextField("username",
                text: $username)
                TextField("password",
                text: $password)
                NavigationLink(destination: MainView()) {
                    Text("Login")
                }.simultaneousGesture(
                    TapGesture()
                        .onEnded{
                        print("Tapped")
                        UserDefaults.standard
                            .set(username, forKey: "user")
                        UserDefaults.standard
                            .set(password, forKey: "pass")
                        })
                Toggle(isOn: $keep) {
                    Text("Mantener sesion")
                }
            }.onDisappear{
                print("tilin")
                username = ""
                password = ""
                
            }
        }
    }
}

struct MainView: View {
    @State var user = UserDefaults.standard.string(forKey: "user") ?? ""
    @State var pass = UserDefaults.standard.string(forKey: "pass") ?? ""
    var body: some View {
        VStack {
            Text("Data view")
            Text(user)
            Text(pass)
        }.onAppear{
            user = UserDefaults.standard.string(forKey: "user") ?? ""
            pass = UserDefaults.standard.string(forKey: "pass") ?? ""
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherLoginView()
    }
}
