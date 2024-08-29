//
//  HomeView.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 21.08.2024.
//

import SwiftUI

struct HomeView: View {
    @State var email = ""
    @State var password = ""
    @State var showRegistration = true
    @State var remember = false
    
    var body: some View {
        VStack{
            if showRegistration{
                RegistrationView(email: $email, password: $password, remember: $remember, showAuthorization: $showRegistration)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                

            }else{
                AuthorizationView(email: $email, password: $password, showRegistration: $showRegistration, Remember: $remember, action: {})
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
        }
        .frame(alignment: .top)
        .background(Resources.Colors.mainColor)

        
    }

}

#Preview {
    HomeView()
}
