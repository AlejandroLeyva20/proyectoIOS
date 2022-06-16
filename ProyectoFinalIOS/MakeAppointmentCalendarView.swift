//
//  MakeAppointmentCalendarView.swift
//  ProyectoFinalIOS
//
//  Created by user222325 on 6/16/22.
//

import SwiftUI

struct MakeAppointmentCalendarView: View {
    var doctor: Doctor
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var appointmentViewModel = AppointmentViewModel()
    
    @State var date = Date()
    var hours = ["9:00 AM - 10:00 AM", "10:00 AM - 11:00 AM", "11:00 AM - 12:00 PM", "12:00 PM - 1:00 PM"]
    @State private var selectedHour = "9:00 AM - 10:00 AM"
    
    var body: some View {
        NavigationView{
            VStack{
                Text(doctor.name)
                Text("Calendar")
                Form{
                    Section {
                        DatePicker(
                            "Start date",
                            selection: $date,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                    }
                    Section{
                        Picker("Select an hour", selection: $selectedHour){
                            ForEach(hours, id: \.self){
                                Text($0)
                            }
                        }
                    }
                    Section{
                        Button(action: {
                            appointmentViewModel.setDocument(doctor: doctor.name, date: selectedHour, user: authenticationViewModel.user?.email ?? "No user" )
                        }){
                            Text("Save")
                        }
                    }
                }.frame(maxWidth: .infinity,
                        maxHeight: .infinity)
            }
        }.navigationBarTitle(Text("Make an Appointment"))
            .onAppear()
    }

}
