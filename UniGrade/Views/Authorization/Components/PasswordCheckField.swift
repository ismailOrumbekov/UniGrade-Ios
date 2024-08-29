import SwiftUI

struct PasswordCheckField: View {
    @State var text = ""
    @FocusState var isActive
    @State var checkMinChars = false
    @State var checkLetter = false
    @State var checkPunctuation = false
    @State var checkNumber = false
    @State var showPassword = false
    
    var progressColor: Color {
        let containsLetters = text.rangeOfCharacter(from: .letters) != nil
        let containsNumbers = text.rangeOfCharacter(from: .decimalDigits) != nil
        let containsPunctuation = text.rangeOfCharacter(from: CharacterSet(charactersIn: "1@#%^&")) != nil
        if containsLetters && containsNumbers && containsPunctuation && text.count >= 8 {
            return Color.green
        } else if containsLetters && !containsNumbers && !containsPunctuation {
            return Color.red
        } else if containsNumbers && !containsLetters && !containsPunctuation {
            return Color.red
        } else if containsLetters && containsNumbers && !containsPunctuation {
            return Color.yellow
        } else if containsLetters && containsNumbers && containsPunctuation {
            return Color.blue
        } else {
            return .gray
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            ZStack(alignment: .leading) {
                ZStack {
                    SecureField("", text: $text)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundColor(.white)
                        .focused($isActive)
                        .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                        .opacity(showPassword ? 0 : 1)

                    TextField("", text: $text)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundColor(.white)
                        .focused($isActive)
                        .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                        .opacity(showPassword ? 1 : 0)
                }
                
                Text("Пароль")
                    .padding(.horizontal)
                    .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                    .foregroundStyle(isActive ? .white : Color(hexString: "#8E8E93"))
                    .animation(.spring(), value: isActive)
                    .onTapGesture {
                        isActive = true
                    }
                    .onChange(of: text) { newValue in
                        withAnimation {
                            checkMinChars = newValue.count >= 8
                            checkLetter = newValue.rangeOfCharacter(from: .letters) != nil
                            checkNumber = newValue.rangeOfCharacter(from: .decimalDigits) != nil
                            checkPunctuation = newValue.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#%^&")) != nil
                        }
                    }
            }
            .overlay(alignment: .trailing) {
                Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                    .foregroundStyle(showPassword ? .white : Color(hexString: "#8E8E93"))
                    .padding(16)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showPassword.toggle()
                    }
            }
            
            VStack(alignment: .leading) {
                CheckText(text: "Минимум 8 знаков", check: $checkMinChars)
                CheckText(text: "Минимум одна буква", check: $checkLetter)
                CheckText(text: "Минимум один знак", check: $checkPunctuation)
                CheckText(text: "Минимум одна цифра", check: $checkNumber)
            }
            
        }
    }
}

#Preview {
    PasswordCheckField()
}

struct CheckText: View {
    let text: String
    @Binding var check: Bool
    
    var body: some View {
        HStack {
            Image(systemName: check ? "checkmark.circle.fill" : "circle")
                
            Text(text)
        }
        .frame(alignment: .leading)
        .foregroundColor(check ? .white : Color(hexString: "#8E8E93"))
    }
}
