//
//  Doctor.swift
//  ProyectoFinalIOS
//
//  Created by user217673 on 6/16/22.
//

import Foundation

struct Doctor: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var speciality: String
    var treated: Int
}
