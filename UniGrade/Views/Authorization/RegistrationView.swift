//
//  RegistrationView.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 10.08.2024.
//

import SwiftUI

struct RegistrationView: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var password: String
    @Binding var remember: Bool
    @Binding var showAuthorization: Bool
    
    var body: some View {
        VStack(spacing: (45)){
            TopView(title: "Добро пожаловать", detail: "Пожалуйста авторизуйтесь")
            InfoTF(title: "Email", text: $email)
            
            VStack(spacing: 24){
                PasswordCheckField()
                
                HStack{
                    Toggle(isOn: $remember, label: {
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
                    showAuthorization.toggle()
                }
                print(showAuthorization)
            } label: {
                Text("Еще нету аккаунта?   ***Зарегистрироваться***")
            }
            .tint(.primary)

        }
            .padding()
        
    }}

#Preview {
    HomeView()
//    RegistrationView()
}
