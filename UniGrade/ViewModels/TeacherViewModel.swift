//
//  TeacherViewModel.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 14.08.2024.
//

import Foundation
import SwiftUI
class TeacherViewModel: ObservableObject, Identifiable{
    let teacher: Teacher
    var image = Image("default")
    
    
    init(teacher: Teacher) {
        self.teacher = teacher
    }
    
    init(teacher: Teacher, image: Image){
        self.teacher = teacher
        self.image = image
    }
    
    func getAvgGrade() -> String{
        return String(format: "%.1f", teacher.avgGrade)
    }
}
    
    


