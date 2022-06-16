//
//  ContentView.swift
//  ProyectoFinalIOS
//
//  Created by user222325 on 6/15/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @ObservedObject var doctorViewModel: DoctorViewModel
    
    @StateObject var appointmentViewModel = AppointmentViewModel()
    
    var body: some View {
        TabView{
            NavigationView {
                VStack {
                    Text("Bienvenido \(authenticationViewModel.user?.email ?? "No user")")
                        .padding(.top, 32)
                    Spacer()
                    
                    List(doctorViewModel.doctors) { doctor in
                                                    VStack(alignment: .leading) {
                                                        Text(doctor.name).font(.title)
                                                        Text(doctor.speciality).font(.caption)
                                                    }
                                                }.navigationBarTitle("Find a Doctor")
                                                .onAppear() {
                                                    self.doctorViewModel.fetchData()
                                                }
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Home")
                .toolbar {
                    Button("Logout") {
                        authenticationViewModel.logout()
                    }
                }
            }
            .tabItem{
                Image(systemName: "house")
            }
            CalendarView(appointmentViewModel: AppointmentViewModel(), authenticationViewModel: AuthenticationViewModel())
                .tabItem{
                    Image(systemName: "calendar")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authenticationViewModel: AuthenticationViewModel(), doctorViewModel: DoctorViewModel())
    }
}
