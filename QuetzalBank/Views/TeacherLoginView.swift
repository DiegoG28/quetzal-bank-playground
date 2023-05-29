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
                }
                Toggle(isOn: $keep) {
                    Text("Mantener sesion")
                }
            }
        }
    }
}

struct MainView: View {
    var body: some View {
        VStack {
            Text("Data view")
            Text("Data 1")
            Text("Data 2")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherLoginView()
    }
}
