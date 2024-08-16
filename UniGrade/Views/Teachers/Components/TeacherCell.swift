//
//  TeacherCell.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 11.08.2024.
//

import SwiftUI

struct TeacherCell: View {
    @State private var grade = 0
    let viewModel: TeacherViewModel
    var body: some View {
        HStack{
            Image("StudentImage")
                .resizable()
                .frame(maxWidth: 70, maxHeight: 70)
                .aspectRatio(contentMode: .fill)
                .clipped()
                .cornerRadius(50)
                .padding()
                .padding(.trailing)
            
            VStack(alignment: .leading){
                Text("\(viewModel.teacher.name) \(viewModel.teacher.lastName)")
                    .font(Resources.Fonts.mainFont(size: 20))
                    .fontWeight(.medium)
                
                Text("Средняя оценка: \(viewModel.getAvgGrade())")
                    .padding(.bottom, 2)
                
                Text("Основной предмет: Философия" )
                    .font(Resources.Fonts.mainFont(size: 13))
                    
                

            }
            .padding(.trailing, 50)
            
        }
        .frame(width: Resources.screen.width * 0.95)
        .background(Color.white)
        .cornerRadius(10)
    }
    
}

#Preview {
    TeacherCell(viewModel: TeacherViewModel(teacher: Teacher(id:"1", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30)))
}
