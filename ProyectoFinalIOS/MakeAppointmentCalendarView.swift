//
//  MakeAppointmentCalendarView.swift
//  ProyectoFinalIOS
//
//  Created by user222325 on 6/16/22.
//

import SwiftUI

struct MakeAppointmentCalendarView: View {
    @State var date = Date()
    var hours = ["9:00 AM - 10:00 AM", "10:00 AM - 11:00 AM", "11:00 AM - 12:00 PM", "12:00 PM - 1:00 PM"]
    @State private var selectedHour = "9:00 AM - 10:00 AM"
    
    var body: some View {
        NavigationView{
            VStack{
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
                        Button(action: {}){
                            Text("Save")
                        }
                    }
                }
            }
        }.navigationBarTitle(Text("Calendar"))
            .onAppear()
    }
}

struct MakeAppointmentCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MakeAppointmentCalendarView()
    }
}
