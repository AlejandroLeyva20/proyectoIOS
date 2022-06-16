//
//  Appointment.swift
//  ProyectoFinalIOS
//
//  Created by user222325 on 6/16/22.
//

import Foundation

struct Appointment: Identifiable {
    var id: String = UUID().uuidString
    var doctor: String
    var date: Date
    var patient	: String
}
	
