import SwiftUI

struct AuthorizationView: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var password: String
    @Binding var showRegistration: Bool
    @Binding var Remember: Bool
    @State var showForgotView = false
    var action:()-> Void
    var body: some View {
        VStack(spacing: (45)){
            TopView(title: "Добро пожаловать", detail: "Пожалуйста авторизуйтесь")
            InfoTF(title: "Email", text: $email)
            
            VStack(spacing: 24){
                PasswordTF(title: "Пароль", text: $password)
                
                HStack{
                    Toggle(isOn: $Remember, label: {
                        Text("Запомнить пароль")
                    })
                    .toggleStyle(RememberStyle())
                    Spacer()
                    Button {
                        print("Восстановление пароля")
                    } label: {
                        Text("Забыли пароль?").bold()
                            .font(.footnote)
                    }
                    .tint(.primary)

                }
                
            }
            SignInButton(title: "Войти", action: {})
            OrView(title: "Или")
            
            HStack(spacing: 60){
                signAccount(image: .email, width: 32, height: 32, action: {})
                signAccount(image: .email, width: 32, height: 32, action: {})
                signAccount(image: .email, width: 32, height: 32, action: {})
            }
            
            Spacer()
            
            Button {
                email = ""
                password = ""
                withAnimation {
                    showRegistration.toggle()
                }
            } label: {
                Text("Еще нету аккаунта?   ***Зарегистрироваться***")
            }
            .tint(.primary)

        }
            .padding()
        
    }
}

#Preview {
    HomeView()
}


struct TopView: View {
    var title: String
    var detail: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(title).font(.title.bold())
            Text(detail).foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct InfoTF: View {
    var title: String
    @Binding var text: String
    @FocusState var isActive
    var body: some View {
        ZStack(alignment: .leading){
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            
            Text(title).padding(.leading)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .foregroundStyle(isActive ? .white: .secondary)
                .animation(.spring, value: isActive)
                .onTapGesture {
                    isActive = true
                }
        }
    }
}

struct PasswordTF: View {
    var title: String
    @Binding var text: String
    @FocusState var isActive
    @State var showPassword = false
    var body: some View {
        ZStack(alignment: .leading){
            SecureField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                .opacity(showPassword ? 0 : 1)
            
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                .opacity(showPassword ? 1 : 0)
            
            Text(title).padding(.leading)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .foregroundStyle(isActive ? .white: .secondary)
                .animation(.spring, value: isActive)
                .onTapGesture {
                    isActive = true
                }
        }
        .overlay(alignment: .trailing) {
            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                .padding(16)
                .contentShape(Rectangle())
                .foregroundStyle(showPassword ? .primary : .secondary)
                .onTapGesture {
                    showPassword.toggle()
                }
            
        }
       
    }
}

struct RememberStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack{
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                
                Text("Запомнить")
            }
        }
        .tint(.primary)

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
                .background(.primary,in: .rect(cornerRadius: 16))
        }
        .tint(.primary)
    }
}

struct OrView: View {
    var title: String
    
    var body: some View {
        HStack{
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
            
            Text(title)
            
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
        }
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
