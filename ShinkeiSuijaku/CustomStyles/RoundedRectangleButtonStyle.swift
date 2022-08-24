//
//  RoundedRectangleButtonStyle.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 24/08/2022.
//

import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label.foregroundColor(.black)
        }
        .padding()
        .background(Color.yellow.cornerRadius(30))
        .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}
