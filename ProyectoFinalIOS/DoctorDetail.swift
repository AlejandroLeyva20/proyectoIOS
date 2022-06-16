//
//  DoctorDetail.swift
//  ProyectoFinalIOS
//
//  Created by user217673 on 6/16/22.
//

import SwiftUI

struct DoctorDetail: View {
    var doctor: Doctor
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: doctor.imageURL)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                     .aspectRatio(contentMode: .fit)
                                     .frame(maxWidth: 300, maxHeight: 100)
                                     .clipShape(Circle())
                            case .failure:
                                Image("doctor_generico")
                            @unknown default:
                                EmptyView()
                            }
            }
            Text(doctor.name)
                .font(.title)
            Text(doctor.speciality)
                .font(.title3)
                

            VStack{
                Text("About the doctor")
                    .foregroundColor(.black)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(0..<10) {
                            Text("Item \($0)")
                                .foregroundColor(.blue)
                                .font(.system(size:20))
                        }
                    }
                }.background(Color.gray.opacity(0.1))

                Text(doctor.information)
                    .foregroundColor(.black)
                    .font(.body)
                    .padding(.top, 15)
                    .frame( alignment: .leading)

            }.padding(.top,10)
                .padding(.leading)
            Spacer()
            NavigationLink(
                destination: MakeAppointmentCalendarView(doctor: doctor, authenticationViewModel: AuthenticationViewModel()),
                label: {
                    AppointmentButton()
                }
            ).navigationBarTitle("Doctor Information")
        }
   }
}
struct DoctorDetail_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetail(doctor: Doctor(id: "1", name: "Dr Jose Garcia",speciality: "Medico General",treated: 10, information: "Specialized in kasksakosaklas", imageURL:""), authenticationViewModel: AuthenticationViewModel())
    }
}

struct AppointmentButton: View{
    var body: some View{
        HStack{
            Image(systemName: "calendar")
            Text("Hacer Cita")
                .bold()
        }
        .frame(width: 300, height: 50)
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(12)
        .padding(.bottom, 10)
    }
}
