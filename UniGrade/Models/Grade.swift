//
//  Grade.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 14.08.2024.
//

import Foundation

struct Grade{
    let author: String
    let grade: Double
    let teacher: Teacher
    let date: String
    let description: String
    
    init(author: String, grade: Double, teacher: Teacher, description: String) {
            self.author = author
            self.grade = grade
            self.teacher = teacher
            self.description = description
            self.date = Grade.currentDateString()
        }
        
        static func currentDateString() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            return formatter.string(from: Date())
        }
    
}
