import SwiftUI
import UIKit

struct AuthorizationView: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var password: String
    @Binding var showRegistration: Bool
    @Binding var Remember: Bool
    @State var showForgotView = false
    var action:()-> Void
    var body: some View {
        ScrollView{
            VStack(spacing: (45)){
                TopView(title: "Добро пожаловать", detail: "Пожалуйста авторизуйтесь")
                InfoTF(title: "Почта", text: $email)
                
                VStack(spacing: 24){
                    PasswordTF(title: "Пароль", text: $password)
                    
                    HStack{
                        Toggle(isOn: $Remember, label: {
                            Text("Запомнить пароль").foregroundStyle(Color(hexString: "#8E8E93"))
                        })
                        .toggleStyle(RememberStyle())
                        Spacer()
                        Button {
                            print("Восстановление пароля")
                        } label: {
                            Text("Забыли пароль?").bold()
                                .foregroundStyle(.white)
                                .font(.footnote)
                        }
                        .tint(.primary)
                        
                    }
                    
                }
                SignInButton(title: "Войти", action: { navigateToMainScreen()})
                OrView(title: "Или")
                
                HStack(spacing: 60){
                    signAccount(image: .email, width: 32, height: 32, action: {})
                    signAccount(image: .email, width: 32, height: 32, action: {})
                    signAccount(image: .email, width: 32, height: 32, action: {})
                }
                
                Button {
                    email = ""
                    password = ""
                    withAnimation {
                        showRegistration.toggle()
                    }
                } label: {
                    Text("Еще нету аккаунта?   ***Зарегистрироваться***")
                        .foregroundStyle(.white)
                }
                
            }
            .padding()
        }
    }
    
    func navigateToMainScreen() {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                let viewController = TabBarViewController()
                window.rootViewController = viewController
                window.makeKeyAndVisible()
            }
        }

}



struct SignInButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: {action()}) {
            Text(title).font(.title2.bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.white,in: .rect(cornerRadius: 16))
        }
        .tint(.primary)
    }
}



struct signAccount: View {
    var image: ImageResource
    var width: CGFloat
    var height: CGFloat
    var action:() -> Void
    var body: some View {
        Button(action: {action()}) {
            
            Image(image)
                .resizable().scaledToFill()
                .frame(width: width, height: height)
                .overlay {
                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1.5)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.gray.opacity(0.3))
                }
        }
        .tint(.primary)
            
    }
}


#Preview {
    HomeView()
}
