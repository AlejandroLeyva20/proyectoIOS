//
//  AppointmentViewModel.swift
//  ProyectoFinalIOS
//
//  Created by user222325 on 6/16/22.
//

import Foundation
import FirebaseFirestore

class AppointmentViewModel: ObservableObject {
    
    @Published var appointments = [Appointment]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("appointments").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents obtained")
                return
            }
            
            self.appointments = documents.map { (queryDocumentSnapshot) -> Appointment in
                let data = queryDocumentSnapshot.data()
                let doctor = data["doctor"] as? String ?? ""
                let patient = data["user"] as? String ?? ""
                let date = data["date"] as? Date ?? Date()
                return Appointment(doctor: doctor, date: date, patient: patient)
            }
        }
    }
}


