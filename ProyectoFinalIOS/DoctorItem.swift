//
//  DoctorItem.swift
//  ProyectoFinalIOS
//
//  Created by user217673 on 6/16/22.
//

import SwiftUI

struct DoctorItem: View {
    
    var doctor: Doctor
    
    var body: some View {
        HStack(spacing: 16.0){
            //image
            //AsyncImage()
            AsyncImage(url: URL(string: doctor.imageURL)) { phase in
                            switch phase {
                            case .empty:
                                Image("doctor_generico")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(30)
                                    .shadow(radius:5)
                                    .padding(.leading,10)
                            case .success(let image):
                                image.resizable()
                                     .resizable()
                                     .renderingMode(.original)
                                     .aspectRatio(contentMode: .fill)
                                     .frame(width: 120, height: 120)
                                     .cornerRadius(30)
                                     .shadow(radius:5)
                                     .padding(.leading,10)
                            case .failure:
                                Image("doctor_generico")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(30)
                                    .shadow(radius:5)
                                    .padding(.leading,10)
                            @unknown default:
                                EmptyView()
                            }
            }
                
            VStack(alignment: .leading, spacing: 5.0){
                //name
                Text(doctor.name)
                    .foregroundColor(.black)
                    .font(.title)
                Text(doctor.speciality)
                    .foregroundColor(.gray)
                    .font(.title3)
                //atendidos desde
                /*Text("\(doctor.treated) patients treated")
                    .foregroundColor(.gray)
                    .font(.title3)*/
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .leading)
        }
        .border(Color.blue)
        .background(.white)
        .frame(maxWidth: .infinity,
               maxHeight: 130,
               alignment: .leading)
        
        
    }
}

struct DoctorItem_Previews: PreviewProvider {
    static var previews: some View {
        DoctorItem(doctor: Doctor(id: "1", name: "Dr Jose Garcia",speciality: "Medico General",treated: 10, information: "Specialized in kasksakosaklas", imageURL:""))
    }
}
