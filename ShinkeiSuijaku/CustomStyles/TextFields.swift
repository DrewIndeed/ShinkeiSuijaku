//
//  OvalTextFieldStyle.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 24/08/2022.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(15)
            .foregroundColor(Color("TextFieldText"))
            .background(LinearGradient(gradient: Gradient(colors: [Color("TextFieldBg"), Color("TextFieldBg")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(30)
            .shadow(color: .gray, radius: 10)
    }
}
