//
//  EmailRegisterView.swift
//  Login
//
//  Created by user217673 on 6/16/22.
//

import SwiftUI

struct EmailRegisterView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    init(authenticationViewModel: AuthenticationViewModel) {
        self.authenticationViewModel = authenticationViewModel
    }
    
    var body: some View {
        VStack {
            DiscardView()
                .padding(.top, 8)
            Group {
                Text("👋 Bienvenido a")
                Text("DoctorToMe")
                    .bold()
                    .underline()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            Group {
                Text("Regístrate para agendar una cita medica a domicilio")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 32)
                TextField("Añade tu correo electrónico", text: $textFieldEmail)
                TextField("Añade tu contraseña", text: $textFieldPassword)
                Button("Aceptar") {
                    authenticationViewModel.createNewUser(email: textFieldEmail, password: textFieldPassword)
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

struct EmailRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        EmailRegisterView(authenticationViewModel: AuthenticationViewModel())
    }
}
