//
//  HeaderView.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 14.08.2024.
//

import SwiftUI

struct HeaderView: View {
    let viewModel: TeacherViewModel
    var body: some View {
        VStack{
            viewModel.image
                .fixedSize()
                .frame(width: 150, height: 150)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(75)
                .padding(.vertical)
            Text("\(viewModel.teacher.name) \(viewModel.teacher.lastName)")
                .bold()
                .font(Resources.Fonts.mainFont(size: 25))
                .padding(.bottom, 2)

            Text("Учебное заведение: \(viewModel.teacher.university)")
                .font(Resources.Fonts.mainFont(size: 15))
                .padding(.bottom, 2)

            Text("Основной предмет: Философия")
                .font(Resources.Fonts.mainFont(size: 15))
            
            
            HStack{
                Button {
                    print("hello, world")
                } label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .padding(.bottom, 3)
                    Text("Написать отзыв")
                        .foregroundColor(.white)
                        .font(Resources.Fonts.mainFont(size: 15))
                        
                }
                .padding()
                .background(Resources.Colors.mainColor)
                .cornerRadius(10)
                
                
                Button {
                    print("hello, world")
                } label: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .frame(width: 20, height: 5)
                        .foregroundColor(Resources.Colors.mainColor)

                }
                
                .padding()
                .background(Resources.Colors.passiveColor)
                .cornerRadius(10)
            }
            .padding(.bottom)

        }
        .frame(width: Resources.screen.width * 0.95)
        .background(Color.white)
        .cornerRadius(15)

        
    }
}

#Preview {
    HeaderView(viewModel: TeacherViewModel(teacher: Teacher(id: "1", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),image: Image("teacher")))
}
