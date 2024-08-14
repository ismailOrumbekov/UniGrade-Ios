//
//  TeachersView.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 11.08.2024.
//

import SwiftUI

struct TeachersView: View {
    let layout = [GridItem(.flexible())]
    @State private var searchText: String = ""

    var filteredTeachers: [Teacher] {
            if searchText.isEmpty {
                return testTeachers
            } else {
                return testTeachers.filter { teacher in
                    teacher.name.contains(searchText) || teacher.lastName.contains(searchText)
                }
            }
        }
    
    let testTeachers = [
        Teacher(id: "1", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),
        Teacher(id: "2", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),
        Teacher(id: "3", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),
        Teacher(id: "4", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),
        Teacher(id: "5", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),
        
        Teacher(id: "6", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),
        Teacher(id: "7", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),
        Teacher(id: "8", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),
        Teacher(id: "9", name: "Бахытжан", lastName: "Еликбай", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),
        
        
    ]
    
    
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading){
                Text("Преподователи")
                    .bold()
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.leading)
                
                TextField("Поиск", text: $searchText)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: Resources.screen.width * 0.9)
                                    .padding()
                
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)

            ScrollView(.vertical, showsIndicators: false) {
                
                
            
                LazyVGrid(columns: layout, spacing: 10) {
                    ForEach(filteredTeachers, id: \.id) { item in
                        TeacherCell(teacher: item)
                    }
                }

            }
            .padding(.top, 10)
            .ignoresSafeArea(edges: .bottom)
            .background(Color(hexString: "#F0F1F2"))

        }
        .background(Color.white)

        
    }

}

#Preview {
    TeachersView()
}
