//
//  TeacherView.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 14.08.2024.
//

import SwiftUI

struct TeacherView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(){
                Image("teacher")
                    .fixedSize()
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(75)
                
                
            }
            .frame(maxWidth: .infinity)
            .padding(.top)
        }
    }
}

#Preview {
    TeacherView()
}
