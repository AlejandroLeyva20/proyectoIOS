//
//  DoctorRow.swift
//  ProyectoFinalIOS
//
//  Created by user217673 on 6/16/22.
//


import SwiftUI

struct DoctorRow: View {
    @ObservedObject var doctorViewModel: DoctorViewModel

    var speciality:String = "Specialidad"
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.speciality)
                        .foregroundColor(.black)
                        .font(.title)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            ScrollView(.vertical){
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
            }
            .background(Color.gray.opacity(0.2))
        }
    }
}
    
struct DoctorRow_Previews: PreviewProvider {
    static var previews: some View {
        DoctorRow(doctorViewModel: DoctorViewModel())
    }

}
