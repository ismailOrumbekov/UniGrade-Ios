//
//  GradeCell.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 14.08.2024.
//

import SwiftUI

struct GradeCell: View {
    let grade: Grade
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("\(grade.author)")
                        .font(Resources.Fonts.mainFont(size: 20))
                        .fontWeight(.semibold)
                    
                    Text("\(grade.date)")
                        .font(Resources.Fonts.mainFont(size: 15))
                }
                .padding(.horizontal)
                
                Spacer()
                
                HStack{
                    ForEach(0..<5) { index in
                        Image(systemName: self.starType(for: index))
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.horizontal)
            }
            .frame(width: Resources.screen.width * 0.95, alignment: .leading)
            .padding()

            Text("\(grade.description)")
                .font(Resources.Fonts.mainFont(size: 18))
                .padding(.horizontal)
            
            HStack{
                Button {
                    print("aefae")
                } label: {
                    Text("Все совпало")
                        .foregroundColor(.white)
                        .padding()
                        .background(Resources.Colors.mainColor)
                        .cornerRadius(10)
                }
                
                Button {
                    print("aefae")
                } label: {
                    Text("Не подтвердилось")
                        .foregroundColor(.white)
                        .padding()
                        .background(Resources.Colors.mainColor)
                        .cornerRadius(10)
                }

            }
            .padding()
        }
        .background(Color.white)
        .frame(width: Resources.screen.width * 0.95)
        .cornerRadius(10)
    }
    
    private func starType(for index: Int) -> String {
            return index < Int(grade.grade) ? "star.fill" : "star"
        }
}

#Preview {
    GradeCell(grade: Grade(
                           author: "Исмаил",
                           grade: 2, teacher:
                            Teacher(id: "1",
                                    name: "Ержан",
                                    lastName: "Чонгаров",
                                    age: 42,
                                    university: "SDU",
                                    avgGrade: 3.5,
                                    numberOfGrades: 30),
                           description: "Не проверял таски и опаздывал на уроки. Были любимчики"))
}
