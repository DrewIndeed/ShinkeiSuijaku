/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Le Nguyen Truong An
  ID: s3820098
  Last modified: 29/08/2022
  Acknowledgement:
    + https://stackoverflow.com/
    + https://www.hackingwithswift.com/
    + https://www.raywenderlich.com/
    + https://github.com/
    + https://www.swiftbysundell.com/
    + https://www.chosic.com/
    + https://mixkit.co/
    + https://www.donnywals.com/
    + https://thisdevbrain.com/
*/

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
