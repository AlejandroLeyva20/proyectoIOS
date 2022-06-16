//
//  DiscardView.swift
//  ProyectoFinalIOS
//
//  Created by user217673 on 6/16/22.
//

import SwiftUI

struct DiscardView: View {
    @Environment(\.dismiss) var discard
    
    var body: some View {
        HStack {
            Spacer()
            Button("Cerrar") {
                discard()
            }
            .tint(.black)
            .padding(.trailing, 12)
        }
        .textFieldStyle(.roundedBorder)
        .buttonStyle(.bordered)
    }
}

struct DiscardView_Previews: PreviewProvider {
    static var previews: some View {
        DiscardView()
    }
}

