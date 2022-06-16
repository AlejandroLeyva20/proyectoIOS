//
//  DoctorViewModel.swift
//  ProyectoFinalIOS
//
//  Created by user217673 on 6/16/22.
//

import Foundation
import FirebaseFirestore

class DoctorViewModel: ObservableObject {
    
    @Published var doctors = [Doctor]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("doctors").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents obtained")
                return
            }
            
            self.doctors = documents.map { (queryDocumentSnapshot) -> Doctor in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let speciality = data["speciality"] as? String ?? ""
                let treated = data["treated"] as? Int ?? 0
                return Doctor(name: name, speciality: speciality,treated:treated)
            }
        }
    }
}


