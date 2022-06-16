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
    @Published var appointmentsEmail = [Appointment]()
    
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
                let date = data["date"] as? String ?? ""
                return Appointment(doctor: doctor, date: date, patient: patient)
            }
        }
    }
    
    func fetchDataSpecific(email: String){
        db.collection("appointments").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents obtained")
                return
            }
            
            self.appointmentsEmail = documents.map { (queryDocumentSnapshot) -> Appointment in
                let data = queryDocumentSnapshot.data()
                let patient = data["user"] as? String ?? ""
                print(patient)
                print(email)
                if patient.compare(email, options: .caseInsensitive) == .orderedSame{
                    let doctor = data["doctor"] as? String ?? ""
                    let date = data["date"] as? String ?? ""
                    return Appointment(doctor: doctor, date: date, patient: patient)
                }
                return Appointment(doctor: "", date: "", patient: "")
            }
        }
    }
    
    func setDocument(doctor: String, date: String, user: String) {
            // [START set_document]
            // Add a new document in collection "cities"
            db.collection("appointments").document(UUID().uuidString).setData([
                "date": date,
                "doctor": doctor,
                "user": user
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


