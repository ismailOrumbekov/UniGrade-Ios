//
//  BaseViews.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 28.08.2024.
//

import SwiftUI

struct TopView: View {
    var title: String
    var detail: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(title).font(.title.bold()).foregroundStyle(.white)
            Text(detail).foregroundStyle(Color(hexString: "#8E8E93"))
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
                .foregroundColor(.white)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            
            Text(title).padding(.leading)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .foregroundStyle(isActive ? .white: Color(hexString: "#8E8E93"))
                .animation(.spring, value: isActive)
                .onTapGesture {
                    isActive = true
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
                Image(systemName: configuration.isOn ? "checkmark.square" : "square").foregroundStyle(Color(hexString: "#8E8E93"))
                
                Text("Запомнить")
                    .foregroundStyle(Color(hexString: "#8E8E93"))
            }
        }
        .tint(.primary)

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
                .foregroundColor(.white)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                .opacity(showPassword ? 0 : 1)
            
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .foregroundColor(.white) 
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                .opacity(showPassword ? 1 : 0)
            
            Text(title).padding(.leading)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .foregroundStyle(isActive ? .white: Color(hexString: "#8E8E93"))
                .animation(.spring, value: isActive)
                .onTapGesture {
                    isActive = true
                }
        }
        .overlay(alignment: .trailing) {
            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                .padding(16)
                .contentShape(Rectangle())
                .foregroundStyle(showPassword ? .white : Color(hexString: "#8E8E93"))
                .onTapGesture {
                    showPassword.toggle()
                }
            
        }
       
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
                .foregroundStyle(Color(hexString: "#8E8E93"))
            
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
        }
    }
}


#Preview {
    HomeView()
}

