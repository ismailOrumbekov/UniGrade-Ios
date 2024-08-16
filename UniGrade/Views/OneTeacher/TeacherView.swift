//
//  TeacherView.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 14.08.2024.
//

import SwiftUI

struct TeacherView: View {
    let viewModel: TeacherViewModel
    var body: some View {
        VStack{
            HStack{

                Button {
                    print("hello, world")
                } label: {
                    Resources.Images.backButtonImage
                        .resizable()
                        .frame(width: 15, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .foregroundColor(Resources.Colors.mainColor)
                }

            }
            .padding(.bottom, 10)
            .padding(.horizontal)
            .frame(width: Resources.screen.width, height: 80, alignment: .bottomLeading)


            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 0) {
                    HeaderView(viewModel: viewModel)
                        .padding(.top)
                    
                    HStack(){
                        VStack(alignment: .leading){
                            Text("\(viewModel.teacher.numberOfGrades) оценок")
                                .font(Resources.Fonts.mainFont(size: 15))
                                .bold()
                            
                            Text("\(viewModel.teacher.numberOfGrades) оценок выше 3")
                                .font(Resources.Fonts.mainFont(size: 15))
                        }
                        .padding()
                        .frame(alignment: .leading)
                        Spacer()
                        HStack{
                            Text("\(viewModel.getAvgGrade())")
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        .padding(.trailing)
                    }
                    .frame(maxWidth: Resources.screen.width * 0.95, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.top)
                    
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
                    .padding(.top)
                    
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
                    .padding(.top)
                    
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
                    .padding(.top)
                    
                    GradeCell(grade: Grade(
                        author: "Исмаил",
                        grade: 4, teacher:
                         Teacher(id: "1",
                                 name: "Ержан",
                                 lastName: "Чонгаров",
                                 age: 42,
                                 university: "SDU",
                                 avgGrade: 3.5,
                                 numberOfGrades: 30),
                        description: "Не проверял таски и опаздывал на уроки. Были любимчики"))
                    .padding(.top)
                    
                    GradeCell(grade: Grade(
                        author: "Исмаил",
                        grade: 5, teacher:
                         Teacher(id: "1",
                                 name: "Ержан",
                                 lastName: "Чонгаров",
                                 age: 42,
                                 university: "SDU",
                                 avgGrade: 3.5,
                                 numberOfGrades: 30),
                        description: "Не проверял таски и опаздывал на уроки. Были любимчики"))
                    .padding(.top)
                    
                    GradeCell(grade: Grade(
                        author: "Исмаил",
                        grade: 5, teacher:
                         Teacher(id: "1",
                                 name: "Ержан",
                                 lastName: "Чонгаров",
                                 age: 42,
                                 university: "SDU",
                                 avgGrade: 3.5,
                                 numberOfGrades: 30),
                        description: "Не проверял таски и опаздывал на уроки. Были любимчики"))
                    .padding(.top)
                    
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
                    .padding(.top)
                    
                    GradeCell(grade: Grade(
                        author: "Исмаил",
                        grade: 1, teacher:
                         Teacher(id: "1",
                                 name: "Ержан",
                                 lastName: "Чонгаров",
                                 age: 42,
                                 university: "SDU",
                                 avgGrade: 3.5,
                                 numberOfGrades: 30),
                        description: "Не проверял таски и опаздывал на уроки. Были любимчики"))
                    .padding(.top)
                    
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
                    .padding(.top)
                    
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.bottom)
                .background(Resources.Colors.passiveColor)
            }
            
            .frame(width: Resources.screen.width, alignment: .top)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TeacherView(viewModel: TeacherViewModel(teacher: Teacher(id: "1", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),image: Image("teacher")))
}
