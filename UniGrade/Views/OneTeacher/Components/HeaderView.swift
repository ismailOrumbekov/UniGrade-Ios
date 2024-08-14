//
//  HeaderView.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 14.08.2024.
//

import SwiftUI

struct HeaderView: View {
    let teacher: Teacher
    var body: some View {
        VStack{
            Image("teacher")
                .fixedSize()
                .frame(width: 150, height: 150)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(75)
            Text("")
        }
    }
}

#Preview {
    HeaderView(teacher: Teacher(id: "1", name: "asd", lastName: "asf", age: 12, university: "asfa", avgGrade: 2.3, numberOfGrades: 21))
}
