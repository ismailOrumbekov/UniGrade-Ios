//
//  FeedbackView.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 29.08.2024.
//

import SwiftUI

struct FeedbackView: View {
    @State var open = false
    var body: some View {
        VStack(alignment: open ? .leading : .center){
            Text("Оценка: ").font(.title2).bold().foregroundStyle(.white)
            
            if open{
                gradeDescription
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: open ? .topLeading : .center )
        .frame(height: open ? 360 : 60, alignment: open ? .topLeading : .center)
        .background(Resources.Colors.mainColor, in: .rect(cornerRadius: open ? 20 : 10))
        .padding()
        .onTapGesture {
            withAnimation {
                open.toggle()
            }
        }
    }
    
    
    var gradeDescription:some View{
        VStack(alignment: .leading, spacing: 8){
            Text("Оцените преподователя")
                .font(.title2)
                .bold()
                .foregroundStyle(.white)
            
            Text("Пожалуйста, будьте честны и постарайтесь подробно указать причину оценки")
                .font(.footnote)
                .foregroundStyle(Resources.Colors.secondary)
        }
    }
}

#Preview {
    FeedbackView()
}
