import SwiftUI

struct AuthorizationView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
//            Image("Logo")
//                .resizable()
//                .frame(maxWidth: 250, maxHeight: 200)
//                .aspectRatio(contentMode: .fill)
//                .clipped()
//                .ignoresSafeArea()
//                .background(Color.white)
//                .padding(.bottom)
            
//            Text("UniGrade")
//                .font(.custom("Arial", size: 32))
//                .foregroundColor(.white)
//                .bold()
//                .padding(.bottom, 80)
            
            Text("Авторизоваться")
                .font(.custom("Arial", size: 28))
                .foregroundColor(.white)
                .padding(.bottom)
            
            VStack {
                TextField("Введите вашу почту", text: $email)
                    .frame(width: 300)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                
                SecureField("Введите пароль", text: $password)
                    .frame(width: 300)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
            }
            
            VStack {
                Button {
                    print("hello world")
                } label: {
                    Text("Войти")
                        .font(.custom("Arial", size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150)
                        .background(Color(hexString: "#0D1A55"))
                        .cornerRadius(15)
                        .padding(.top, 20)
                }
                .padding(.top)
                
                Button {
                    print("je")
                } label: {
                    Text("Зарегистрироваться")
                        .font(.custom("Arial", size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 6)
                        .cornerRadius(15)
                }
                .padding(.top)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Resources.Colors.backgroundColor)
        .ignoresSafeArea()
    }
}

#Preview {
    AuthorizationView()
}
