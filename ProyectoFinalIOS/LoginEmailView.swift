//
//  LoginEmailView.swift
//  Login
//
//  Created by user217673 on 6/16/22.
//

import SwiftUI


import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    var body: some View {
        VStack {
            DiscardView()
                .padding(.top, 8)
            Group {
                Text("DoctorToMe")
                    .bold()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.title)
            .tint(.primary)
            Group {
                Text("\nLoguéate para poder agendar una cita")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 32)
                TextField("Inserta tu correo electrónico", text: $textFieldEmail)
                TextField("Inserta tu contraseña", text: $textFieldPassword)
                Button("Login") {
                    authenticationViewModel.login(email: textFieldEmail, password: textFieldPassword)
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                if let messageError = authenticationViewModel.messageError {
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top, 20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
        }
    }
}
struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
