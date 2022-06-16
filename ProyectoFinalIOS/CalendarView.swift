//
//  CalendarView.swift
//  ProyectoFinalIOS
//
//  Created by user222325 on 6/16/22.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var appointmentViewModel: AppointmentViewModel
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenido \(authenticationViewModel.user?.email ?? "No user")")
                    .padding(.top, 32)
                Spacer()
                List(appointmentViewModel.appointments) { appointment in
                                                VStack(alignment: .leading) {
                                                    Text( appointment.doctor).font(.title)
                                                    Text(appointment.date).font(.caption)
                                                    HStack{
                                                        Spacer()
                                                        Button("Cancel", role: .destructive){
                                                            print("The appointment has been cancelled")
                                                        }
                                                    }
                                                }
                                            }.navigationBarTitle("Find a Doctor")
                                            .onAppear() {
                                                self.appointmentViewModel.fetchData()
                                            }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Appointments")
            .toolbar {
                Button("Logout") {
                    authenticationViewModel.logout()
                }
            }
        }
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(appointmentViewModel: AppointmentViewModel(), authenticationViewModel: AuthenticationViewModel())
    }
}
