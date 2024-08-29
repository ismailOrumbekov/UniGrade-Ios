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
    @State var nickname = ""
    @Binding var password: String
    @Binding var remember: Bool
    @Binding var showAuthorization: Bool
    
    var body: some View {
        ScrollView{
            VStack(spacing: 45) {
                TopView(title: "Регистрация", detail: "Пожалуйста введите все данные")
                InfoTF(title: "Почта", text: $email)
                InfoTF(title: "Придумайте никнейм", text: $email)
                
                    PasswordCheckField()
                    
                
                
                SignInButton(title: "Войти", action: {})
                
 
                
                Spacer()
                
                Button {
                    email = ""
                    password = ""
                    withAnimation {
                        showAuthorization.toggle()
                    }
                    print(showAuthorization)
                } label: {
                    Text("Уже есть аккаунт?   ***Авторизоваться***")
                        .foregroundStyle(.white)
                }
                .tint(.primary)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Ограничиваем размер VStack
        }
        
    }
}

#Preview {
    HomeView()
//    RegistrationView()
}
