//
//  Appointment.swift
//  ProyectoFinalIOS
//
//  Created by user222325 on 6/16/22.
//

import Foundation

struct Appointment: Identifiable, Codable {
    var id: String = UUID().uuidString
    var doctor: String
    var date: String
    var patient	: String
}
	
