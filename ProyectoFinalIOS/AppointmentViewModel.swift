//
//  AppointmentViewModel.swift
//  ProyectoFinalIOS
//
//  Created by user222325 on 6/16/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

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
    
    private func setDocument() {
            // [START set_document]
            // Add a new document in collection "cities"
            db.collection("appointments").document("test").setData([
                "date": "User",
                "doctor": "Doctor",
                "user": "yo"
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
            // [END set_document]
        }
}


