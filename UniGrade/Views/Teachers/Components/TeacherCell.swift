//
//  TeacherCell.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 11.08.2024.
//

import SwiftUI

struct TeacherCell: View {
    @State private var grade = 0
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
                Text("Ержан Чонгаров")
                    .font(.custom("Arial", size: 20))
                    .bold()
                
                    Text("Средняя оценка: \(grade)")
                    
            }
            .padding(.trailing, 50)
            
        }
        .frame(width: Resources.screen.width * 0.9)
        .background(Color.purple)
        .cornerRadius(10)
    }
    
}

#Preview {
    TeacherCell()
}
