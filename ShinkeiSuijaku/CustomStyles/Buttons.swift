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

struct RoundedRectangleSecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label.foregroundColor(.black)
        }
        .padding()
        .background(Color.white.cornerRadius(30))
        .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}
