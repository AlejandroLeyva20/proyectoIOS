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
                    
                    DoctorRow(doctorViewModel: doctorViewModel)
                        .padding(.bottom, 10)
                        /*Text("Especialidad")
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)*/
                        /*ScrollView(.vertical){
                                ForEach(doctorViewModel.doctors){doctor in
                                    NavigationLink(
                                        destination: DoctorDetail(doctor: doctor),
                                        label: {
                                            DoctorItem(doctor: doctor)
                                        }
                                    )
                                    
                                }.navigationBarTitle("Find a Doctor")
                                    .onAppear() {
                                        self.doctorViewModel.fetchData()
                                    }
                            
                        
                        .background(Color.gray.opacity(0.2))
                    }*/
                    
                    /*List(doctorViewModel.doctors) { doctor in
                                                    VStack(alignment: .leading) {
                                                         NavigationLink(
                                                             destination: DoctorDetail(doctor: doctor),
                                                             label: {
                                                                 DoctorItem(doctor: doctor)
                                                             }
                                                         )
                                                    }
                                                }.navigationBarTitle("Find a Doctor")
                                                .onAppear() {
                                                    self.doctorViewModel.fetchData()
                                                }*/
                    
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
